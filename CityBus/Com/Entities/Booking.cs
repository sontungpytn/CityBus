using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class Booking
    {
        public string BookingID { get; set; }
        public string UserEmail { get; set; }
        public bool BookingState { get; set; }
        public DateTime BookingDate { get; set; }
        public string BusDetailID { get; set; }
        public DateTime DepartureDate { get; set; }
        public DateTime ArrivalDate { get; set; }
        public double Amount { get; set; }
    }
}