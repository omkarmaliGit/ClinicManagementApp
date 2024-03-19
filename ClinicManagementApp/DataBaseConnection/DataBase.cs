using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ClinicManagementApp.DataBaseConnection
{
    public class DataBase
    {
        private static readonly SqlConnection connectDB = new SqlConnection(ConfigurationManager.ConnectionStrings["connectClinicDB"].ConnectionString);

        internal void CloseConnection()
        {
            connectDB.Close();
        }

        internal void setData(string query)
        {
            connectDB.Open();
            SqlCommand cmd = new SqlCommand(query, connectDB);
            cmd.ExecuteNonQuery();
            connectDB.Close();
        }

        internal string getSingleData(string query)
        {
            connectDB.Open();
            SqlCommand cmd = new SqlCommand(query, connectDB);
            return cmd.ExecuteScalar().ToString();
        }

        internal SqlDataReader getData(string query)
        {
            connectDB.Open();
            SqlCommand cmd = new SqlCommand(query, connectDB);
            return cmd.ExecuteReader();
        }

        internal DataTable getTable(string query)
        {
            connectDB.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, connectDB);
            DataTable table = new DataTable();
            da.Fill(table);
            return table;
        }

    }
}