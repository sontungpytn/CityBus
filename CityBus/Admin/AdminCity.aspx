<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCity.aspx.cs" Inherits="CityBus.Admin.AdminCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    City table
                </header>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CityID" DataSourceID="dsCity" CssClass="table table-hover" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" />
                                <asp:BoundField DataField="CityName" HeaderText="CityName" SortExpression="CityName" />
                                <asp:BoundField DataField="NationalID" HeaderText="NationalID" SortExpression="NationalID" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="Data Source=(local);Initial Catalog=CityBus;User ID=sa;Password=123456" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [CITIES]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
