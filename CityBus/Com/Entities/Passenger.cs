using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class Passenger
    {
        public string PassengerID { get; set; }
        public string BookingID { get; set; }
        public string PassengerName { get; set; }
        public string NationalID { get; set; }
        public string Phone { get; set; }
    }
}