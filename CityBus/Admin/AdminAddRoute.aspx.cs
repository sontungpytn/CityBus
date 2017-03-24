using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CityBus.Com.DAO;
using CityBus.Com.Entities;
namespace CityBus.Admin
{
    public partial class AdminAddRoute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = CityDAO.GetDataCity();
                txtRouteID.Text = DAO.RandomID();

                cbFromCity.DataSource = dt;
                cbFromCity.DataValueField = "CityID";
                cbFromCity.DataTextField = "CityName";
                cbFromCity.DataBind();

                cbToCity.DataSource = dt;
                cbToCity.DataValueField = "CityID";
                cbToCity.DataTextField = "CityName";
                cbToCity.DataBind();

                txtRoute.Text = cbFromCity.SelectedItem.ToString() + " to " + cbToCity.SelectedItem.ToString();
            }

            btnSave.Click += BtnSave_Click;
            btnBack.Click += BtnBack_Click;
            cbFromCity.SelectedIndexChanged += CbFromCity_SelectedIndexChanged;
            cbToCity.SelectedIndexChanged += CbToCity_SelectedIndexChanged;
        }


        private void BtnBack_Click(object sender, EventArgs e)
        {

        }

        private void BtnSave_Click(object sender, EventArgs e)
        {
            Route route = new Route();
            route.RouteID = txtRouteID.Text;
            route.FromCityID = cbFromCity.SelectedValue;
            route.ToCityID = cbToCity.SelectedValue;
            int duration;
            if (int.TryParse(txtDuration.Text, out duration))
            {
                route.Duration = duration;
                RouteDAO.addRoute(route);
            }
            else
            {
                durationError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "Duration must be number !";
                durationError.Controls.Add(error);
                durationError.Controls.Add(new LiteralControl("</div>"));
            }
        }

        private void CbToCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRoute.Text = cbFromCity.SelectedItem.ToString() + " to " + cbToCity.SelectedItem.ToString();
        }

        private void CbFromCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRoute.Text = cbFromCity.SelectedItem.ToString() + " to " + cbToCity.SelectedItem.ToString();
        }

      
    }
}