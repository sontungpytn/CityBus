﻿using System;
using System.Collections.Generic;
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
        }
    }
}