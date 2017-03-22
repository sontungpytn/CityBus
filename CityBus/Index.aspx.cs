using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityBus.Com.DAO;
using System.Data;
using System.Data.SqlClient;
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
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string fromCity = cboFromCity.SelectedValue.ToString();
            string toCity = cboToCity.SelectedValue.ToString();
            string date = txtDepartureDate.Text;
            //
            DateTime departureDate = Convert.ToDateTime(date);
            DataTable dt = BusDAO.GetDataBusByRoute(fromCity, toCity, departureDate);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}