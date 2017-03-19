using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CityBus.Com.Entities
{
    public class UserInfo
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public int Role { get; set; }
    }
}