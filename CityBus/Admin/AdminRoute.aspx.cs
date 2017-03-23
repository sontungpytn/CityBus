using CityBus.Com.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CityBus.Com.Entities;

namespace CityBus.Admin
{
    public partial class AdminRoute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl liCity = Master.FindControl("liNavRoute") as HtmlGenericControl;
            liCity.Attributes.Add("class", "active");
            if (!IsPostBack)
            {
                ShowDataRoute();
            }
        }
        //search route by id
        protected void SearchRoute(object sender, EventArgs e)
        {
            DataTable searchTBL = RouteDAO.GetDataRouteByID(txtSearch.Text.Trim());
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
        //Show all 
        protected void ShowAll(object sender, EventArgs e)
        {
            DataTable dt = RouteDAO.GetDataRoute();
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
        protected void ShowDataRoute()
        {
            DataTable dt = RouteDAO.GetDataRoute();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowDataRoute();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowDataRoute();
        }
        //update
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string routeID = GridView1.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox duration = (TextBox)row.Cells[2].Controls[0];
            GridView1.EditIndex = -1;
            //update data
            RouteDAO.UpdateRoute(routeID, Convert.ToInt32(duration.Text));
            ShowDataRoute();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowDataRoute();
        }
    }
}