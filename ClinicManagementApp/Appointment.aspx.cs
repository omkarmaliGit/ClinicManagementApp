using AjaxControlToolkit;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using ClinicManagementApp.DataBaseConnection;
using ClinicManagementApp.ModalPopups;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ClinicManagementApp
{
    public partial class Appointment : System.Web.UI.Page
    {
        DataBase db = new DataBase();

        protected string buttonID
        {
            get
            {
                return ViewState["buttonID"] as string;
            }
            set
            {
                ViewState["buttonID"] = value;
            }
        }

        protected string dateTimeSlot
        {
            get
            {
                return ViewState["dateTimeSlot"] as string;
            }
            set
            {
                ViewState["dateTimeSlot"] = value;
            }
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["adminID"] != null)
            {
                this.MasterPageFile = "~/Site.Master";
            }
            else
            {
                this.MasterPageFile = "~/User.master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            CreateTable();

            if (!IsPostBack)
            {
                showData();
            }
        }


        private void CreateTable()
        {
            DateTime currentDate = DateTime.Today;


            /** <-- Header --> **/

            TableRow headerRow = new TableRow();

            TableCell headerCell1 = new TableCell { Text = "Time", CssClass = "headerCell" };
            headerRow.Cells.Add(headerCell1);

            for (int j = 0; j < 7; j++)
            {
                DateTime date = currentDate.AddDays(j);
                string dateSlot = date.ToString("dd-MM-yyyy");

                TableCell headerCell2 = new TableCell
                {
                    Text = (dateSlot == currentDate.ToString("dd-MM-yyyy") ? "Today" : ((dateSlot == currentDate.AddDays(1).ToString("dd-MM-yyyy") ? "Tomorrow" : dateSlot))),
                    CssClass = "headerCell"
                };
                headerRow.Cells.Add(headerCell2);
            }

            headerRow.CssClass = "headerRow";

            AppointmentTable.Rows.Add(headerRow);

            /** <-- Body --> **/

            for (int hour = 10; hour <= 17; hour++)
            {
                string hourString = hour < 12 ? $"{hour:D2}:00 AM" : ((hour - 12) == 0 ? $"{12}:00 PM" : $"{hour - 12:D2}:00 PM");

                TableRow timeRow = new TableRow();
                TableCell timeCell = new TableCell { Text = hourString, CssClass = "cellBorder", RowSpan = 5 };
                timeRow.Cells.Add(timeCell);

                AppointmentTable.Rows.Add(timeRow);


                for (int i = 0; i < 4; i++)
                {

                    int minute = i * 15;
                    string timeSlot = $"{hour:D2}:{minute:D2}";

                    TableRow timeSlotRow = new TableRow();

                    for (int j = 0; j < 7; j++)
                    {
                        DateTime date = currentDate.AddDays(j);
                        string dateSlot = date.ToString("yyyy-MM-dd");

                        string dateTime = dateSlot + "_" + timeSlot;
                        string dateTimeID = date.ToString("dd") + date.ToString("MM") + date.ToString("yyyy") + "_" + hour + minute;

                        //TableCell cell;
                        //cell = CreateButtonCell(dateTime, "Available", dateTimeID, "btnBook btn btn-success");

                        bool isSlotBooked = IsTimeSlotBooked(dateSlot, timeSlot);
                        db.CloseConnection();

                        TableCell cell;
                        if (!isSlotBooked)
                        {
                            cell = CreateButtonCell(dateTime, "Available", dateTimeID, "btnBook btn btn-success");
                        }
                        else
                        {
                            if (Session["adminID"] != null)
                            {
                                SqlDataReader reader = db.getData($"select patientID from appointment where appointmentDate = {dateSlot} and appointmentTimeSlot = {timeSlot}");
                                reader.Read();
                                string name = reader[0].ToString();
                                cell = new TableCell { Text = $"{name}" };
                            }
                            else
                            {
                                cell = CreateButtonCell(dateTime, "Booked", dateTimeID, "btnBook btn btn-Danger");
                            }
                        }

                        cell.CssClass = "cellBorder";
                        timeSlotRow.Cells.Add(cell);
                    }

                    AppointmentTable.Rows.Add(timeSlotRow);

                }

            }
        }

        private bool IsTimeSlotBooked(string dateSlot, string timeSlot)
        {
            SqlDataReader reader = db.getData($"select patientID from appointment where appointmentDate = '{dateSlot}' and appointmentTimeSlot = '{timeSlot}'");

            if (reader.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private TableCell CreateButtonCell(string dateTime, string initialText, string dateTimeID, string cssClass)
        {
            TableCell cell = new TableCell();

            Button button = new Button
            {
                ID = $"btn_{dateTimeID}",
                Text = initialText,
                CommandArgument = dateTime,
                CssClass = cssClass,
            };

            button.Click += Button_Click;

            if (initialText == "Booked")
            {
                button.Enabled = false;
            }

            cell.Controls.Add(button);

            return cell;
        }

        private void Button_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            buttonID = button.ID;
            dateTimeSlot = button.CommandArgument;

            ModalPopupExtender.Show();
        }

        protected void RadioButtonList_Patient_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList_Patient.SelectedIndex == 0)
            {
                newDiv.Visible = true;
                DropDownList_Registration.SelectedIndex = 0;
                DropDownList_Doctor.SelectedIndex = 0;
                registeredDiv.Visible = false;
            }
            else
            {
                registeredDiv.Visible = true;
                TextBox_Name.Text = string.Empty;
                DropDownList_Doctor.SelectedIndex = 0;
                newDiv.Visible = false;
            }
        }


        protected void showData()
        {
            try
            {
                DropDownList_Registration.Items.Clear();
                DropDownList_Registration.Items.Add(new ListItem("Select Registration Number", ""));

                SqlDataReader reader = db.getData($"select patientID from patient");

                while (reader.Read())
                {
                    DropDownList_Registration.Items.Add(new ListItem(reader[0].ToString(), reader[0].ToString()));
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


            try
            {
                DropDownList_Doctor.Items.Clear();
                DropDownList_Doctor.Items.Add(new ListItem("Select Doctor Name", ""));

                SqlDataReader reader = db.getData($"select staffID, name from staff where workType = 'Doctor'");

                while (reader.Read())
                {
                    DropDownList_Doctor.Items.Add(new ListItem(reader[1].ToString(), reader[0].ToString()));
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


        protected void bookButton_Click(object sender, EventArgs e)
        {
            try
            {
                string[] dateTimeArray = dateTimeSlot.Split('_');
                string date = dateTimeArray[0];
                string time = dateTimeArray[1];

                if (RadioButtonList_Patient.SelectedIndex == 0)
                {
                }
                else
                {
                    db.setData($"insert into appointment (appointmentTimeSlot, appointmentDate, patientID, doctorID) values ('{time}','{date}',{DropDownList_Registration.SelectedValue},{DropDownList_Doctor.SelectedValue})");

                    ModalPopupExtender.Hide();

                    alertPopup.ShowPopup("Appointment Booked");

                }
            }
            catch (Exception ex)
            {
                alertPopup.ShowPopup(ex.Message);
            }
            finally
            {
                db.CloseConnection();
                CreateTable();
            }
        }



    }
}