using System;
using System.Text;
using System.Web;

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

                    if (key == "UserImage")
                    {
                        string imgPath = Session[key]?.ToString();
                        if (!string.IsNullOrEmpty(imgPath))
                            sb.Append("<td><img src='" + ResolveClientUrl("~/" + imgPath.TrimStart('/')) + "' width='80' height='80' style='border-radius:8px; border:1px solid #ccc;'/></td>");


                        else
                            sb.Append("<td>NULL</td>");
                    }
                    else
                    {
                        sb.Append("<td>" + (Session[key] ?? "NULL") + "</td>");
                    }

                    sb.Append("</tr>");
                }

            }

            sb.Append("</table>");
            litSessionData.Text = sb.ToString();
        }
    }
}
