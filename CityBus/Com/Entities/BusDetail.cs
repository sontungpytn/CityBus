using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class BusDetail
    {
        public string BusDetailID { get; set; }
        public string BusID { get; set; }
        public int DepartureTime { get; set; }
        public DateTime DepartureDate { get; set; }
        public int AvailableSeat { get; set; }
    }
}