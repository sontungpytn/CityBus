using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CityBus.Com.Entities;
using System.Collections.Specialized;
using CityBus.Com.DAO;

namespace CityBus
{
    public partial class BookingPage : System.Web.UI.Page
    {
        public SearchResult sr;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Session["needLoginMsg"] = "You need login first";
                Session["redirectUrl"] = "BookingPage.aspx";
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (Session["searchResult"] != null)
                {
                    sr = (SearchResult)Session["searchResult"];
                    lbFromCity.Text = sr.FromCity;
                    lbToCity.Text = sr.ToCity;
                    lbFromTime.Text = sr.DepartureTime;
                    lbToTime.Text = sr.ArrivalTime;
                    lbFare.Text = sr.Fare + "";
                    lbBusName.Text = sr.BusName;
                    lbAvailableSeat.Text = sr.AvailableSeat + "";
                    lbTotal.Text = sr.Fare * sr.passNum + "";
                    lbDepartureDate.Text = sr.DepartureDate.ToString("MMMM dd, yyyy");
                }
                else
                {
                    Session.Add("msg", "You need search Bus first");
                    Response.Redirect("Index.aspx#search");
                }
            }

            NameValueCollection posted = Request.Form;
            if (posted.Count != 0)
            {
                List<Passenger> passengers = new List<Passenger>();
                for (int i = 0; i < sr.passNum; i++)
                {
                    Passenger p = new Passenger();
                    p.PassengerName = posted["txtName" + i];
                    p.Phone = posted["txtPhone" + i];
                    p.NationalID = posted["txtNational" + i];
                    passengers.Add(p);
                }
                UserInfo user =(UserInfo) Session["user"];
                Booking b = new Booking();
                b.BookingDate = DateTime.Now;
                b.UserEmail = user.Email;
                b.BookingState = true;
                b.BusDetailID = sr.DetailID;
                b.DepartureDate = sr.DepartureDate;
                b.ArrivalDate = DateTime.Now;
                b.Amount = sr.passNum * sr.Fare;
                
                try
                {
                    BookingDAO.AddBooking(b, passengers);
                    try
                    {
                        SendMail sm = new SendMail();
                        sm.MailTo = user.Email;
                        sm.Subject = "Booking new bus from City Bus";
                        sm.Body = "<h2>Hi, " + user.Name + "</h2>" +
                        "<p>You have been booked new bus from City Bus. Bus info: </p>"+
                        "<p> Bus Name "+sr.BusName+"<br>"+
                        "From "+sr.FromCity+" <br> "+
                        "To " + sr.ToCity + " <br> "+
                        "Departure Date " + sr.DepartureDate.ToString("MMMM dd, yyyy") + " <br> "+
                        "Departure Time " + sr.DepartureTime + " <br>  </p> " +
                        "<p>Thanks, <br> City Bus Team.</p>";
                        sm.Send();
                        Response.Redirect("Profile.aspx");
                    }
                    catch (Exception)
                    {
                        msgError.Text = "Booking succesfully but can not send email";
                        
                    }
                }
                catch (Exception ex)
                {
                    msgError.Text = "Can not booking";
                }
                
            }
        }

        
    }
}