using AjaxControlToolkit;
using ClinicManagementApp.DataBaseConnection;
using ClinicManagementApp.ModalPopups;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClinicManagementApp
{
    public partial class Staff : System.Web.UI.Page
    {
        DataBase db = new DataBase();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showTable();
            }
        }

        protected void showTable()
        {
            try
            {
                DataTable dt = db.getTable($"select staffID, name, city, gender, contact from staff");
                GridView_Staff.DataSource = dt;
                GridView_Staff.DataBind();
            }
            catch (Exception ex)
            {
                alertPopup.ShowPopup($"Exception Catched : {ex.Message}");
            }
            finally
            {
                db.CloseConnection();
            }
        }

        protected void Button_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox_Name.Text != "" && RadioButtonList_Gender.SelectedValue != "" && TextBox_Aadhar.Text != "" && TextBox_City.Text != "" && TextBox_Contact.Text != "" && TextBox_Email.Text != "" && TextBox_Password.Text != "")
                {
                    if (GridView_Staff.SelectedRow == null)
                    {
                        db.setData($"insert into staff(name, gender, aadharCard, birthDate, joiningDate, qualification, experience, workType, address, area, city, pincode, contact, email, password) values ('{TextBox_Name.Text}','{RadioButtonList_Gender.SelectedValue}','{TextBox_Aadhar.Text}','{TextBox_DOB.Text}','{TextBox_DOJ.Text}','{DropDownList_Qualification.SelectedValue}','{TextBox_Experience.Text}','{DropDownList_WorkType.SelectedValue}','{TextBox_Address.Text}','{TextBox_Area.Text}','{TextBox_City.Text}','{TextBox_Pincode.Text}','{TextBox_Contact.Text}','{TextBox_Email.Text}','{TextBox_Password.Text}')");
                        //Response.Write("Record Inserted Successfully");
                        alertPopup.ShowPopup("New Record Inserted in Staff Successfully");
                    }
                    else
                    {
                        GridViewRow row = GridView_Staff.SelectedRow;
                        Label l1 = (Label)row.FindControl("Label_StaffID");
                        int staffID = Convert.ToInt32(l1.Text);

                        db.setData($"update staff set name = '{TextBox_Name.Text}', gender = '{RadioButtonList_Gender.SelectedValue}', aadharCard = '{TextBox_Aadhar.Text}', birthDate = '{TextBox_DOB.Text}', joiningDate = '{TextBox_DOJ.Text}', qualification = '{DropDownList_Qualification.SelectedValue}', experience = '{TextBox_Experience.Text}', workType = '{DropDownList_WorkType.SelectedValue}', address = '{TextBox_Address.Text}', area = '{TextBox_Area.Text}', city = '{TextBox_City.Text}', pincode = '{TextBox_Pincode.Text}', contact = '{TextBox_Contact.Text}', email = '{TextBox_Email.Text}', password = '{TextBox_Password.Text}' where staffID='{staffID}'");
                        //Response.Write("Record Updated Successfully");
                        alertPopup.ShowPopup("Record Updated in Staff Successfully");
                        GridView_Staff.SelectedIndex = -1;
                    }

                    //TextBox_Name.Text = String.Empty;
                    //RadioButtonList_Gender.SelectedIndex = -1;
                    //TextBox_Aadhar.Text = String.Empty;
                    //TextBox_DOB.Text = String.Empty;
                    //TextBox_DOJ.Text = String.Empty;
                    //DropDownList_Qualification.SelectedIndex = 0;
                    //TextBox_Experience.Text = String.Empty;
                    //DropDownList_WorkType.SelectedIndex = 0;
                    //TextBox_Address.Text = String.Empty;
                    //TextBox_Area.Text = String.Empty;
                    //TextBox_City.Text = String.Empty;
                    //TextBox_Pincode.Text = String.Empty;
                    //TextBox_Contact.Text = String.Empty;
                    //TextBox_Email.Text = String.Empty;
                    //TextBox_Password.Text = String.Empty;
                    //TextBox_Name.Focus();

                    db.CloseConnection();

                    showTable();
                    TabContainerStaff.ActiveTabIndex = 0;

                }
            }
            catch (Exception ex)
            {
                alertPopup.ShowPopup($"Exception Catched : {ex.Message}");
            }
            finally
            {
                db.CloseConnection();
            }
        }

        protected void Button_Clear_Click(object sender, EventArgs e)
        {
            TextBox_Name.Text = String.Empty;
            RadioButtonList_Gender.SelectedIndex = -1;
            TextBox_Aadhar.Text = String.Empty;
            TextBox_DOB.Text = String.Empty;
            TextBox_DOJ.Text = String.Empty;
            DropDownList_Qualification.SelectedIndex = 0;
            TextBox_Experience.Text = String.Empty;
            DropDownList_WorkType.SelectedIndex = 0;
            TextBox_Address.Text = String.Empty;
            TextBox_Area.Text = String.Empty;
            TextBox_City.Text = String.Empty;
            TextBox_Pincode.Text = String.Empty;
            TextBox_Contact.Text = String.Empty;
            TextBox_Email.Text = String.Empty;
            TextBox_Password.Text = String.Empty;
            //TextBox_Name.Focus();
            GridView_Staff.SelectedIndex = -1;
        }

        protected void TabContainerStaff_ActiveTabChanged(object sender, EventArgs e)
        {

            TextBox_Name.Text = String.Empty;
            RadioButtonList_Gender.SelectedIndex = -1;
            TextBox_Aadhar.Text = String.Empty;
            TextBox_DOB.Text = String.Empty;
            TextBox_DOJ.Text = String.Empty;
            DropDownList_Qualification.SelectedIndex = 0;
            TextBox_Experience.Text = String.Empty;
            DropDownList_WorkType.SelectedIndex = 0;
            TextBox_Address.Text = String.Empty;
            TextBox_Area.Text = String.Empty;
            TextBox_City.Text = String.Empty;
            TextBox_Pincode.Text = String.Empty;
            TextBox_Contact.Text = String.Empty;
            TextBox_Email.Text = String.Empty;
            TextBox_Password.Text = String.Empty;

        }

        protected void GridView_Staff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView_Staff.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_StaffID");
            int staffID = Convert.ToInt32(l1.Text);

            try
            {
                //deletePopup.ShowPopup($"delete from staff where staffID = {staffID}");
                //showTable();
            }
            catch (Exception ex)
            {
                alertPopup.ShowPopup($"Exception Catched : {ex.Message}");
            }
            finally
            {
                db.CloseConnection();
                Response.Redirect("Staff.aspx");
            }
        }

        protected void GridView_Staff_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Staff.SelectedRow;
                Label l1 = (Label)row.FindControl("Label_StaffID");

                SqlDataReader reader = db.getData($"select * from staff where staffID = '{l1.Text}'");

                if (reader.Read())
                {
                    TextBox_Name.Text = reader[1].ToString();
                    RadioButtonList_Gender.Text = reader[2].ToString();
                    TextBox_Aadhar.Text = reader[3].ToString();
                    TextBox_DOB.Text = reader.GetDateTime(4).ToString("yyyy-MM-dd");
                    TextBox_DOJ.Text = reader.GetDateTime(5).ToString("yyyy-MM-dd");
                    DropDownList_Qualification.Text = reader[6].ToString();
                    TextBox_Experience.Text = reader[7].ToString();
                    DropDownList_WorkType.Text = reader[8].ToString();
                    TextBox_Address.Text = reader[9].ToString();
                    TextBox_Area.Text = reader[10].ToString();
                    TextBox_City.Text = reader[11].ToString();
                    TextBox_Pincode.Text = reader[12].ToString();
                    TextBox_Contact.Text = reader[13].ToString();
                    TextBox_Email.Text = reader[14].ToString();
                    TextBox_Password.Text = reader[15].ToString();
                }

                TabContainerStaff.ActiveTabIndex = 1;

            }
            catch (Exception ex)
            {
                alertPopup.ShowPopup($"Exception Catched : {ex.Message}");
            }
            finally
            {
                db.CloseConnection();
            }
        }

    }
}