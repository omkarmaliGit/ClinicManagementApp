using AjaxControlToolkit;
using ClinicManagementApp.DataBaseConnection;
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
    public partial class Appointment : System.Web.UI.Page
    {
        DataBase db = new DataBase();

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
        }


        private void CreateTable()
        {
            DateTime currentDate = DateTime.Today;


            /** <-- Header --> **/

            TableRow headerRow = new TableRow();

            TableCell headerCell1 = new TableCell { Text = "Time", CssClass = "headerCell" };
            headerRow.Cells.Add(headerCell1);

            for (int j = 0; j < 5; j++)
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


                    for (int j = 0; j < 5; j++)
                    {
                        DateTime date = currentDate.AddDays(j);
                        string dateSlot = date.ToString("dd-MM-yyyy");

                        string dateTime = dateSlot + "_" + timeSlot;
                        string dateTimeID = date.ToString("dd") + date.ToString("MM") + date.ToString("yyyy") + "_" + hour + minute;

                        bool isSlotBooked = IsTimeSlotBooked(dateSlot, timeSlot);
                        db.CloseConnection();

                        TableCell cell;
                        if (!isSlotBooked)
                        {
                            cell = CreateButtonCell(dateTime, "Available", dateTimeID);
                        }
                        else
                        {
                            cell = new TableCell { Text = "Booked", CssClass = "cellBorder" };
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
            SqlDataReader reader = db.getData($"select appointmentDate,appointmentTimeSlot from appointment");

            if (reader.Read())
            {
                return true;
            }
            else
            {
                return false;
            }


        }

        private TableCell CreateButtonCell(string dateTime, string initialText, string dateTimeID)
        {
            TableCell cell = new TableCell();

            Button button = new Button
            {
                ID = $"btn_{dateTimeID}",
                Text = initialText,
                CommandArgument = dateTime,
                CssClass = "btnBook btn btn-success",
            };

            button.Click += Button_Click;

            cell.Controls.Add(button);

            return cell;
        }

        private void Button_Click(object sender, EventArgs e)
        {
            ModalPopupExtender.Show();

            Button button = (Button)sender;
            string timeSlot = button.CommandArgument;
            string newText = "booked";

            Response.Write(timeSlot.ToString());
            Console.Write(timeSlot.ToString());

            button.Text = newText;
            button.CssClass = "btnBooked btn btn-Danger";
        }

        protected void RadioButtonList_Patient_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RadioButtonList_Patient.SelectedIndex == 0)
            {
                newDiv.Visible = true;
                registeredDiv.Visible = false;
            }
            else
            {
                registeredDiv.Visible = true;
                newDiv.Visible = false;
            }
        }
    }
}