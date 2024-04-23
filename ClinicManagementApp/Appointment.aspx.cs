﻿using ClinicManagementApp.DataBaseConnection;
using System;
using System.Collections.Generic;
using System.Data;
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

                TableCell headerCell2 = new TableCell { Text = (dateSlot == currentDate.ToString("dd-MM-yyyy") ? "Today" : ((dateSlot == currentDate.AddDays(1).ToString("dd-MM-yyyy") ? "Tomorrow" : dateSlot))), CssClass = "headerCell" };
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

                        TableCell todayCell = CreateButtonCell(dateTime, "Available"); // Today
                        todayCell.CssClass = "cellBorder";
                        timeSlotRow.Cells.Add(todayCell);
                    }

                    //TableCell tomorrowCell = CreateButtonCell(timeSlot, "Available", hour, minute, false); // Tomorrow
                    //tomorrowCell.CssClass = "cellBorder";
                    //timeSlotRow.Cells.Add(tomorrowCell);

                    AppointmentTable.Rows.Add(timeSlotRow);

                }

            }

            //startTime = startTime.Add(slotDuration);
            //}
        }

        private TableCell CreateButtonCell(string dateTime, string initialText)
        {
            TableCell cell = new TableCell();

            Button button = new Button
            {
                ID = $"btn_{dateTime}",
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
            Response.Write(e.ToString());

            Button button = (Button)sender;
            string timeSlot = button.CommandArgument;
            string newText = "booked";

            Response.Write(timeSlot.ToString());


            button.Text = newText;
            button.CssClass = "btnBooked btn btn-Danger";
        }

    }
}