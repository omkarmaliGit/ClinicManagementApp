using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class ModalPopup : System.Web.UI.UserControl
    {
        public void ShowPopup()
        {
            ModalPopupExtender.Show();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}