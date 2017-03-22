<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBus.aspx.cs" Inherits="CityBus.Admin.AdminBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BusID" DataSourceID="dsBus">
        <Columns>
            <asp:BoundField DataField="BusID" HeaderText="BusID" ReadOnly="True" SortExpression="BusID" />
            <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
            <asp:BoundField DataField="RouteID" HeaderText="RouteID" SortExpression="RouteID" />
            <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
            <asp:BoundField DataField="TotalSeat" HeaderText="TotalSeat" SortExpression="TotalSeat" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsBus" runat="server" ConnectionString="Data Source=(local);Initial Catalog=CityBus;User ID=sa;Password=123456" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BUSES]"></asp:SqlDataSource>
    </form>
</asp:Content>
