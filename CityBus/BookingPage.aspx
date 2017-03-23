<%@ Page Title="Booking" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="BookingPage.aspx.cs" Inherits="CityBus.BookingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Theme/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div class="container-fluid text-center">
        <div class="row">
            <div class="col-md-3">
                <h3>
                    <asp:Label ID="lbBusName" runat="server" Text="Label"></asp:Label>
                </h3>
            </div>
            <div class="col-md-3 text-center">
                <h4>
                    <asp:Label ID="lbFromCity" runat="server" Text="Label"></asp:Label>
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                    <asp:Label ID="lbToCity" runat="server" Text="Label"></asp:Label>
                </h4>
                <br />
                <h4>
                    <asp:Label ID="lbFromTime" runat="server" Text="Label"></asp:Label>
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                    <asp:Label ID="lbToTime" runat="server" Text="Label"></asp:Label>
                </h4>
            </div>
            <div class="col-md-2">
                <h4>Fare</h4>
                <br />
                <h4>
                    <asp:Label ID="lbFare" runat="server" Text="Label"></asp:Label>
                    VND</h4>
            </div>
            <div class="col-md-2">
                <h4>Available Seat</h4>
                <br />
                <h4>
                    <asp:Label ID="lbAvailableSeat" runat="server" Text="Label"></asp:Label></h4>
            </div>
            <div class="col-md-2">
                <a class="btn btn-block btn-default" href="Index.aspx#search">Search again</a>
            </div>
        </div>
    </div>
    <form runat="server">
        <div class="container row">
            <div class="col-md-8 col-md-offset-2">
                <%
                    for (int i = 0; i < sr.passNum; i++)
                    {
                %>
                <h1>as</h1>
                <%}%>
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
