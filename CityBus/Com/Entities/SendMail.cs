using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace CityBus.Com.Entities
{
    public class SendMail
    {
        public string MailTo { get; set; }
        public string Subject  { get; set; }
        public string Body { get; set; }
       

        public void Send()
        {
            var fromAddress = new MailAddress("city.bus.fu@gmail.com", "CITY BUS");
            var toAddress = new MailAddress(MailTo);
            string fromPassword = "citybus123";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = Subject,
                Body = Body
            })
            {
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
        }
    }
}