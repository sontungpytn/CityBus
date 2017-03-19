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
            cmd.Parameters.AddWithValue("@role", u.Role);
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

    }
}