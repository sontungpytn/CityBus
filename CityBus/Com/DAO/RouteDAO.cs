using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CityBus.Com.Entities;
using System.Data.SqlClient;

namespace CityBus.Com.DAO
{
    public class RouteDAO
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static DataTable GetDataRoute()
        {
            string sql = "SELECT RouteID, " +
                          " ((SELECT CityName FROM CITIES WHERE CityID = FromCityID) + ' - '" +
                          " + (SELECT CityName FROM CITIES WHERE CityID = ToCityID)) as Route, Duration" +
                          " FROM ROUTES ORDER BY Route DESC ";
            return DAO.GetDataTable(sql);
        }
        //update Route
        public static bool UpdateRoute(string id, int duration)
        {
            string sql = "UPDATE Routes " +
                        " SET Duration = @duration" +
                        " WHERE RouteID = @id";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@duration", duration);
            cmd.Parameters.AddWithValue("@id", id);
            return DAO.ExecuteCommand(cmd);
        }
        public static DataTable GetDataRouteByID(string id)
        {
            string sql = "SELECT RouteID, " +
                          " ((SELECT CityName FROM CITIES WHERE CityID = FromCityID) + ' - '" +
                          " + (SELECT CityName FROM CITIES WHERE CityID = ToCityID)) as Route, Duration" +
                          " FROM ROUTES WHERE RouteID = \'" + id + "\'";
            return DAO.GetDataTable(sql);
        }

        public static bool addRoute(Route route)
        {
            string sql = "INSERT INTO [ROUTES] VALUES(@routeId,@fromCity,@toCity,@duration)";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@routeId", route.RouteID);
            cmd.Parameters.AddWithValue("@fromCity", route.FromCityID);
            cmd.Parameters.AddWithValue("@toCity", route.ToCityID);
            cmd.Parameters.AddWithValue("@duration",route.Duration);
            return DAO.ExecuteCommand(cmd);
        }


    }
}
