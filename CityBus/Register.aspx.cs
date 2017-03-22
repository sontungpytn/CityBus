using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using CityBus.Com.Entities;
using CityBus.Com.DAO;

namespace CityBus
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string password = txtPassword.Text;
            string email = txtEmail.Text;
            string confirm = cfPassword.Text;
            if (name.Length<6 || password.Length<6 || !password.Equals(confirm))
            {
                return;
            }
            if (!new EmailAddressAttribute().IsValid(email))
            {
                return;
            }
            if (UserDAO.DulicateEmail(email))
            {
                lbMessage.Text = "Duplicated email!";
                return;
            }
            UserInfo user = new UserInfo();
            user.Role = false;
            user.Email = email;
            user.Password = password;
            user.Name = name;
            UserDAO.AddUser(user);
            lbMessage.Text = "Sign up successfully";
            if (Session["redirectUrl"] != null)
            {
                Response.Redirect((string)Session["redirectUrl"]);
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }
        
    }
}