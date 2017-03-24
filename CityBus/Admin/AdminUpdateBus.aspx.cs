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
                //BusID
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "RouteID";
                DropDownList1.DataValueField = "Route";
                DropDownList1.DataBind();
                DropDownList1.Items.FindByText(b.RouteID).Selected = true;
                txtID.Text = b.BusID;
                txtBusName.Text = b.BusName;
                txtFare.Text = b.Fare.ToString();
                txtSeat.Text = b.TotalSeat.ToString();
                DropDownList1_SelectedIndexChanged1(null, null);
            }
        }


        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtRouteName.Text = DropDownList1.SelectedValue.ToString();
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
        protected void Cancel(object sender, EventArgs e)
        {
            Response.Redirect("AdminBus.aspx");
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string busID = txtID.Text.Trim();
            string routeID = DropDownList1.SelectedItem.Text.Trim();
            string name = txtBusName.Text.Trim();
            string fare = txtFare.Text.Trim();
            string totalSeat = txtSeat.Text.Trim();
            double f;
            int seat;
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(fare) || string.IsNullOrEmpty(totalSeat))
            {
                AlertMessage("All data must not be empty!", "alert alert-danger");
            }
            else if (!double.TryParse(fare, out f))
            {
                AlertMessage("Fare must be a number!", "alert alert-danger");
            }
            else if (!int.TryParse(totalSeat, out seat))
            {
                AlertMessage("Total seat must be a number!", "alert alert-danger");
            }
            else
            {
                Bus b = new Bus();
                b.BusID = busID;
                b.BusName = name;
                b.RouteID = routeID;
                b.Fare = double.Parse(fare);
                b.TotalSeat = Convert.ToInt32(seat);
                if (BusDAO.UpdateBus(b))
                {
                    AlertMessage("Bus has been updated!", "alert alert-success");
                    Response.Redirect("AdminBus.aspx");
                }
            }
        }
    }
}