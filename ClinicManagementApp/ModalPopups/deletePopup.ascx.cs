using ClinicManagementApp.DataBaseConnection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp.ModalPopups
{
    public partial class deletePopup : System.Web.UI.UserControl
    {
        DataBase db = new DataBase();

        string deleteQuery 
        {
            get
            {
                if (ViewState["DeleteQuery"] != null)
                {
                    return ViewState["DeleteQuery"].ToString();
                }
                return null;
            }
            set
            {
                ViewState["DeleteQuery"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ShowPopup (string query)
        {
            deleteQuery = query;
            ModalPopupExtender.Show();
        }

        public void HidePopup()
        {
            ModalPopupExtender.Hide();
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            db.setData(deleteQuery);
            alertPopup.ShowPopup("Record Deleted");
        }
    }
}
