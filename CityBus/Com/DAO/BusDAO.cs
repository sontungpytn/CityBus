using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class BusDAO
    {
        /// <summary>
        /// Get all buses
        /// </summary>
        /// <returns></returns>
        public static DataTable GetBus()
        {
            return DAO.GetDataTable("SELECT * FROM BUSES ORDER BY BusName");
        }
        public static DataTable GetBusByName(string name)
        {
            return DAO.GetDataTable("SELECT * FROM BUSES WHERE BusName = N\'" + name + "\'");
        }
        /// <summary>
        /// Get Bus by BusID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Bus GetBusByID(string id)
        {
            SqlConnection conn = DAO.Connection;
            conn.Open();
            string sql = "SELECT * FROM BUSES WHERE BusID = @id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            Bus b = null;
            if (dr.Read())
            {
                b = new Bus();
                b.BusID = dr[0].ToString();
                b.BusName = dr[1].ToString();
                b.RouteID = dr[2].ToString();
                b.Fare = double.Parse(dr[3].ToString());
                b.TotalSeat = int.Parse(dr[4].ToString());
            }
            conn.Close();
            return b;
        }
        public static DataTable GetDataBusByRoute(string fromCity, string toCity, DateTime departureDate, string order, int seats)
        {
            string sql = "SELECT b.BusName,  bd.DepartureTime, r.Duration, bd.AvailableSeat ,b.Fare, bd.BusDetailID " +
                        " FROM BUSDETAIL bd, BUSES b, ROUTES r" +
                        " WHERE bd.BusID = b.BusID AND b.RouteID = r.RouteID" +
                        " AND r.FromCityID = @from" +
                        " AND r.ToCityID = @to" +
                        " AND bd.DepartureDate = @date " +
                        " AND bd.AvailableSeat >= @seats" +
                        " ORDER BY ";
            sql += order;
            SqlConnection conn = DAO.Connection;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@from", fromCity);
            cmd.Parameters.AddWithValue("@to", toCity);
            cmd.Parameters.AddWithValue("@date", departureDate);
            cmd.Parameters.AddWithValue("@seats", seats);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable busTBL = new DataTable();
            busTBL.Load(dr);
            conn.Close();
            return busTBL;
        }
        /// <summary>
        /// Update Bus
        /// </summary>
        /// <param name="busID"></param>
        /// <returns></returns>
        public static bool UpdateBus(Bus b)
        {
            string sql = "UPDATE BUSES" +
                         " SET BusName = @name," +
                         " RouteID = @routeID," +
                         " Fare = @fare," +
                         " TotalSeat = @seat" +
                         " WHERE BusID = @id";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@name", b.BusName);
            cmd.Parameters.AddWithValue("@routeID", b.RouteID);
            cmd.Parameters.AddWithValue("@fare", b.Fare);
            cmd.Parameters.AddWithValue("@seat", b.TotalSeat);
            cmd.Parameters.AddWithValue("@id", b.BusID);
            return DAO.ExecuteCommand(cmd);
        }
        /// <summary>
        /// Add new bus
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        public static void AddBus(Bus b)
        {
            SqlConnection conn = DAO.Connection;
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.Connection = conn;
            try
            {
                cmd.CommandText = "INSERT INTO Buses VALUES(@bid,@name,@routeID,@fare,@seat)";
                cmd.Parameters.AddWithValue("@bid", b.BusID);
                cmd.Parameters.AddWithValue("@name", b.BusName);
                cmd.Parameters.AddWithValue("@routeID", b.RouteID);
                cmd.Parameters.AddWithValue("@fare", b.Fare);
                cmd.Parameters.AddWithValue("@seat", b.TotalSeat);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                conn.Close();
            }
        }

    }
}