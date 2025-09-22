using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace EntertainPro
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager
                                  .ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // nothing special on load
        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (!DoesUserExist(email))
            {
                lblMessage.CssClass = "text-red-300 text-center block mb-4";
                lblMessage.Text = "❌ Email not found!";
                return;
            }

            // create 6 digit OTP
            Random rand = new Random();
            string otp = rand.Next(100000, 999999).ToString();
            Session["OTP"] = otp;
            Session["Email"] = email;

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("rmahanta175@rku.ac.in", "Entertain Pro");
                mail.To.Add(email);
                mail.Subject = "🔑 EntertainPro - Password Reset OTP";
                mail.IsBodyHtml = true;

                mail.Body = $@"
<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <style>
    @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css');

    body {{
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #1A1A1A;
      color: #fff;
      text-align: center;
      padding: 30px;
    }}
    .card {{
      background: linear-gradient(135deg, #ff4444, #ff7f7f);
      border-radius: 15px;
      padding: 40px;
      display: inline-block;
      box-shadow: 0 8px 20px rgba(0,0,0,0.3);
      max-width: 500px;
    }}
    .icon {{
      font-size: 60px;
      color: #fff;
      margin-bottom: 20px;
    }}
    h1 {{
      font-size: 24px;
      margin-bottom: 20px;
      color: #fff;
    }}
    p {{
      font-size: 16px;
      margin-bottom: 30px;
      color: #FFEFEF;
    }}
    .otp {{
      font-size: 32px;
      font-weight: bold;
      letter-spacing: 4px;
      background: #fff;
      color: #ff4444;
      padding: 15px 25px;
      border-radius: 10px;
      display: inline-block;
      margin-bottom: 20px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }}
    .footer {{
      font-size: 12px;
      color: #FFD6D6;
      margin-top: 20px;
    }}
    .button {{
      display: inline-block;
      padding: 12px 25px;
      background-color: #ff4444;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      margin-top: 15px;
      transition: background 0.3s ease;
    }}
    .button:hover {{
      background-color: #ff1a1a;
    }}
  </style>
</head>
<body>
  <div class='card'>
    <!-- Icon instead of logo -->
    <i class='fas fa-film icon'></i>
    
    <h1>Password Reset Request</h1>
    <p>We received a request to reset your EntertainPro account password.</p>
    
    <!-- OTP Box -->
    <div class='otp'>{otp}</div>
    
    <p>Enter this OTP in the app to reset your password. This OTP is valid for 10 minutes only.</p>
   
    
    <div class='footer'>
      If you did not request a password reset, please ignore this email.
    </div>
  </div>
</body>
</html>
";



                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("rmahanta175@rku.ac.in", "iyfzielgmirkgatr");
                smtp.EnableSsl = true;
                smtp.Send(mail);

                lblMessage.CssClass = "text-green-300 text-center block mb-4";
                lblMessage.Text = "✅ OTP sent to your email.";
                pnlRequestOtp.Visible = false;
                pnlVerifyOtp.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "text-red-300 text-center block mb-4";
                lblMessage.Text = "❌ Failed to send OTP: " + ex.Message;
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (Session["OTP"] == null || Session["Email"] == null)
            {
                lblMessage.CssClass = "text-red-300 text-center block mb-4";
                lblMessage.Text = "❌ Session expired. Please request OTP again.";
                pnlRequestOtp.Visible = true;
                pnlVerifyOtp.Visible = false;
                return;
            }

            string enteredOtp = otp1.Text.Trim() +
                                otp2.Text.Trim() +
                                otp3.Text.Trim() +
                                otp4.Text.Trim() +
                                otp5.Text.Trim() +
                                otp6.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();
            string confirmPass = txtConfirmPassword.Text.Trim();
            string email = Session["Email"].ToString();

            if (newPass != confirmPass)
            {
                lblMessage.CssClass = "text-red-300 text-center block mb-4";
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            if (enteredOtp == Session["OTP"].ToString())
            {
                if (UpdatePassword(email, newPass))
                {
                    lblMessage.CssClass = "text-green-300 text-center block mb-4";
                    lblMessage.Text = "Password reset successfully!";
                    Session.Clear();
                    pnlVerifyOtp.Visible = false;
                }
                else
                {
                    lblMessage.CssClass = "text-red-300 text-center block mb-4";
                    lblMessage.Text = "Error updating password.";
                }
            }
            else
            {
                lblMessage.CssClass = "text-red-300 text-center block mb-4";
                lblMessage.Text = "Invalid OTP.";
            }
        }

        private bool DoesUserExist(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string q = "SELECT COUNT(*) FROM Users WHERE Email='" + email + "'";
                SqlCommand cmd = new SqlCommand(q, con);
                con.Open();
                return (int)cmd.ExecuteScalar() > 0;
            }
        }
        private bool UpdatePassword(string email, string newPass)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string q = "UPDATE Users SET Password='" + newPass + "' WHERE Email='" + email + "'";
                SqlCommand cmd = new SqlCommand(q, con);
                con.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }
}
