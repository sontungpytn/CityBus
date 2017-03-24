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
        /// <summary>
        /// Get cities
        /// </summary>
        /// <returns></returns>
        public static DataTable GetDataCity()
        {
            return DAO.GetDataTable("SELECT * FROM Cities ORDER BY CityID");
        }
        public static DataTable GetDataCityByName(string name)
        {
            return DAO.GetDataTable("SELECT * FROM Cities WHERE CityName = N\'" + name + "\' ORDER BY CityID");
        }
        /// <summary>
        /// Add new city
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool AddCity(City c)
        {
            string sql = "INSERT INTO Cities VALUES(@id,@name,@national)";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@id", c.CityID);
            cmd.Parameters.AddWithValue("@name", c.CityName);
            cmd.Parameters.AddWithValue("@national", c.NationalID);
            return DAO.ExecuteCommand(cmd);
        }
        public static bool DeleteCity(string cityID)
        {
            string sql = "DELETE Cities WHERE CityID = @id";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@id", cityID);
            return DAO.ExecuteCommand(cmd);
        }
        /// <summary>
        /// Update City
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool UpdateCity(City c)
        {
            string sql = "UPDATE Cities" +
                         " SET CityName = @name," +
                         " NationalID = @nationalID" +
                         " WHERE CityID = @cityID";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@name", c.CityName);
            cmd.Parameters.AddWithValue("@nationalID", c.NationalID);
            cmd.Parameters.AddWithValue("@cityID", c.CityID);
            return DAO.ExecuteCommand(cmd);
        }
        /// <summary>
        /// Check duplicated CityID
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public static bool DulicateCity(string cityID)
        {
            SqlConnection conn = DAO.Connection;
            conn.Open();
            string sql = "SELECT * FROM Cities WHERE CityID = @cityID ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@cityID", cityID);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                conn.Close();
                return true;
            }
            conn.Close();
            return false;
        }
        
    }
}