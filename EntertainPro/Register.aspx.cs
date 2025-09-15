using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class Register : System.Web.UI.Page
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

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (!chkTerms.Checked)
            {
                lblMessage.Text = "Please agree to the Terms of Service.";
                lblMessage.ForeColor = System.Drawing.Color.Yellow;
                return;
            }

            getcon();
            cmd = new SqlCommand("insert into Users (FirstName, LastName, Email, Password, Phone, DOB) values ('" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtEmail.Text + "', '" + txtPassword.Text + "','" + txtPhone.Text + "','" + txtDOB.Text + "')", con);
            int rows = cmd.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);

            if (rows > 0)
            {
                lblMessage.Text = "Registration successful! Please login.";
                lblMessage.ForeColor = System.Drawing.Color.LightGreen;
                Response.Redirect("login.aspx");
            }
            else
            {
                lblMessage.Text = "Something went wrong. Try again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}