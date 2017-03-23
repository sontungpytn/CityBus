using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityBus.Com.DAO;
using System.Data;
using System.Data.SqlClient;
using CityBus.Com.Entities;

namespace CityBus
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = CityDAO.GetDataCity();
                int t = dt.Rows.Count;
                cboFromCity.DataSource = CityDAO.GetDataCity();
                cboFromCity.DataTextField = "CityName";
                cboFromCity.DataValueField = "CityID";
                cboToCity.DataSource = CityDAO.GetDataCity();
                cboToCity.DataTextField = "CityName";
                cboToCity.DataValueField = "CityID";
                cboFromCity.DataBind();
                cboToCity.DataBind();
            }

            if (Session["msg"] != null)
            {
                string msg = Session["msg"].ToString();
                lbNeedSearch.Text = msg;
                Session.Remove("msg");
            }
            else
            {
                lbNeedSearch.Text = "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string fromCity = cboFromCity.SelectedValue.ToString();
            string toCity = cboToCity.SelectedValue.ToString();
            string date = txtDepartureDate.Text;
            string passnum = txtPassengerNumber.Text;

            try
            {
                lbRequiredDate.Text = "";
                int num;
                if (int.TryParse(passnum, out num))
                {
                    DateTime departureDate = Convert.ToDateTime(date);
                    DataTable dt = BusDAO.GetDataBusByRoute(fromCity, toCity, departureDate, "bd.DepartureTime",num);
                    if (dt.Rows.Count == 0)
                    {
                        lbError.Text = "Not found any bus";
                        return;
                    }else
                    {
                        lbError.Text = "";
                    }
                    DataTable dtDisplay = GetDataDisplay(dt);

                    gvResult.DataSource = dtDisplay;
                    gvResult.DataBind();
                }
                else
                {
                    lbNumberRequired.Text = "Please enter valid number!";
                }

                


            }
            catch (Exception ex)
            {
                lbRequiredDate.Text = "Please choose departure date";
            }



        }
        private DataTable GetDataDisplay(DataTable dt)
        {
            DataTable dtDisplay = new DataTable();
            DataColumn dtColumn = new DataColumn();
            dtColumn.ColumnName = "Bus Name";
            dtDisplay.Columns.Add(dtColumn);
            dtColumn = new DataColumn();
            dtColumn.ColumnName = "Departure Time";
            dtDisplay.Columns.Add(dtColumn);
            dtColumn = new DataColumn();
            dtColumn.ColumnName = "Arrival Time";
            dtDisplay.Columns.Add(dtColumn);
            dtColumn = new DataColumn();
            dtColumn.ColumnName = "Available Seat";
            dtDisplay.Columns.Add(dtColumn);
            dtColumn = new DataColumn();
            dtColumn.ColumnName = "Fare";
            dtDisplay.Columns.Add(dtColumn);
            dtColumn = new DataColumn();
            dtColumn.ColumnName = "BusDetailID";

            dtDisplay.Columns.Add(dtColumn);
            foreach (DataRow dr in dt.Rows)
            {
                DataRow newRow = dtDisplay.NewRow();
                newRow[0] = dr[0].ToString();
                newRow[1] = dr[1].ToString();

                string[] time = dr[1].ToString().Split(':');
                int end = int.Parse(time[0]) * 60 + int.Parse(time[1]) + int.Parse(dr[2].ToString());
                newRow[2] = end / 60 + ":" + end % 60;
                newRow[3] = dr[3].ToString();
                newRow[4] = dr[4].ToString();
                newRow[5] = dr[5].ToString(); ;


                dtDisplay.Rows.Add(newRow);
            }
            return dtDisplay;
        }



        protected void gvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Book"))
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                SearchResult sr = new SearchResult();
                sr.BusName = rowSelect.Cells[0].Text;
                sr.DepartureTime = rowSelect.Cells[1].Text;
                sr.ArrivalTime = rowSelect.Cells[2].Text;
                sr.AvailableSeat = int.Parse(rowSelect.Cells[3].Text);
                sr.Fare = double.Parse(rowSelect.Cells[4].Text);
                sr.DetailID = rowSelect.Cells[6].Text;
                sr.FromCity = cboFromCity.SelectedItem.ToString();
                sr.ToCity = cboToCity.SelectedItem.ToString();
                sr.passNum = int.Parse(txtPassengerNumber.Text);
                Session.Add("searchResult", sr);
                Response.Redirect("BookingPage.aspx");
            }
        }
    }
}