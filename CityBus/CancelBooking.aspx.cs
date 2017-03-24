using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityBus.Com.DAO;
namespace CityBus
{
    public partial class CancelBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("Index.aspx");
            }else
            {
                BookingDAO.DeleteBooking(id);
                Response.Redirect("Profile.aspx");
            }
        }
    }
}