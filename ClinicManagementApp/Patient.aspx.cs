using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClinicManagementApp.DataBaseConnection;

namespace ClinicManagementApp
{
    public partial class Patient : System.Web.UI.Page
    {
        DataBase db = new DataBase();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TabContainerPatientMoreDetails.Visible = false;
                showTable();
            }
        }

        protected void showTable()
        {
            try
            {
                DataTable dt = db.getTable($"select patientID, name, city, gender, contact, registrationDate from patient");
                GridView_Patient.DataSource = dt;
                GridView_Patient.DataBind();
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

        protected void Button_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox_Name.Text != "" && TextBox_City.Text != "" && DropDownList_Gender.Text != "" && TextBox_Contact.Text != "" && TextBox_Email.Text != "" && DropDownList_BloodGroup.Text != "" && TextBox_Registration.Text != "")
                {

                    if (GridView_Patient.SelectedRow == null)
                    {
                        db.setData($"insert into patient(name, address, area, city, pincode, gender, birthDate, contact, email, referenceFrom, bloodGroup, registrationDate) values ('{TextBox_Name.Text}', '{TextBox_Address.Text}', '{TextBox_Area.Text}', '{TextBox_City.Text}', '{TextBox_Pincode.Text}', '{DropDownList_Gender.Text}', '{TextBox_DOB.Text}', '{TextBox_Contact.Text}', '{TextBox_Email.Text}', '{TextBox_Reference.Text}', '{DropDownList_BloodGroup.Text}', '{TextBox_Registration.Text}')");
                        Response.Write("Record Inserted Successfully");
                    }
                    else
                    {
                        GridViewRow row = GridView_Patient.SelectedRow;
                        Label l1 = (Label)row.FindControl("Label_PatientID");
                        int patientID = Convert.ToInt32(l1.Text);

                        db.setData($"update staff set name = '{TextBox_Name.Text}', address = '{TextBox_Address.Text}', area = '{TextBox_Area.Text}', city = '{TextBox_City.Text}', pincode = '{TextBox_Pincode.Text}', gender = '{DropDownList_Gender.Text}', birthDate = '{TextBox_DOB.Text}', contact = '{TextBox_Contact.Text}', email = '{TextBox_Email.Text}', referenceFrom = '{TextBox_Reference.Text}', bloodGroup = '{DropDownList_BloodGroup.Text}'  where patientID='{patientID}'");
                        Response.Write("Record Updated Successfully");
                        GridView_Patient.EditIndex = -1;
                    }

                    //TabContainerPatient.ActiveTabIndex = 0;

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                GridView_Patient.SelectedIndex = -1;
            }

            TabContainerPatientMoreDetails.Visible = true;

            showAllergyTable();
            showChronicTable();
            showMedicineTable();

        }

        protected void Button_Clear_Click(object sender, EventArgs e)
        {
            TextBox_Name.Text = String.Empty;
            TextBox_Address.Text = String.Empty;
            TextBox_Area.Text = String.Empty;
            TextBox_City.Text = String.Empty;
            TextBox_Pincode.Text = String.Empty;
            DropDownList_Gender.Text = String.Empty;
            TextBox_DOB.Text = String.Empty;
            TextBox_Contact.Text = String.Empty;
            TextBox_Email.Text = String.Empty;
            TextBox_Reference.Text = String.Empty;
            DropDownList_BloodGroup.Text = String.Empty;
            TextBox_Registration.Text = String.Empty;
            TextBox_Name.Focus();
        }

        protected void GridView_Staff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView_Patient.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_PatientID");

            try
            {
                db.setData($"delete from patient where patientID={l1.Text}");
                Response.Write("Deleted");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                showTable();
                db.CloseConnection();
            }
        }

        protected void GridView_Staff_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Patient.SelectedRow;
                Label l1 = (Label)row.FindControl("Label_PatientID");

                SqlDataReader reader = db.getData($"select * from patient where ID='{l1.Text}'");

                if (reader.Read())
                {
                    TextBox_Name.Text = reader[1].ToString();
                    TextBox_Address.Text = reader[2].ToString();
                    TextBox_Area.Text = reader[3].ToString();
                    TextBox_City.Text = reader[4].ToString();
                    TextBox_Pincode.Text = reader[5].ToString();
                    DropDownList_Gender.Text = reader[6].ToString();
                    TextBox_DOB.Text = reader[7].ToString();
                    TextBox_Contact.Text = reader[8].ToString();
                    TextBox_Email.Text = reader[9].ToString();
                    TextBox_Reference.Text = reader[10].ToString();
                    DropDownList_BloodGroup.Text = reader[11].ToString();
                    TextBox_Registration.Text = reader[12].ToString();
                }
                else
                {
                    Response.Write("Not found");
                }

                TabContainerPatient.ActiveTabIndex = 1;
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


        // Allergy
        protected void showAllergyTable()
        {
            try
            {
                DataTable adt = db.getTable($"select patientID, name, city, gender, contact, registrationDate from patient");
                GridViewAllergy.DataSource = adt;
                GridViewAllergy.DataBind();
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

        protected void Button_AllergyAdd_Click(object sender, EventArgs e)
        {
            try
            {
                

                if (GridViewAllergy.SelectedRow == null)
                {
                    db.setData($"insert into allergy(name, startDate, patientID) values ('{TextBox_AllergyAdd.Text}', '{TextBox_AllergyStartDateAdd.Text}', '')");
                    //Response.Write("Record Inserted Successfully");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                //GridViewAllergy.SelectedIndex = -1;
            }

        }

        protected void GridViewAllergy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridViewAllergy.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_AllergyID");

            try
            {
                db.setData($"delete from allergy where allergyID={l1.Text}");
                Response.Write("Deleted");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                showTable();
                db.CloseConnection();
            }
        }


        //Chronic
        protected void showChronicTable()
        {
            try
            {
                DataTable cdt = db.getTable($"select patientID, name, city, gender, contact, registrationDate from patient");
                GridViewChronic.DataSource = cdt;
                GridViewChronic.DataBind();
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

        // MEdicine
        protected void showMedicineTable()
        {
            try
            {
                DataTable mdt = db.getTable($"select patientID, name, city, gender, contact, registrationDate from patient");
                GridViewMedication.DataSource = mdt;
                GridViewMedication.DataBind();
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