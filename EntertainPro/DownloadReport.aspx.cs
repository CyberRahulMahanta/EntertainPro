using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace EntertainPro
{
    public partial class DownloadReport : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFilteredData();
            }
        }

        private void LoadFilteredData()
        {
            string startDate = Request.QueryString["startDate"];
            string endDate = Request.QueryString["endDate"];
            string status = Request.QueryString["status"];
            string userId = Request.QueryString["userId"];

            lblInfo.Text = $"Showing data from <b>{startDate}</b> to <b>{endDate}</b> {(string.IsNullOrEmpty(status) ? "" : $"(Status: {status})")}";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                b.BookingID,
                m.Title AS MovieName,
                (u.FirstName + ' ' + u.LastName) AS UserName,
                b.SeatNumber,
                b.BookingDate,
                b.PaymentStatus,
                b.TicketPrice,
                b.PaymentID
            FROM Bookings b
            INNER JOIN ShowingMovies sm ON b.ShowingID = sm.ShowingID
            INNER JOIN Movies m ON sm.MovieID = m.MovieID
            INNER JOIN Users u ON b.UserID = u.UserID
            WHERE b.BookingDate BETWEEN @startDate AND @endDate";

                if (!string.IsNullOrEmpty(status))
                    query += " AND b.PaymentStatus = @status";

                if (!string.IsNullOrEmpty(userId))
                    query += " AND b.UserID = @userId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@startDate", startDate);
                cmd.Parameters.AddWithValue("@endDate", endDate);

                if (!string.IsNullOrEmpty(status))
                    cmd.Parameters.AddWithValue("@status", status);

                if (!string.IsNullOrEmpty(userId))
                    cmd.Parameters.AddWithValue("@userId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvReportData.DataSource = dt;
                gvReportData.DataBind();

                // Store for Crystal Report export
                ViewState["ReportData"] = dt;
            }
        }


        protected void btnDownloadCrystal_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["ReportData"] as DataTable;
            if (dt == null || dt.Rows.Count == 0)
            {
                lblInfo.Text = "No data to export.";
                return;
            }

            // Create report object
            ReportDocument report = new ReportDocument();
            report.Load(Server.MapPath("~/Reports/BookingReport.rpt"));
            report.SetDataSource(dt);

            // Pass dynamic parameters to Crystal Report
            string startDate = Request.QueryString["startDate"];
            string endDate = Request.QueryString["endDate"];

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                report.SetParameterValue("StartDate", Convert.ToDateTime(startDate));
                report.SetParameterValue("EndDate", Convert.ToDateTime(endDate));
            }

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            report.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "BookingReport");
        }

    }
}
