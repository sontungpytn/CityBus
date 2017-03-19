using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class BookingDetail
    {
        public string BookingID { get; set; }
        public string BusName { get; set; }
        public DateTime BookingDate { get; set; }
        public string FromCity { get; set; }
        public string ToCity { get; set; }
        public double Amount { get; set; }
        public DateTime DepartureDate { get; set; }
        public int DepartureTime { get; set; }
        public int BookingState { get; set; }
    }
}