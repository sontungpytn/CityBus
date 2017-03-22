using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using CityBus.Com.DAO;

namespace CityBus.Admin
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl liHome = Master.FindControl("liNavUser") as HtmlGenericControl;
            liHome.Attributes.Add("class", "active");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string command = e.CommandName;
            string email = e.CommandArgument.ToString();
            switch (command)
            {
                case "Select":
                    Response.Redirect("AdminBooking.aspx?user=" + email);
                    break;
                case "Delete":

                    break;
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string email = GridView1.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            Label lblEmail = (Label)row.FindControl("Email");
            TextBox txtPassword = row.FindControl("Password") as TextBox;
            TextBox txtName = row.FindControl("Name") as TextBox;
            TextBox role = row.FindControl("Role") as TextBox;
            string sql = "UPDATE USERS" +
                         " SET Password = @password" +
                         " SET Name = @name" +
                         " SET Role = @role" +
                         " WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@password", txtPassword);
            cmd.Parameters.AddWithValue("@name", txtName);
            cmd.Parameters.AddWithValue("@role", role);
            cmd.Parameters.AddWithValue("@email", email);
            DAO.ExecuteCommand(cmd);
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }
    }
}