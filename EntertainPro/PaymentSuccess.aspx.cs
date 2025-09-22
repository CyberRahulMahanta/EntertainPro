using QRCoder;
using Razorpay.Api;
using Razorpay.Api.Errors;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            try
            {
                // Retrieve data from Razorpay's POST and our Query String
                string paymentId = Request.Form["razorpay_payment_id"];
                string orderId = Request.Form["razorpay_order_id"];
                string signature = Request.Form["razorpay_signature"];

                string showingId = Request.QueryString["showingId"];
                string seats = Request.QueryString["seats"];
                string amountInPaise = Request.QueryString["amount"];

                if (string.IsNullOrEmpty(paymentId) || string.IsNullOrEmpty(orderId) || string.IsNullOrEmpty(signature))
                {
                    throw new ApplicationException("Payment details were not received correctly from Razorpay.");
                }

                string keyId = ConfigurationManager.AppSettings["RazorpayKeyId"];
                string keySecret = ConfigurationManager.AppSettings["RazorpayKeySecret"];

                var verificationAttributes = new Dictionary<string, string>
                {
                    { "razorpay_order_id", orderId },
                    { "razorpay_payment_id", paymentId },
                    { "razorpay_signature", signature },
                    { "secret", keySecret }
                };

                Utils.verifyPaymentSignature(verificationAttributes);


                SaveBookingDetails(showingId, seats, amountInPaise, paymentId);

                ltlMessage.Text = $@"<h1>Booking Successful!</h1>
                                     <p>Thank you for your booking. Your seats (<strong>{seats}</strong>) are confirmed.</p>
                                     <p><strong>Payment ID:</strong> {paymentId}</p>";
            }
            catch (SignatureVerificationError)
            {
                ltlMessage.Text = "<h2>Payment Verification Failed</h2><p>There was an issue with the payment signature. This transaction has been voided for security reasons.</p>";
            }
            catch (Exception ex)
            {
                ltlMessage.Text = "<h2>Error Details</h2><pre>" + Server.HtmlEncode(ex.ToString()) + "</pre>";
            }

        }

        private void SaveBookingDetails(string showingId, string seats, string amountInPaise, string paymentId)
        {
            byte[] qrCodeBytes;
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(paymentId, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrCodeImage = qrCode.GetGraphic(20))
                    {
                        using (MemoryStream stream = new MemoryStream())
                        {
                            qrCodeImage.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                            qrCodeBytes = stream.ToArray();
                        }
                    }
                }
            }

            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            using (var con = new SqlConnection(connStr))
            {
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM Bookings WHERE PaymentID = @PaymentID";
                using (var checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@PaymentID", paymentId);
                    int existingBookings = (int)checkCmd.ExecuteScalar();
                    if (existingBookings > 0)
                    {
                        return;
                    }
                }

                SqlTransaction transaction = con.BeginTransaction();
                try
                {
                    string[] seatArray = seats.Split(',');
                    decimal totalAmount = Convert.ToDecimal(amountInPaise) / 100;
                    decimal pricePerTicket = (seatArray.Length > 0) ? totalAmount / seatArray.Length : 0;

                    foreach (string seat in seatArray)
                    {
                        // This query is correct with 8 columns and 8 values.
                        string query = @"INSERT INTO Bookings (UserID, ShowingID, SeatNumber, TicketPrice, PaymentID, PaymentStatus, BookingDate, QrCodeImage)
                                 VALUES (@UserID, @ShowingID, @SeatNumber, @TicketPrice, @PaymentID, 'Paid', @BookingDate, @QrCodeImage)";

                        using (var cmd = new SqlCommand(query, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                            cmd.Parameters.AddWithValue("@ShowingID", Convert.ToInt32(showingId));
                            cmd.Parameters.AddWithValue("@SeatNumber", seat.Trim());
                            cmd.Parameters.AddWithValue("@TicketPrice", pricePerTicket);
                            cmd.Parameters.AddWithValue("@PaymentID", paymentId);
                            cmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);
                            cmd.Parameters.Add("@QrCodeImage", SqlDbType.VarBinary, -1).Value = qrCodeBytes;
                            cmd.ExecuteNonQuery();
                        }
                    }
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }
    }
}