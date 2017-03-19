using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class RouteDAO
    {
        public static DataTable GetDataRoute()
        {
            return DAO.GetDataTable("SELECT * FROM Route");
        }
    }
}