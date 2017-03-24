<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CityBus.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <form runat="server">
        <div class="container row">
            <div class="col-md-8 col-md-offset-2">
                <div class="text-center">
                    <h2>Change password</h2>
                </div>
                <h3>
                    <asp:Label ID="lbMessage" runat="server" Text="" CssClass="alert-danger"></asp:Label>
                </h3>
                <div class="form-group">
                    <label>Old password</label>
                    <asp:TextBox ID="txtOld" runat="server" CssClass="form-control"  TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <asp:TextBox ID="txtNew" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Re-type New Password</label>
                    <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-warning" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
