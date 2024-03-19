using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class Patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TabContainerPatientMoreDetails.Visible = false;
            }
        }

        protected void Button_Save_Click(object sender, EventArgs e)
        {
            TabContainerPatientMoreDetails.Visible = true ;
        }
    }
}