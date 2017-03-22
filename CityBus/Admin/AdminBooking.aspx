<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBooking.aspx.cs" Inherits="CityBus.Admin.AdminBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    Booking Details
                </header>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" DataSourceID="dsBooking" CssClass="table table-hover">
                            <Columns>
                                <asp:BoundField DataField="BookingID" HeaderText="BookingID" ReadOnly="True" SortExpression="BookingID" />
                                <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                                <asp:CheckBoxField DataField="BookingState" HeaderText="BookingState" SortExpression="BookingState" />
                                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                                <asp:BoundField DataField="BusDetailID" HeaderText="BusDetailID" SortExpression="BusDetailID" />
                                <asp:BoundField DataField="DepartureDate" HeaderText="DepartureDate" SortExpression="DepartureDate" />
                                <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="dsBooking" runat="server" ConnectionString="Data Source=(local);Initial Catalog=CityBus;User ID=sa;Password=123456" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BOOKING] WHERE ([UserEmail] = @UserEmail)">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserEmail" QueryStringField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
