<%@ Page Title="Booking" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="BookingPage.aspx.cs" Inherits="CityBus.BookingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Theme/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Theme/css/bookingpage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div class="container-fluid text-center">
        <div class="row search-result">
            <div class="col-md-3">
                <span>
                    <asp:Label ID="lbBusName" runat="server" Text="Label"></asp:Label>
                </span>
            </div>
            <div class="col-md-3 text-center">
                <span>
                    <asp:Label ID="lbFromCity" runat="server" Text="Label"></asp:Label>
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                    <asp:Label ID="lbToCity" runat="server" Text="Label"></asp:Label>
                </span>
               
            </div>
            <div class="col-md-2">
                <span>Fare</span>
                <br />
                <span>
                    <asp:Label ID="lbFare" runat="server" Text="Label"></asp:Label>
                    VND
                </span>
            </div>
            <div class="col-md-2">
                <span>Available Seat</span>
                <br />
                <span>
                    <asp:Label ID="lbAvailableSeat" runat="server" Text="Label"></asp:Label>
                </span>
            </div>
            <div class="col-md-2">
                <span><a class="btn btn-block btn-default btn-lg" href="Index.aspx#search">Modify Search</a></span>
            </div>
        </div>
    </div>
    <form runat="server">
        <h2 class="alert-danger">
            <asp:Label ID="msgError" runat="server" Text=""></asp:Label>
        </h2>
    </form>

    <form method="post" id="passengerForm" action="BookingPage.aspx">
        <div class="container">
            <div class="row ">
                <div class="col-md-8">
                    <%
                        for (int i = 0; i < sr.passNum; i++)
                        {
                    %>

                    <div class="passengerInfo row">
                        <h2>Passenger <%=(i+1) %></h2>
                        <div class="col-md-8 col-md-offset-2">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="txtName<%=i %>" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>National ID</label>
                                <input name="txtNational<%=i %>" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="txtPhone<%=i %>" class="form-control" required />
                            </div>
                        </div>
                    </div>

                    <%}%>

                    <input type="submit" value="Book now" class="btn btn-modify btn-lg" />
                </div>
                <div class="detail col-md-3 col-md-offset-1 ">
                    <div>
                        <div class="header">
                            <span>Bus Info</span>
                        </div>
                        <div class="detail-body">
                            <ul class="list-group">
                                <li class="list-group-item"><strong>Departure time </strong> 
                                    <asp:Label ID="lbFromTime" runat="server" Text=""></asp:Label>
                                </li>
                                <li class="list-group-item"><strong>Arrival time </strong> 
                                    <asp:Label ID="lbToTime" runat="server" Text=""></asp:Label>
                                </li>
                                <li class="list-group-item"><strong>Total Amount </strong> 
                                    <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                                </li>
                                <li class="list-group-item"><strong>Departure Date </strong> 
                                    <asp:Label ID="lbDepartureDate" runat="server" Text=""></asp:Label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
