using CityBus.Com.DAO;
using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CityBus
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Session["needLoginMsg"] = "You need login first";
                Session["redirectUrl"] = "ChangePassword.aspx";
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lbMessage.Text = "";
            string oldPass = txtOld.Text;
            string newPass = txtNew.Text;
            string confirm = txtConfirm.Text;
            if (string.IsNullOrWhiteSpace(oldPass) || string.IsNullOrWhiteSpace(newPass) || string.IsNullOrWhiteSpace(confirm))
            {
                lbMessage.Text = "Please fill all fields";
                return;
            }
            if (!newPass.Equals(confirm))
            {
                lbMessage.Text = "Re-type new password do not match";
                return;
            }
            UserInfo user = (UserInfo)Session["user"];
            if (UserDAO.SearchUser(user.Email, oldPass) == null)
            {
                lbMessage.Text = "Old password do not match";
                return;
            }
            UserDAO.UpdateUserPassword(user.Email, newPass);
            lbMessage.Text = "Update password successfully";
        }
    }
}