using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace CityBus.Com.DAO
{
    public class DAO
    {
        public static string ConnectionString = WebConfigurationManager.
            ConnectionStrings["CNETConnectionString"].ConnectionString;
        static SqlConnection conn;
        static SqlDataAdapter da;
        public static SqlConnection Connection
        {
            get
            {
                return new SqlConnection(ConnectionString);
            }
        }
        public static DataTable GetDataTable(string sql)
        {
            try
            {
                conn = new SqlConnection(ConnectionString);
                da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static bool ExecuteCommand(SqlCommand cmd)
        {
            try
            {
                conn = new SqlConnection(ConnectionString);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}