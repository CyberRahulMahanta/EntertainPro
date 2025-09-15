using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EntertainPro
{
    public partial class Payment : Page
    {
        public string RazorpayKey;
        public string AmountInPaise;
        public string OrderId;
        public string CustomerName;
        public string CustomerEmail;
        public string CustomerContact;
        public string CallbackUrl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string showingId = Request.QueryString["showingId"];
                string seats = Request.QueryString["seats"];
                AmountInPaise = Request.QueryString["amount"];

                if (string.IsNullOrEmpty(showingId) || string.IsNullOrEmpty(seats) || string.IsNullOrEmpty(AmountInPaise))
                {
                    Response.Redirect("Default.aspx?error=invalid_payment_details");
                    return;
                }

                FetchUserDetails(Session["UserID"].ToString());
                CreateRazorpayOrder();

                string successUrl = $"PaymentSuccess.aspx?showingId={showingId}&seats={seats}&amount={AmountInPaise}";
                CallbackUrl = Request.Url.GetLeftPart(UriPartial.Authority) + ResolveUrl(successUrl);

                RegisterCheckoutScript();
            }
        }

        private void FetchUserDetails(string userId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            using (var con = new SqlConnection(connStr))
            {
                string query = "SELECT (FirstName + ' ' + LastName) AS Username, Email, Phone FROM Users WHERE UserID = @UserID";
                using (var cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    con.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            CustomerName = reader["Username"].ToString();
                            CustomerEmail = reader["Email"].ToString();
                            CustomerContact = reader["Phone"].ToString();
                        }
                    }
                }
            }
        }

        private void CreateRazorpayOrder()
        {
            RazorpayKey = ConfigurationManager.AppSettings["RazorpayKeyId"];
            string razorpaySecret = ConfigurationManager.AppSettings["RazorpayKeySecret"];
            try
            {
                var client = new RazorpayClient(RazorpayKey, razorpaySecret);
                var options = new Dictionary<string, object>
                {
                    { "amount", AmountInPaise },
                    { "currency", "INR" },
                    { "receipt", "receipt_#" + Guid.NewGuid().ToString().Substring(0, 8) },
                    { "payment_capture", 1 }
                };
                Order order = client.Order.Create(options);
                OrderId = order["id"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("Razorpay Error: " + ex.Message);
            }
        }

        private void RegisterCheckoutScript()
        {
            string script = $@"
            <script>
                var options = {{
                    'key': '{RazorpayKey}', 'amount': '{AmountInPaise}', 'currency': 'INR',
                    'name': 'Your Cinema Brand', 'description': 'Movie Ticket Booking',
                    'order_id': '{OrderId}',
                    'handler': function (response) {{
                        var form = document.createElement('form');
                        form.method = 'POST';
                        form.action = '{CallbackUrl}';
                        var fields = {{
                            'razorpay_payment_id': response.razorpay_payment_id,
                            'razorpay_order_id': response.razorpay_order_id,
                            'razorpay_signature': response.razorpay_signature
                        }};
                        for (var key in fields) {{
                            var hiddenField = document.createElement('input');
                            hiddenField.type = 'hidden'; hiddenField.name = key; hiddenField.value = fields[key];
                            form.appendChild(hiddenField);
                        }}
                        document.body.appendChild(form);
                        form.submit();
                    }},
                    'prefill': {{ 'name': '{CustomerName}', 'email': '{CustomerEmail}', 'contact': '{CustomerContact}' }},
                    'theme': {{ 'color': '#F37254' }},
                    'modal': {{ 'ondismiss': function() {{
                        alert('Payment was cancelled.');
                        window.location.href = 'SeatLayout.aspx?showingId={Request.QueryString["showingId"]}';
                    }}}}
                }};
                var rzp1 = new Razorpay(options);
                window.onload = function() {{ rzp1.open(); }};
            </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "RazorpayScript", script, false);
        }
    }
}