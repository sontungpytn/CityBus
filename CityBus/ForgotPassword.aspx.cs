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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lbMessage.Text = "";
            string email = txtEmail.Text;
            string confirm = txtConfirm.Text;
            if (!email.Equals(confirm))
            {
                lbMessage.Text = "Confirm email does not match";
                return;
            }
            if (!UserDAO.DulicateEmail(email))
            {
                lbMessage.Text = "Email does not exist";
                return;
            }
            else
            {
                try
                {
                    string newPass = DAO.RandomID();
                    SendMail sm = new SendMail();
                    sm.MailTo = email;
                    sm.Subject = "New City Bus password";
                    UserInfo user = UserDAO.GetUserByEmail(email);
                    sm.Body = "<h1>Hi " + user.Name + "</h1>" +
                        "<p>You recently request to reset your password for City Bus account. Here is your new password:</p>"+
                        "<h1 style='color: red'>" + newPass+"</h1>"+
                        "<p>Thanks, <br> City Bus Team.</p>";
                    sm.Send();
                    lbMessage.Text = "New password has been sent to your email.";
                    user.Password = newPass;
                    UserDAO.UpdateUser(user);
                }
                catch (Exception)
                {

                    lbMessage.Text = "Can not send email. Try again.";
                }


            }
        }
    }
}