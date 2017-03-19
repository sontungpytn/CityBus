using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class CityDAO
    {
        public DataTable GetDataCity()
        {
            return DAO.GetDataTable("SELECT * FROM Cities");
        }
    }
}