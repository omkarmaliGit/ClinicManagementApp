using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void LinkButton_Logout_Click(object sender, EventArgs e)
        {
            Session["adminId"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}