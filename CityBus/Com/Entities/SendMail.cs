using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace CityBus.Com.Entities
{
    public class SendMail
    {
        

        public  void Send(string mailTo)
        {
            MailMessage MyMail = new MailMessage();
            MyMail.From = new MailAddress("city.bus.fu@gmail.com");

        }
    }
}