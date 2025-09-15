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
                    navUserItem.Visible = true;
                    navLoginItem.Visible = false;

                    navUserName.InnerText = Session["unm"].ToString();

                    // check if user uploaded image
                    if (Session["UserImage"] != null && Session["UserImage"].ToString() != "")
                    {
                        userAvatar.Src = Session["UserImage"].ToString();  // path from DB/session
                    }
                    else
                    {
                        userAvatar.Src = "img/50.jpg";  // default avatar
                    }
                }
                else
                {
                    navUserItem.Visible = false;
                    navLoginItem.Visible = true;
                }
            }
        }
    }
}