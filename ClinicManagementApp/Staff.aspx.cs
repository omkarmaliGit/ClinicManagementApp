using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Save_Click(object sender, EventArgs e)
        {

        }

        protected void Button_Clear_Click(object sender, EventArgs e)
        {
            TextBox_Name.Text = string.Empty;
            DropDownList_Gender.Text = string.Empty;
        }
    }
}