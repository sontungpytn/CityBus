using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class Bus
    {
        public string BusID { get; set; }
        public string BusName { get; set; }
        public string RouteID { get; set; }
        public double Fare { get; set; }
        public int TotalSeat { get; set; }
    }
}