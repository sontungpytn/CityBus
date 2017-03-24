<%@ Page Title="CITY BUS" Language="C#" MasterPageFile="~/User.Master"
    AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CityBus.Index"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Theme/css/index.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nova+Oval" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <div class="container-fluid">
        <div class="header text-center">
            <span>CITY BUS</span>
        </div>
        <div id="slider">
            <figure>
                <img src="Theme/img/City Wallpaper 11.jpg" />
                <img src="Theme/img/636140659029117301-893379077_city.jpeg" />
                <img src="Theme/img/Free City HD Wallpaper Images For Desktop Download.jpg" />
                <img src="Theme/img/Sky_City_3278.jpg" />
                <img src="Theme/img/city-wallpaper-10.jpg" />
            </figure>
        </div>
        
    </div>


    <form runat="server">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">


            <ContentTemplate>--%>


        <div class="container-fluid" id="search">
            <div class="container">
                <div class="text-center">
                    <h3>
                        <asp:Label ID="lbNeedSearch" runat="server" Text=""></asp:Label>
                    </h3>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>From city</label>
                            <asp:DropDownList ID="cboFromCity" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Departure Date</label>
                            <asp:TextBox ID="txtDepartureDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                            <asp:Label ID="lbRequiredDate" runat="server" CssClass="alert-danger"></asp:Label>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>To city</label>
                            <asp:DropDownList ID="cboToCity" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Number of passengers</label>
                            <asp:TextBox ID="txtPassengerNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Label ID="lbNumberRequired" runat="server" CssClass="alert-danger"></asp:Label>
                            <br />
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-block btn-warning" OnClick="btnSearch_Click" onclink="window.scrollTo(0, document.body.scrollHeight);" />
                            

                        </div>
                    </div>
                </div>


            </div>
        </div>

        <div class="container-fluid" id="result">
            <div class="container">
                <h1 class="text-center text-danger">
                    <asp:Label ID="lbError" runat="server" Text=""></asp:Label>
                </h1>
                <asp:GridView ID="gvResult" runat="server" CssClass="table table-hover table-responsive"
                    AutoGenerateColumns="false" OnRowCommand="gvResult_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Bus Name" HeaderText="Bus Name" SortExpression="b.BusName" />
                        <asp:BoundField DataField="Departure Time" HeaderText="Departure Time" SortExpression="bd.DepartureTime" />
                        <asp:BoundField DataField="Arrival Time" HeaderText="Arrival Time" SortExpression="r.Duration" />
                        <asp:BoundField DataField="Available Seat" HeaderText="Available Seat" SortExpression="bd.AvailableSeat" />
                        <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="b.Fare" />
                        <asp:BoundField DataField="BusDetailID" HeaderText="BusDetailID" Visible="false" />
                        <asp:TemplateField HeaderText="Book">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" Text="Book now" CssClass="btn btn-success"
                                    CommandArgument='<%#Eval("BusDetailID") %>' CommandName="Book">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
