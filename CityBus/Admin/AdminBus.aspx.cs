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
    public partial class AdminBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl liBus = Master.FindControl("liNavBus") as HtmlGenericControl;
            liBus.Attributes.Add("class", "active");
            if (!IsPostBack)
                ShowData();
        }
        protected void ShowData()
        {
            DataTable dt = BusDAO.GetBus();
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
            ShowData();
        }
        protected void AddBus(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddBus.aspx");
        }
        protected void UpdateBus(object sender, EventArgs e)
        {
            LinkButton lkUpdate = sender as LinkButton;
            string busID = lkUpdate.CommandArgument;
            Bus b = BusDAO.GetBusByID(busID);
            Session.Add("bus", b);
            Response.Redirect("AdminUpdateBus.aspx");
        }
        protected void ViewBusDetail(object sender, EventArgs e)
        {
            LinkButton lkViewDetail = sender as LinkButton;
            string busID = lkViewDetail.CommandArgument;
            Response.Redirect("AdminBusDetail.aspx?id=" + busID);
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }
    }
}