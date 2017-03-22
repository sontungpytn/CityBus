<%@ Page Title="CITY BUS" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CityBus.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Theme/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index</h1>
    <h1>Index<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </h1>

    <div class="container-fluid" id="search">
        <div class="container">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>From city</label>
                                    <asp:DropDownList ID="cboFromCity" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Departure Date</label>
                                    <asp:TextBox ID="txtDepartureDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>To city</label>
                                    <asp:DropDownList ID="cboToCity" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label></label>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-block btn-warning" OnClick="btnSearch_Click" />
                                    <br />
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server">
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
