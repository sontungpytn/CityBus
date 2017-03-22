using CityBus.Com.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CityBus.Com.DAO
{
    public class UserDAO
    {
        /// <summary>
        /// Get all users
        /// </summary>
        /// <returns>user datatable</returns>
        public static DataTable GetDataUsers()
        {
            return DAO.GetDataTable("SELECT * FROM Users");
        }
        /// <summary>
        /// add a user to db
        /// </summary>
        /// <param name="u">a user</param>
        /// <returns></returns>
        public static bool AddUser(UserInfo u)
        {
            string sql = "INSERT INTO Users VALUES(@email,@password,@name,@role)";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@email", u.Email);
            cmd.Parameters.AddWithValue("@password", u.Password);
            cmd.Parameters.AddWithValue("@name", u.Name);
            cmd.Parameters.AddWithValue("@role", u.Role ? 1 : 0);
            return DAO.ExecuteCommand(cmd);
        }
        /// <summary>
        /// update password
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static bool UpdateUserPassword(string email, string password)
        {
            string sql = "UPDATE USERS" +
                         " SET Password = @password" +
                         " WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(sql, DAO.Connection);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@email", email);
            return DAO.ExecuteCommand(cmd);
        }
        /// <summary>
        /// Search user for login
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static UserInfo SearchUser(string email, string password)
        {
            UserInfo user = null;
            SqlConnection conn = DAO.Connection;
            conn.Open();
            string sql = "SELECT * FROM Users WHERE Email=@email AND Password=@password";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                user = new UserInfo();
                user.Email = reader[0].ToString();
                user.Name = reader[2].ToString();
                //user.Role = (int)reader[3];
                //Console.Write(reader);
                user.Role = (bool)reader[3];
            }
            conn.Close();
            return user;
        }

        public static bool DulicateEmail(string email)
        {
            SqlConnection conn = DAO.Connection;
            conn.Open();
            string sql = "SELECT * FROM Users WHERE Email = @email ";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                conn.Close();
                return true;
            }
            conn.Close();
            return false;
        }

    }
}