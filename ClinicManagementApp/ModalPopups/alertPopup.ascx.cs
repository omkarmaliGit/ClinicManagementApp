using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp.ModalPopups
{
    public partial class alertPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ShowPopup(string msg)
        {
            popupLabel.Text = msg;
            ModalPopupExtender.Show();
        }

        public void HidePopup()
        {
            ModalPopupExtender.Hide();
        }

    }
}