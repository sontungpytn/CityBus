using CityBus.Com.DAO;
using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CityBus.Admin
{
    public partial class AdminCity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl liCity = Master.FindControl("liNavCity") as HtmlGenericControl;
            liCity.Attributes.Add("class", "active");
            if (!IsPostBack)
            {
                ShowData();
            }
        }
        protected void ShowData()
        {
            DataTable dt = CityDAO.GetDataCity();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void ShowAll(object sender, EventArgs e)
        {
            DataTable dt = CityDAO.GetDataCity();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string cityID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            CityDAO.DeleteCity(cityID);
            ShowData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cityID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox cityName = (TextBox)row.Cells[1].Controls[0];
            TextBox nationalID = (TextBox)row.Cells[2].Controls[0];
            GridView1.EditIndex = -1;
            //update data
            City c = new City();
            c.CityID = cityID;
            c.CityName = cityName.Text;
            c.NationalID = nationalID.Text;
            CityDAO.UpdateCity(c);
            ShowData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowData();
        }
        /// <summary>
        /// Search city
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SearchCity(object sender, EventArgs e)
        {
            string cityName = txtSearch.Text;
            DataTable searchTBL = CityDAO.GetDataCityByName(txtSearch.Text.Trim());
            if (searchTBL.Rows.Count > 0)
            {
                GridView1.DataSource = searchTBL;
                GridView1.DataBind();
            }
            else
            {
                searchTBL.Rows.Add(searchTBL.NewRow());
                GridView1.DataSource = searchTBL;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        /// <summary>
        /// Add new city
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string cityID = txtID.Text;
            string cityName = txtName.Text;
            string nationalID = txtNationalID.Text;
            if (CityDAO.DulicateCity(cityID))
            {
                phError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "CityID has been dupplicated!";
                phError.Controls.Add(error);
                phError.Controls.Add(new LiteralControl("</div>"));
                return;
            }
            else
            {
                City c = new City();
                c.CityID = cityID;
                c.CityName = cityName;
                c.NationalID = nationalID;
                if (CityDAO.AddCity(c))
                {
                    Session["addOK"] = "New CITY has been added!";
                    Response.Redirect("AdminUser.aspx");
                }
            }

        }
    }
}