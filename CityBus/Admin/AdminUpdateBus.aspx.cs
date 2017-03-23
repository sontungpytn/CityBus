using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityBus.Com.DAO;
using System.Data;
using CityBus.Com.Entities;

namespace CityBus.Admin
{
    public partial class AdminUpdateBus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bus b = (Bus)Session["bus"];
                DataTable dt = RouteDAO.GetDataRoute();
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "RouteID";
                DropDownList1.DataValueField = "Route";
                DropDownList1.DataBind();
                txtID.Text = b.BusID;
                txtBusName.Text = b.BusName;
                txtFare.Text = b.Fare.ToString();
                txtSeat.Text = b.TotalSeat.ToString();
                DropDownList1.SelectedIndexChanged += DropDownList1_SelectedIndexChanged;
                DropDownList1_SelectedIndexChanged1(null, null);
            }
        }

        private void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtRouteName.Text = DropDownList1.SelectedValue.ToString();
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtRouteName.Text = DropDownList1.SelectedValue.ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}