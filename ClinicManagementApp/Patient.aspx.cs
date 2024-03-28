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
        protected int patientID
        {
            get
            {
                if (ViewState["PatientID"] != null)
                {
                    return Convert.ToInt32(ViewState["PatientID"]);
                }
                return 0;
            }
            set
            {
                ViewState["PatientID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showTable();
                TabContainerPatientMoreDetails.Visible = false;
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
                if (TextBox_Name.Text != "" && TextBox_City.Text != "" && RadioButtonList_Gender.SelectedValue != "" && TextBox_DOB.Text != "" && TextBox_Contact.Text != "" && TextBox_Email.Text != "" && DropDownList_BloodGroup.SelectedValue != "Select Blood Group" && TextBox_Registration.Text != "")
                {
                    DateTime RegistrationDate = Convert.ToDateTime(TextBox_Registration.Text);

                    if (GridView_Patient.SelectedRow == null)
                    {
                        db.setData($"insert into patient(name, address, area, city, pincode, gender, birthDate, contact, email, referenceFrom, bloodGroup, registrationDate) values ('{TextBox_Name.Text}', '{TextBox_Address.Text}', '{TextBox_Area.Text}', '{TextBox_City.Text}', '{TextBox_Pincode.Text}', '{RadioButtonList_Gender.SelectedValue}','{TextBox_DOB.Text}', '{TextBox_Contact.Text}', '{TextBox_Email.Text}', '{TextBox_Reference.Text}', '{DropDownList_BloodGroup.SelectedValue}', Convert(date,'{RegistrationDate}',103))");
                        //Response.Write("Record Inserted Successfully");
                        alertPopup.ShowPopup("New Record Inserted in Patient Successfully");
                        patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                    }
                    else
                    {
                        GridViewRow row = GridView_Patient.SelectedRow;
                        Label l1 = (Label)row.FindControl("Label_PatientID");
                        patientID = Convert.ToInt32(l1.Text);

                        db.setData($"update patient set name = '{TextBox_Name.Text}', address = '{TextBox_Address.Text}', area = '{TextBox_Area.Text}', city = '{TextBox_City.Text}', pincode = '{TextBox_Pincode.Text}', gender = '{RadioButtonList_Gender.SelectedValue}', birthDate = '{TextBox_DOB.Text}', contact = '{TextBox_Contact.Text}', email = '{TextBox_Email.Text}', referenceFrom = '{TextBox_Reference.Text}', bloodGroup = '{DropDownList_BloodGroup.SelectedValue}', registrationDate = Convert(date,'{RegistrationDate}',103) where patientID='{patientID}'");
                        //Response.Write("Record Updated Successfully");
                        alertPopup.ShowPopup("Record Updated in Patient Successfully");
                        GridView_Patient.SelectedIndex = -1;
                    }

                    //TextBox_Name.Text = String.Empty;

                    db.CloseConnection();
                    showTable();

                    //TabContainerPatient.ActiveTabIndex = 0;

                    TabContainerPatientMoreDetails.Visible = true;

                    showAllergyTable();
                    showChronicTable();
                    showMedicineTable();

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
            TextBox_Address.Text = String.Empty;
            TextBox_Area.Text = String.Empty;
            TextBox_City.Text = String.Empty;
            TextBox_Pincode.Text = String.Empty;
            RadioButtonList_Gender.SelectedIndex = -1;
            TextBox_DOB.Text = String.Empty;
            TextBox_Contact.Text = String.Empty;
            TextBox_Email.Text = String.Empty;
            TextBox_Reference.Text = String.Empty;
            DropDownList_BloodGroup.SelectedIndex = 0;
            TextBox_Registration.Text = String.Empty;
            //TextBox_Name.Focus();

            //patientID = 0;

            TabContainerPatientMoreDetails.Visible = false;
            GridView_Patient.SelectedIndex = -1;
        }

        protected void GridView_Patient_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView_Patient.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_PatientID");

            try
            {
                db.setData($"delete from patient where patientID = {l1.Text}");
                //Response.Write("Deleted");
                alertPopup.ShowPopup("Record Deleted from Patient");
                showTable();
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

        protected void GridView_Patient_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = GridView_Patient.SelectedRow;
                Label l1 = (Label)row.FindControl("Label_PatientID");
                patientID = Convert.ToInt32(l1.Text);

                SqlDataReader reader = db.getData($"select * from patient where patientID = '{patientID}'");

                if (reader.Read())
                {
                    TextBox_Name.Text = reader[1].ToString();
                    TextBox_Address.Text = reader[2].ToString();
                    TextBox_Area.Text = reader[3].ToString();
                    TextBox_City.Text = reader[4].ToString();
                    TextBox_Pincode.Text = reader[5].ToString();
                    RadioButtonList_Gender.SelectedValue = reader[6].ToString();
                    TextBox_DOB.Text = reader.GetDateTime(7).ToString("yyyy-MM-dd");
                    TextBox_Contact.Text = reader[8].ToString();
                    TextBox_Email.Text = reader[9].ToString();
                    TextBox_Reference.Text = reader[10].ToString();
                    DropDownList_BloodGroup.Text = reader[11].ToString();
                    TextBox_Registration.Text = reader.GetDateTime(12).ToString("yyyy-MM-dd");

                }

                TabContainerPatient.ActiveTabIndex = 1;
                TabContainerPatientMoreDetails.Visible = true;
                db.CloseConnection();
                showAllergyTable();
                showChronicTable();
                showMedicineTable();
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





        /***************************************************************************************************************/


        // Allergy
        protected void showAllergyTable()
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                //Response.Write(patientId);
                DataTable adt = db.getTable($"select allergyID, name, startDate from allergy where patientID = {patientId}");
                GridViewAllergy.DataSource = adt;
                GridViewAllergy.DataBind();
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

        protected void Button_AllergyAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                if (TextBox_AllergyAdd.Text != "" && TextBox_AllergyStartDateAdd.Text != "")
                {
                    if (GridViewAllergy.SelectedRow == null)
                    {
                        db.setData($"insert into allergy(name, startDate, patientID) values ('{TextBox_AllergyAdd.Text}', '{TextBox_AllergyStartDateAdd.Text}', '{patientId}')");
                        //Response.Write("Record Inserted Successfully");
                        alertPopup.ShowPopup("New Record Inserted in Allergy Successfully");
                    }

                    TextBox_AllergyAdd.Text = "";
                    TextBox_AllergyStartDateAdd.Text = "";
                    showAllergyTable();
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

        protected void GridViewAllergy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridViewAllergy.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_AllergyIDItem");

            try
            {
                db.setData($"delete from allergy where allergyID={l1.Text}");
                //Response.Write("Deleted");
                alertPopup.ShowPopup("Record Deleted from Allergy");
                showAllergyTable();
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

        protected void GridViewAllergy_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewAllergy.EditIndex = e.NewEditIndex;
            showAllergyTable();
        }

        protected void GridViewAllergy_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewAllergy.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_AllergyIDItem");
            TextBox t1 = (TextBox)row.FindControl("TextBox_AllergyEdit");
            TextBox t2 = (TextBox)row.FindControl("TextBox_AllergyStartDateEdit");

            try
            {
                db.setData($"update allergy set name = '{t1.Text}', startDate = '{t2.Text}' where allergyID={l1.Text}");
                //Response.Write("Allergy Record Updated Successfully ");
                alertPopup.ShowPopup("Record Updated in Allergy Successfully");
                GridViewAllergy.EditIndex = -1;
                showAllergyTable();
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

        protected void GridViewAllergy_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewAllergy.EditIndex = -1;
            showAllergyTable();
        }





        //Chronic
        protected void showChronicTable()
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                //Response.Write(patientID);
                DataTable cdt = db.getTable($"select chronicID, name, startDate from chronic where patientID = {patientId}");
                GridViewChronic.DataSource = cdt;
                GridViewChronic.DataBind();
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

        protected void Button_ChronicAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                if (TextBox_ChronicAdd.Text != "" && TextBox_ChronicStartDateAdd.Text != "")
                {
                    if (GridViewChronic.SelectedRow == null)
                    {
                        db.setData($"insert into chronic(name, startDate, patientID) values ('{TextBox_ChronicAdd.Text}', '{TextBox_ChronicStartDateAdd.Text}', '{patientId}')");
                        //Response.Write("Record Inserted Successfully");
                        alertPopup.ShowPopup("New Record Inserted in Chronic Disease Successfully");
                    }

                    TextBox_ChronicAdd.Text = "";
                    TextBox_ChronicStartDateAdd.Text = "";
                    showChronicTable();
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

        protected void GridViewChronic_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridViewChronic.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_ChronicIDItem");

            try
            {
                db.setData($"delete from chronic where chronicID={l1.Text}");
                //Response.Write("Deleted");
                alertPopup.ShowPopup("Record Deleted from Chronic Disease");
                showChronicTable();
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

        protected void GridViewChronic_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewChronic.EditIndex = e.NewEditIndex;
            showChronicTable();
        }

        protected void GridViewChronic_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewChronic.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_ChronicIDItem");
            TextBox t1 = (TextBox)row.FindControl("TextBox_ChronicEdit");
            TextBox t2 = (TextBox)row.FindControl("TextBox_ChronicStartDateEdit");

            try
            {
                db.setData($"update chronic set name = '{t1.Text}', startDate = '{t2.Text}' where chronicID={l1.Text}");
                //Response.Write("Chronic Updated");
                alertPopup.ShowPopup("Recored Updated in Chronic Disease Successfully");
                GridViewChronic.EditIndex = -1;
                showChronicTable();
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

        protected void GridViewChronic_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewChronic.EditIndex = -1;
            showChronicTable();
        }










        // Medicine
        protected void showMedicineTable()
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                //Response.Write(patientID);
                DataTable mdt = db.getTable($"select medicineID, name, frequency from medicineHistory where patientID = {patientId}");
                GridViewMedicine.DataSource = mdt;
                GridViewMedicine.DataBind();
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

        protected void Button_MedicineAdd_Click(object sender, EventArgs e)
        {
            try
            {
                //if (GridView_Patient.SelectedRow == null)
                //{
                //    patientID = Convert.ToInt32(db.getSingleData($"select max(patientID) from patient"));
                //    db.CloseConnection();
                //}
                //else
                //{
                //    GridViewRow row = GridView_Patient.SelectedRow;
                //    Label l1 = (Label)row.FindControl("Label_PatientID");
                //    patientID = Convert.ToInt32(l1.Text);
                //}

                int patientId = patientID;

                if (TextBox_MedicineAdd.Text != "" && DropDownList_FrequencyAdd.SelectedValue != "Select Medication Frequency")
                {
                    if (GridViewMedicine.SelectedRow == null)
                    {
                        db.setData($"insert into medicineHistory(name, frequency, patientID) values ('{TextBox_MedicineAdd.Text}', '{DropDownList_FrequencyAdd.SelectedValue}', '{patientId}')");
                        //Response.Write("Record Inserted Successfully");
                        alertPopup.ShowPopup("New Record Inserted in Medicine History Successfully");
                    }

                    TextBox_MedicineAdd.Text = "";
                    DropDownList_FrequencyAdd.SelectedIndex = 0;
                    showMedicineTable();
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

        protected void GridViewMedicine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridViewMedicine.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_MedicineIDItem");

            try
            {
                db.setData($"delete from medicineHistory where medicineID={l1.Text}");
                //Response.Write("Deleted");
                alertPopup.ShowPopup("Record Deleted from Medicine History");
                showMedicineTable();
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

        protected void GridViewMedicine_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewMedicine.EditIndex = e.NewEditIndex;
            showMedicineTable();
        }

        protected void GridViewMedicine_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewMedicine.Rows[e.RowIndex];
            Label l1 = (Label)row.FindControl("Label_MedicineIDItem");
            TextBox t1 = (TextBox)row.FindControl("TextBox_MedicineEdit");
            TextBox t2 = (TextBox)row.FindControl("TextBox_FrequencyEdit");

            try
            {
                db.setData($"update medicineHistory set name = '{t1.Text}', frequency = '{t2.Text}' where medicineID={l1.Text}");
                //Response.Write("Medicine Record Updated Successfully ");
                alertPopup.ShowPopup("Record Updated in Medicine History Successfully");
                GridViewMedicine.EditIndex = -1;
                showMedicineTable();
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

        protected void GridViewMedicine_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewMedicine.EditIndex = -1;
            showMedicineTable();
        }







    }
}