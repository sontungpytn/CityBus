<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CityBus.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link href="Theme/css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="server">
    <form runat="server" id="form1" method="post">
        <div class="container body">
            <div class="row">
                <div class="col-md-6 header">
                    <div>City <span>BUS</span></div>
                </div>
                <div class="col-md-6 form row">
                    <div class="col-md-8 col-md-offset-2 form-inside">
                        <label><asp:Label ID="lbMessage" runat="server" Text="" CssClass="text-danger"></asp:Label></label>
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <label class="text-danger"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ErrorMessage="Invalid email input" ControlToValidate="txtEmail" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator></label>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <label class="text-danger"><asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtPassword"
                                 ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{5,}$" runat="server" 
                                ErrorMessage="Minimum 6 characters">
                            </asp:RegularExpressionValidator></label>
                            <br />
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-warning btn-block" OnClick="Button1_Click"/>
                        <h3 class="text-right"><a href="ForgotPassword.aspx">Forgot password?</a></h3>
                    </div> 
                </div>
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
