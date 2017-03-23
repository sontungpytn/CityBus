using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

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
                          " FROM ROUTES ";
            return DAO.GetDataTable(sql);
        }

    }
}