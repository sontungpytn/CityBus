﻿using CityBus.Com.DAO;
using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CityBus
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            
            string password = txtPassword.Text;

            UserInfo user = UserDAO.SearchUser(email, password);

            if (user != null)
            {
                lbMessage.Text = "Login successfully";
                Session.Add("user", user);
                if (Session["redirectUrl"] != null)
                {
                    Response.Redirect((string)Session["redirectUrl"]);
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
            else
            {
                lbMessage.Text = "Email or password is incorrect";
            }
            
        }
    }
}