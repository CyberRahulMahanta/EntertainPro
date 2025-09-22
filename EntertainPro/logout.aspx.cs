using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Destroy the user's session completely.
            // This removes Session["UserID"] and any other data stored in the session.
            Session.Abandon();

            // 2. Clear any authentication cookies (good security practice).
            FormsAuthentication.SignOut();

            // 3. Redirect the user to the Login page.
            Response.Redirect("index.aspx");
        }
    }
}
