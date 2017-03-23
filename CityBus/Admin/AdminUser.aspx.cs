using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CityBus.Com.DAO;
using CityBus.Com.Entities;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

namespace CityBus.Admin
{
    public partial class AdminUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl liCity = Master.FindControl("liNavUser") as HtmlGenericControl;
            liCity.Attributes.Add("class", "active");
            if (!IsPostBack)
                ShowData();
        }
        protected void SearchUser(object sender, EventArgs e)
        {
            DataTable searchTBL = UserDAO.GetDataUsersByEmail(txtSearch.Text.Trim());
            if (searchTBL.Rows.Count > 0)
            {
                GridView1.DataSource = searchTBL;
                GridView1.DataBind();
            }
            else
            {
                searchTBL.Rows.Add(searchTBL.NewRow());
                GridView1.DataSource = searchTBL;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void ShowData()
        {

            DataTable dt = UserDAO.GetDataUsers();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string email = GridView1.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox password = (TextBox)row.Cells[1].Controls[0];
            TextBox name = (TextBox)row.Cells[2].Controls[0];
            GridView1.EditIndex = -1;
            //update data
            UserInfo u = new UserInfo();
            u.Password = password.Text;
            u.Name = name.Text;
            u.Email = email;
            UserDAO.UpdateUser(u);
            ShowData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            UserInfo u = (UserInfo)Session["user"];
            string email = GridView1.DataKeys[e.RowIndex].Value.ToString();
            if (u.Email.Equals(email))
            {
                phError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "Cannot delete admin!";
                phError.Controls.Add(error);
                phError.Controls.Add(new LiteralControl("</div>"));
                return;
            }
            else
            {
                UserDAO.DeleteUser(email);
                ShowData();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected bool validEmail(string email)
        {
            try
            {
                MailAddress m = new MailAddress(email);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string name = txtName.Text;
            bool role = chkAdmin.Checked;
            if (UserDAO.DulicateEmail(email))
            {
                phError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "Email has been dupplicated!";
                phError.Controls.Add(error);
                phError.Controls.Add(new LiteralControl("</div>"));
                return;
            }
            else if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(name))
            {
                phError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "All data must not be empty!";
                phError.Controls.Add(error);
                phError.Controls.Add(new LiteralControl("</div>"));
                return;
            }
            else if (!validEmail(email))
            {
                phError.Controls.Add(new LiteralControl("<div class='alert alert-danger'>"));
                Label error = new Label();
                error.Text = "Your email is invalid!";
                phError.Controls.Add(error);
                phError.Controls.Add(new LiteralControl("</div>"));
                return;
            }
            else
            {
                UserInfo u = new UserInfo();
                u.Email = email;
                u.Password = password;
                u.Name = name;
                u.Role = role;
                if (UserDAO.AddUser(u))
                {
                    Session["addOK"] = "New USER has been added!";
                    Response.Redirect("AdminUser.aspx");
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowData();
        }
    }
}