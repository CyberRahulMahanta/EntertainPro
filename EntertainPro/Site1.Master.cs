using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntertainPro
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["unm"] != null)
                {
                    if (navUserItem != null) navUserItem.Visible = true;
                    if (navLoginItem != null) navLoginItem.Visible = false;

                    if (navUserName != null) navUserName.InnerText = Session["unm"].ToString();

                    if (userAvatar != null)
                    {
                        userAvatar.Src = string.IsNullOrEmpty(Session["UserImage"] as string)
                            ? "img/50.jpg"
                            : Session["UserImage"].ToString();
                    }
                }
                else
                {
                    if (navUserItem != null) navUserItem.Visible = false;
                    if (navLoginItem != null) navLoginItem.Visible = true;
                }
            }
        }
    }
}