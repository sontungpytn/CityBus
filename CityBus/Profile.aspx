﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CityBus.Profile" %>

<%@ Import Namespace="CityBus.Com.Entities" %>
<%@ Import Namespace="CityBus.Com.DAO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <%
        UserInfo user = null;
        List<BookingDetail> history = null;
        if (Session["user"] != null)
        {
            user = (UserInfo)Session["user"];
            history = BookingDAO.SearchBooking(user.Email);
        }
        else
        {
            Session["needLoginMsg"] = "You need login first";
            Session["redirectUrl"] = "BookingPage.aspx";
            Response.Redirect("Login.aspx");
        }
    %>
    <div class="container">
        <div class="jumbotron userinfo">
            <h2>Name: <%=user.Name %></h2>
            <h2>Name: <%=user.Email %></h2>
            <button class="btn btn-primary">Change Password</button>
        </div>
        <div class="well">
            <table class="table table-hover">
                <thead>
                    <th>Bus Name</th>
                    <th>From City</th>
                    <th>To City</th>
                    <th>Departure Date</th>
                    <th>Amount</th>
                    <th>Departure Time</th>
                    <th>Booking State</th>
                    <th></th>
                </thead>
                <tbody>
                    <%
                        foreach (BookingDetail b in history)
                        {
                    %>
                    <tr>
                        <td><%=b.BusName %></td>
                        <td><%=b.FromCity %></td>
                        <td><%=b.ToCity %></td>
                        <td><%=b.DepartureDate %></td>
                        <td><%=b.Amount %></td>
                        <td><%=b.DepartureTime %></td>
                        <td><%=b.BookingState %></td>
                        <td><%=b.BusName %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
