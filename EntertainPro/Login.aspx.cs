using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class Login : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        // ALTER TABLE Users ADD Role VARCHAR(20) NOT NULL DEFAULT 'User';
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != "" && txtPassword.Text != "")
            {
                getcon();
                cmd = new SqlCommand(
                    "SELECT * FROM Users WHERE Email='" + txtEmail.Text + "' AND Password='" + txtPassword.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {

                    Session["UserEmail"] = dr["Email"].ToString();
                    Session["unm"] = dr["FirstName"].ToString();
                    Session["UserImage"] = dr["ImagePath"].ToString();
                    Session["UserID"] = dr["UserID"].ToString();
                    Session["Role"] = dr["Role"].ToString();

                    string role = dr["Role"].ToString().ToLower();

                    if (role == "admin")
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else if (role == "user")
                    {
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Unknown role.";
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid username or password.";
                }
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter email and password.";
            }
        }
    }
}
