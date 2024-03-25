using ClinicManagementApp.DataBaseConnection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class Login : System.Web.UI.Page
    {
        DataBase db = new DataBase();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminID"] != null)
            {
                Response.Redirect("DashBoard.aspx");
            }
        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataReader reader = db.getData($"select password,adminID from admin where loginID='{TextBox_LoginID.Text}'");

                if (reader.Read())
                {
                    if (reader[0].ToString() == TextBox_Password.Text)
                    {
                        Session["adminID"] = reader[1].ToString();
                        Response.Redirect("DashBoard.aspx");
                    }
                    else
                    {
                        Response.Write("Wrong Password");
                    }
                }
                else
                {
                    Response.Write("User Not Found");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                db.CloseConnection();
            }
        }

    }
}