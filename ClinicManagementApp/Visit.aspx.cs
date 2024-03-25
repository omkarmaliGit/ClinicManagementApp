using ClinicManagementApp.DataBaseConnection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ClinicManagementApp
{
    public partial class Visit : System.Web.UI.Page
    {
        DataBase db = new DataBase();

        private DataTable virtualMedicationDataTable
        {
            get
            {
                if (ViewState["MedicationDataTable"] == null)
                {
                    DataTable newDt = new DataTable();

                    newDt.Columns.Add("medicationID", typeof(int)).AutoIncrement = true;
                    newDt.Columns.Add("name", typeof(string));
                    newDt.Columns.Add("frequency", typeof(string));
                    newDt.Columns.Add("noOfDays", typeof(string));
                    newDt.PrimaryKey = new DataColumn[] { newDt.Columns["medicationID"] };

                    ViewState["MedicationDataTable"] = newDt;
                }
                return (DataTable)ViewState["MedicationDataTable"];
            }
            set
            {
                ViewState["MedicationDataTable"] = value;
            }
        }

        private DataTable virtualInvestigationDataTable
        {
            get
            {
                if (ViewState["InvestigationDataTable"] == null)
                {
                    DataTable newDt = new DataTable();

                    newDt.Columns.Add("investigationID", typeof(int)).AutoIncrement = true;
                    newDt.Columns.Add("investigation", typeof(string));
                    newDt.Columns.Add("result", typeof(string));
                    
                    newDt.PrimaryKey = new DataColumn[] { newDt.Columns["investigationID"] };

                    ViewState["InvestigationDataTable"] = newDt;
                }
                return (DataTable)ViewState["InvestigationDataTable"];
            }
            set
            {
                ViewState["InvestigationDataTable"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showData();
                showVirtualMedicationData();
                showVirtualInvestigationData();
            }
        }


        protected void showData()
        {
            try
            {
                DropDownList_Registration.Items.Add(new ListItem("Select Registration Number"));

                SqlDataReader reader = db.getData($"select patientID from patient");

                while (reader.Read())
                {
                    DropDownList_Registration.Items.Add(reader[0].ToString());
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


            try
            {
                DropDownList_Doctor.Items.Add(new ListItem("Select Doctor Name"));

                SqlDataReader reader = db.getData($"select staffID, name from staff where workType = 'Doctor'");

                while (reader.Read())
                {
                    DropDownList_Doctor.Items.Add(new ListItem(reader[1].ToString(), reader[0].ToString()));
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


            try
            {
                DropDownList_Staff.Items.Add(new ListItem("Select Staff Name"));

                SqlDataReader reader = db.getData($"select staffID, name from staff");

                while (reader.Read())
                {
                    DropDownList_Staff.Items.Add(new ListItem(reader[1].ToString(), reader[0].ToString()));
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


        protected void DropDownList_Registration_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int registeredID = Convert.ToInt32(DropDownList_Registration.SelectedValue);

                SqlDataReader reader = db.getData($"select name, birthDate, bloodGroup from patient where patientID = {registeredID}");

                if (reader.Read())
                {
                    TextBox_PatientName.Text = reader[0].ToString();


                    DateTime birthdate = DateTime.Parse(reader.GetDateTime(1).ToString("yyyy-MM-dd"));
                    DateTime today = DateTime.Today;
                    int age = today.Year - birthdate.Year;

                    if (today.Month < birthdate.Month || (today.Month == birthdate.Month && today.Day < birthdate.Day))
                    {
                        age--;
                    }

                    Label_AgeShow.Text = $"{age} years old";

                    Label_BloodGroupShow.Text = reader[2].ToString();

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


        protected void TextBox_PatientName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SqlDataReader reader = db.getData($"select patientID from patient where name like '{TextBox_PatientName.Text}%'");

                DropDownList_Registration.Items.Clear();

                DropDownList_Registration.Items.Add(new ListItem("Select Registration Number"));

                while (reader.Read())
                {
                    DropDownList_Registration.Items.Add(reader[0].ToString());
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




        /* Medication */
        protected void showVirtualMedicationData()
        {
            GridViewMedication.DataSource = virtualMedicationDataTable;
            GridViewMedication.DataBind();
        }

        protected void Button_MedicineAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow newRow = virtualMedicationDataTable.NewRow();
                newRow["name"] = TextBox_Medicine.Text;
                newRow["frequency"] = DropDownList_Frequency.SelectedValue;
                newRow["noOfDays"] = TextBox_Days.Text;

                virtualMedicationDataTable.Rows.Add(newRow);

                showVirtualMedicationData();

                TextBox_Medicine.Text = string.Empty;
                DropDownList_Frequency.SelectedIndex = 0;
                TextBox_Days.Text = string.Empty;

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button_MedicineClear_Click(object sender, EventArgs e)
        {
            TextBox_Medicine.Text = string.Empty;
            DropDownList_Frequency.SelectedIndex = 0;
            TextBox_Days.Text = string.Empty;
        }

        protected void GridViewMedication_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            virtualMedicationDataTable.Rows.RemoveAt(e.RowIndex);
            showVirtualMedicationData();
        }

        protected void GridViewMedication_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewMedication.EditIndex = e.NewEditIndex;
            showVirtualMedicationData();
        }

        protected void GridViewMedication_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewMedication.Rows[e.RowIndex];
            //Label l1 = (Label)row.FindControl("Label_MedicationIDItem");
            int medicationID = Convert.ToInt32(((Label)row.FindControl("Label_MedicationIDItem")).Text);

            TextBox t1 = (TextBox)row.FindControl("TextBox_MedicationEdit");
            TextBox t2 = (TextBox)row.FindControl("TextBox_FrequencyEdit");
            TextBox t3 = (TextBox)row.FindControl("TextBox_NoOfDaysEdit");

            DataRow dr = virtualMedicationDataTable.Rows.Find(medicationID);
            if (dr != null)
            {
                dr["name"] = t1.Text;
                dr["frequency"] = t2.Text;
                dr["noOfDays"] = t3.Text;
                virtualMedicationDataTable.AcceptChanges();
            }

            GridViewMedication.EditIndex = -1;
            showVirtualMedicationData();
        }

        protected void GridViewMedication_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewMedication.EditIndex = -1;
            showVirtualMedicationData();
        }


        /* Investigation */
        protected void showVirtualInvestigationData()
        {
            GridViewInvestigation.DataSource = virtualInvestigationDataTable;
            GridViewInvestigation.DataBind();
        }

        protected void Button_InvestigationAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow newRow = virtualInvestigationDataTable.NewRow();
                newRow["name"] = TextBox_Investigation.Text;
                newRow["result"] = TextBox_Result.Text;

                virtualInvestigationDataTable.Rows.Add(newRow);

                showVirtualInvestigationData();

                TextBox_Investigation.Text = string.Empty;
                TextBox_Result.Text = string.Empty;

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button_InvestigationClear_Click(object sender, EventArgs e)
        {
            TextBox_Investigation.Text = string.Empty;
            TextBox_Result.Text = string.Empty;
        }

        protected void GridViewInvestigation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            virtualInvestigationDataTable.Rows.RemoveAt(e.RowIndex);
            showVirtualInvestigationData();
        }

        protected void GridViewInvestigation_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewInvestigation.EditIndex = e.NewEditIndex;
            showVirtualInvestigationData();
        }

        protected void GridViewInvestigation_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewInvestigation.Rows[e.RowIndex];
            //Label l1 = (Label)row.FindControl("Label_MedicationIDItem");
            int investigationID = Convert.ToInt32(((Label)row.FindControl("Label_investigationIDItem")).Text);

            TextBox t1 = (TextBox)row.FindControl("TextBox_InvestigationEdit");
            TextBox t2 = (TextBox)row.FindControl("TextBox_ResultEdit");

            DataRow dr = virtualMedicationDataTable.Rows.Find(investigationID);
            if (dr != null)
            {
                dr["investigation"] = t1.Text;
                dr["result"] = t2.Text;

                virtualInvestigationDataTable.AcceptChanges();
            }

            GridViewInvestigation.EditIndex = -1;
            showVirtualInvestigationData();
        }


        protected void GridViewInvestigation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewInvestigation.EditIndex = -1;
            showVirtualInvestigationData();
        }

    }
}