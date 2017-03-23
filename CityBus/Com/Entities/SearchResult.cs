using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class SearchResult
    {
        public string DetailID { get; set; }
        public string BusName { get; set; }
        public DateTime DepartureDate { get; set; }
        public string DepartureTime { get; set; }
        public string ArrivalTime { get; set; }
        public int AvailableSeat { get; set; }
        public double Fare { get; set; }
        public string FromCity { get; set; }
        public string ToCity { get; set; }
        public int passNum { get; set; }
    }
}