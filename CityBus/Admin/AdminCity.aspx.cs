using System;
using System.Collections.Generic;
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
        }
    }
}