using ClinicManagementApp.DataBaseConnection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ClinicManagementApp
{
    public partial class Clinic : System.Web.UI.Page
    {
        DataBase db = new DataBase();
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            reader = db.getData("select * from clinic where clinicID=1");

            if (reader.Read())
            {
                TextBox_Name.Text = reader[0].ToString();
                TextBox_Address.Text = reader[1].ToString();
                TextBox_Area.Text = reader[2].ToString();
                TextBox_City.Text = reader[3].ToString();
                TextBox_Pincode.Text = reader[4].ToString();
                TextBox_Contact.Text = reader[5].ToString();
                TextBox_Website.Text = reader[6].ToString();
                TextBox_Email.Text = reader[7].ToString();
                TextBox_StartTime.Text = reader[8].ToString();
                TextBox_EndTime.Text = reader[9].ToString();
            }
        }

        protected void Button_Save_Click(object sender, EventArgs e)
        {
            if (reader.Read())
            {
                db.setData($"update clinic set name='{TextBox_Name.Text}', address='{TextBox_Address.Text}', area='{TextBox_Area.Text}', city='{TextBox_City.Text}', pincode='{TextBox_Pincode.Text}', contact='{TextBox_Contact.Text}', website='{TextBox_Website.Text}', email='{TextBox_Email.Text}', startTime='{TextBox_StartTime.Text}', endTime='{TextBox_EndTime.Text}' where clinicID = 1");
            }
            else
            {
                db.setData($"insert into clinic (name, address, area, city, pincode, contact, website, email, startTime, endTime) values ('{TextBox_Name.Text}', '{TextBox_Address.Text}', '{TextBox_Area.Text}', '{TextBox_City.Text}', '{TextBox_Pincode.Text}', '{TextBox_Contact.Text}', '{TextBox_Website.Text}', '{TextBox_Email.Text}', '{TextBox_StartTime.Text}', '{TextBox_EndTime.Text}')");
            }
        }

        protected void Button_Clear_Click(object sender, EventArgs e)
        {
            TextBox_Name.Text = string.Empty;
            TextBox_Address.Text = string.Empty;
            TextBox_Area.Text = string.Empty;
            TextBox_City.Text = string.Empty;
            TextBox_Pincode.Text = string.Empty;
            TextBox_Contact.Text = string.Empty;
            TextBox_Website.Text = string.Empty;
            TextBox_Email.Text = string.Empty;
            TextBox_StartTime.Text = string.Empty;
            TextBox_EndTime.Text = string.Empty;

            TextBox_Name.Focus();
        }
    }
}