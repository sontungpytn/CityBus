<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CityBus.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <form runat="server">
        <div class="container row">
            <div class="col-md-8 col-md-offset-2">
                <div class="text-center">
                    <h2>Forgot password?</h2>
                </div>
                <h3>
                    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
                </h3>
                <div class="form-group">
                    <label>Enter Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Confirm Email</label>
                    <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="btn btn-warning" />
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
