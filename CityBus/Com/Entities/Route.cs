using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class Route
    {
        public string RouteID { get; set; }
        public string FromCityID { get; set; }
        public string ToCityID { get; set; }
        public int Duration { get; set; }
    }
}