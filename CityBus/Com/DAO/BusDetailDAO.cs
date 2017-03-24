using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CityBus.Com.Entities;
using CityBus.Com.DAO;
using System.Data.SqlClient;

namespace CityBus.Com.DAO
{
    public class BusDetailDAO
    {
        protected static SqlConnection conn = DAO.Connection;
        //Get bus detail by busID
        public static DataTable GetBusDetail(string id)
        {
            string sql = "SELECT b.BusID,b.BusName,bd.BusDetailID," +
                        " ((SELECT CityName FROM CITIES WHERE r.FromCityID = CityID) + ' - ' + (SELECT CityName FROM CITIES WHERE r.ToCityID = CityID)) as Route," +
                        " bd.DepartureDate,bd.DepartureTime,bd.AvailableSeat, b.TotalSeat" +
                        " FROM BUSES b, BUSDETAIL bd, ROUTES r" +
                        " WHERE b.BusID = bd.BusID" +
                        " AND r.RouteID = b.RouteID" +
                        " AND b.BusID = \'" + id + "\'";
            return DAO.GetDataTable(sql);
        }
        public static void AddBusDetail(BusDetail bd)
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            SqlTransaction transaction = conn.BeginTransaction();
            cmd.Connection = conn;
            cmd.Transaction = transaction;
            try
            {
                cmd.CommandText = "INSERT INTO BusDetail VALUES(@id,@bid,@time,@date,@availableSeat)";
                cmd.Parameters.AddWithValue("@id", bd.BusDetailID);
                cmd.Parameters.AddWithValue("@bid", bd.BusID);
                cmd.Parameters.AddWithValue("@time", bd.DepartureTime);
                cmd.Parameters.AddWithValue("@date", bd.DepartureDate);
                cmd.Parameters.AddWithValue("@availableSeat", bd.AvailableSeat);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}