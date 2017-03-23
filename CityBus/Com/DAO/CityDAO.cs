using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class CityDAO
    {
        public static DataTable GetDataCity()
        {
            return DAO.GetDataTable("SELECT * FROM Cities");
        }

        public static bool DeleteCity(string cityID)
        {
            string sql = "DELETE Cities WHERE CityID = @id";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@id", cityID);
            return DAO.ExecuteCommand(cmd);
        }
        public static bool UpdateCity(City c)
        {
            string sql = "UPDATE Cities" +
                         " SET CityName = @name," +
                         " NationalID = @nationalID," +
                         " WHERE CityID = @cityID";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@name", c.CityName);
            cmd.Parameters.AddWithValue("@nationalID", c.NationalID);
            cmd.Parameters.AddWithValue("@cityID", c.CityID);
            return DAO.ExecuteCommand(cmd);
        }
    }
}