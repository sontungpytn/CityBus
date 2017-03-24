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
        public static DataTable GetBus()
        {
            return DAO.GetDataTable("SELECT * FROM BUSES");
        }
        public static DataTable GetDataBusByRoute(string fromCity, string toCity, DateTime departureDate, string order, int seats)
        {
            string sql = "SELECT b.BusName,  bd.DepartureTime, r.Duration, bd.AvailableSeat ,b.Fare, bd.BusDetailID " +
                        " FROM BUSDETAIL bd, BUSES b, ROUTES r" +
                        " WHERE bd.BusID = b.BusID AND b.RouteID = r.RouteID" +
                        " AND r.FromCityID = @from" +
                        " AND r.ToCityID = @to" +
                        " AND bd.DepartureDate = @date "+
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
        
    }
}