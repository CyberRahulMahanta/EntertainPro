using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class SessionDebug : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table>");
            sb.Append("<tr><th>Key</th><th>Value</th></tr>");

            if (Session.Count == 0)
            {
                sb.Append("<tr><td colspan='2'>No session data found.</td></tr>");
            }
            else
            {
                foreach (string key in Session.Keys)
                {
                    sb.Append("<tr>");
                    sb.Append("<td>" + key + "</td>");
                    sb.Append("<td>" + (Session[key] ?? "NULL") + "</td>");
                    sb.Append("</tr>");
                }
            }

            sb.Append("</table>");
            litSessionData.Text = sb.ToString();
        }
    }
}