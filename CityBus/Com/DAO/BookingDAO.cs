using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class BookingDAO
    {
        static SqlConnection conn = DAO.Connection;
        /// <summary>
        /// add new booking
        /// </summary>
        /// <param name="userEmail">like ID of User</param>
        /// <param name="b">a booking model</param>
        /// <returns></returns>
        public static void AddBooking( Booking b, List<Passenger> passengers) 
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            SqlTransaction transaction = conn.BeginTransaction();
            cmd.Connection = conn;
            cmd.Transaction = transaction;
            try
            {

                //Update available seats
                cmd.CommandText = "UPDATE BUSDETAIL SET AvailableSeat = (AvailableSeat - @num) WHERE BusDetailID = @busdetailid";
                cmd.Parameters.AddWithValue("@num", passengers.Count);
                cmd.Parameters.AddWithValue("@busdetailid", b.BusDetailID);
                cmd.ExecuteNonQuery();

                string bookingID;
                do
                {
                    cmd.Parameters.Clear();
                    bookingID = DAO.RandomID();
                    cmd.CommandText = "Select * from BOOKING where BookingID = @bookingid";
                    cmd.Parameters.AddWithValue("@bookingid", bookingID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    bool exist = reader.Read();
                    reader.Close();
                    if (!exist) break;
                } while (true);

                //insert booking
                cmd.CommandText = "INSERT INTO Booking VALUES(@id,@userEmail,@state,@date,@busDetailID,@departureDate,@arrivalDate,@amount)";
                cmd.Parameters.AddWithValue("@id", bookingID);
                cmd.Parameters.AddWithValue("@userEmail", b.UserEmail);
                cmd.Parameters.AddWithValue("@state", b.BookingState);
                cmd.Parameters.AddWithValue("@date", b.BookingDate);
                cmd.Parameters.AddWithValue("@busDetailID", b.BusDetailID);
                cmd.Parameters.AddWithValue("@departureDate", b.DepartureDate);
                cmd.Parameters.AddWithValue("@arrivalDate", b.ArrivalDate);
                cmd.Parameters.AddWithValue("@amount", b.Amount);
                cmd.ExecuteNonQuery();
                //insert passenger
                foreach (Passenger p in passengers)
                {
                    string passID;
                    do
                    {
                        cmd.Parameters.Clear();
                        passID = DAO.RandomID();
                        cmd.CommandText = "SELECT * FROM PASSENGER WHERE PassengerID = @pid";
                        cmd.Parameters.AddWithValue("@pid", passID);
                        SqlDataReader reader = cmd.ExecuteReader();
                        bool exist = reader.Read();
                        reader.Close();
                        if (!exist) break;
                    } while (true);
                    cmd.Parameters.Clear();
                    cmd.CommandText = "INSERT INTO PASSENGER VALUES(@pid,@bid,@name,@nationalID,@phone)";
                    cmd.Parameters.AddWithValue("@pid",passID);
                    cmd.Parameters.AddWithValue("@bid", bookingID);
                    cmd.Parameters.AddWithValue("@name", p.PassengerName);
                    cmd.Parameters.AddWithValue("@nationalID", p.NationalID);
                    cmd.Parameters.AddWithValue("@phone", p.Phone);
                    cmd.ExecuteNonQuery();
                }
                transaction.Commit();
            }
            catch (Exception ex)
            {
                
                transaction.Rollback();
                
            }
            finally
            {
                conn.Close();
            }
        }
        /// <summary>
        /// search booking by user
        /// </summary>
        /// <param name="userEmail"></param>
        /// <returns>list of bookings</returns>
        public static List<BookingDetail> SearchBooking(string userEmail)
        {
            conn.Open();
            List<BookingDetail> bookings = new List<BookingDetail>();
            string sql = "SELECT bo.BookingID,b.BusName,bo.BookingDate," +
                        " (SELECT CityName FROM CITIES WHERE r.FromCityID = CityID) as FromCity," +
                        " (SELECT CityName FROM CITIES WHERE r.ToCityID = CityID) as ToCity," +
                        " bo.Amount,bo.DepartureDate,bd.DepartureTime,bo.BookingDate" +
                        " FROM BOOKING bo, BUSDETAIL bd,BUSES b, ROUTES r" +
                        " WHERE bo.BusDetailID = bd.BusDetailID" +
                        " AND bd.BusID = b.BusID" +
                        " AND b.RouteID = r.RouteID" +
                        " AND bo.UserEmail = @userEmail";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@userEmail", userEmail);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                BookingDetail b = new BookingDetail();
                b.BookingID = r[0].ToString();
                b.BusName = r[1].ToString();
                b.BookingDate = DateTime.Parse(r[2].ToString());
                b.FromCity = r[3].ToString();
                b.ToCity = r[4].ToString();
                b.Amount = double.Parse(r[5].ToString());
                b.DepartureDate = DateTime.Parse(r[6].ToString());
                b.DepartureTime = r[7].ToString();
                b.BookingDate = DateTime.Parse(r[8].ToString());
                bookings.Add(b);
            }
            conn.Close();
            return bookings;
        }

        
        public static void DeleteBooking(string bookingID)
        {
            conn.Open();
            string sql = "DELETE PASSENGER WHERE BookingID = \'" + bookingID + "\'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            sql = "DELETE BOOKING WHERE BookingID = \'" + bookingID + "\'";
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}