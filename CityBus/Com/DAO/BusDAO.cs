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
        public static DataTable GetDataBusByRoute(string fromCity, string toCity, DateTime departureDate)
        {
            string sql = "SELECT bd.BusDetailID, b.BusName, (SELECT c.CityName FROM CITIES c WHERE c.CityID = r.FromCityID ) as FromCity," +
                        " (SELECT c.CityName FROM CITIES c WHERE c.CityID = r.ToCityID) as ToCity, bd.DepartureTime, b.Fare, bd.AvailableSeat " +
                        " FROM BUSDETAIL bd, BUSES b, ROUTES r" +
                        " WHERE bd.BusID = b.BusID AND b.RouteID = r.RouteID" +
                        " AND r.FromCityID = @from" +
                        " AND r.ToCityID = @to" +
                        " AND bd.DepartureDate = @date";
            SqlConnection conn = DAO.Connection;
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@from", fromCity);
            cmd.Parameters.AddWithValue("@to", toCity);
            cmd.Parameters.AddWithValue("@date", departureDate);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable busTBL = new DataTable();
            busTBL.Load(dr);
            return busTBL;
        }
    }
}