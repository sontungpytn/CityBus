using CityBus.Com.DAO;
using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CityBus.Admin
{
    public partial class AdminAddBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = RouteDAO.GetDataRoute();
                ddlRoute.DataSource = dt;
                ddlRoute.DataTextField = "RouteID";
                ddlRoute.DataValueField = "Route";
                ddlRoute.DataBind();
                ddlRoute_SelectedIndexChanged(null, null);
            }
        }
        protected void AlertMessage(string message, string className)
        {
            phError.Controls.Add(new LiteralControl("<div class='" + className + "'>"));
            Label error = new Label();
            error.Text = message;
            phError.Controls.Add(error);
            phError.Controls.Add(new LiteralControl("</div>"));
            return;
        }
        protected void AddBus(object sender, EventArgs e)
        {
            string name = txtBusName.Text;
            string routeID = ddlRoute.SelectedItem.Text;
            string f = txtFare.Text;
            string date = txtDate.Value;
            string seat = txtSeat.Text;
            string time = txtTime.Text;
            double fare;
            int totalSeat;
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(f) || string.IsNullOrEmpty(date) ||
                string.IsNullOrEmpty(time) || string.IsNullOrEmpty(seat))
            {
                AlertMessage("All data must not be empty!", "alert alert-danger");
            }
            else if (!double.TryParse(txtFare.Text, out fare) || fare <= 0)
            {
                AlertMessage("Fare must be a possitive number!", "alert alert-danger");
            }
            else if (!int.TryParse(seat, out totalSeat) || totalSeat <= 0)
            {
                AlertMessage("Total seat must be a possitive number!", "alert alert-danger");
            }
            else
            {
                SqlConnection conn = DAO.Connection;
                SqlCommand cmd = conn.CreateCommand();
                conn.Open();

                Bus b = new Bus();
                // create random and check BusID duplicate
                string bid;
                do
                {
                    cmd.Parameters.Clear();
                    bid = DAO.RandomID();
                    cmd.CommandText = "SELECT * FROM Buses WHERE BusID = @id";
                    cmd.Parameters.AddWithValue("@id", bid);
                    SqlDataReader reader = cmd.ExecuteReader();
                    bool exist = reader.Read();
                    reader.Close();
                    if (!exist) break;
                } while (true);
                //insert bus
                b.BusID = bid;
                b.BusName = name;
                b.RouteID = routeID;
                b.Fare = fare;
                b.TotalSeat = totalSeat;
                BusDAO.AddBus(b);
                // create random and check BusDetailID duplicate
                string bdID;
                do
                {
                    cmd.Parameters.Clear();
                    bdID = DAO.RandomID();
                    cmd.CommandText = "SELECT * FROM BusDetail WHERE BusDetailID = @bdid";
                    cmd.Parameters.AddWithValue("@bdid", bdID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    bool exist = reader.Read();
                    reader.Close();
                    if (!exist) break;
                } while (true);
                BusDetail bd = new BusDetail();
                bd.BusDetailID = bdID;
                bd.BusID = bid;
                bd.DepartureTime = time;
                bd.DepartureDate = Convert.ToDateTime(date);
                bd.AvailableSeat = totalSeat;
                BusDetailDAO.AddBusDetail(bd);
                conn.Close();
                Response.Redirect("AdminBus.aspx");
            }
        }
        protected void ddlRoute_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRouteName.Text = ddlRoute.SelectedValue.ToString();
            string id = ddlRoute.SelectedItem.Text;
            ////get duration of bus
            //SqlConnection conn = DAO.Connection;
            //conn.Open();
            //string sql = "SELECT RouteID, " +
            //             " ((SELECT CityName FROM CITIES WHERE CityID = FromCityID) + ' - '" +
            //             " + (SELECT CityName FROM CITIES WHERE CityID = ToCityID)) as Route, Duration" +
            //             " FROM ROUTES WHERE RouteID = \'" + id + "\'";
            //SqlCommand cmd = new SqlCommand(sql, conn);
            //SqlDataReader dr = cmd.ExecuteReader();
            //int duration = 0;
            //if (dr.Read())
            //{
            //    duration = int.Parse(dr[2].ToString());
            //}
            //conn.Close();

        }
    }
}