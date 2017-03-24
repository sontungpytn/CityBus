<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCreateRoute.aspx.cs" Inherits="CityBus.Admin.AdminCreateRoute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <header class="panel-heading">
                ADD NEW ROUTE
            </header>
            <div class="panel-body">
                <form id="form1" class="form-horizontal" runat="server">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">From City</label>
                        <div class="col-sm-9">
                            <asp:DropDownList CssClass="form-control" ID="cbFromCity" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">To City</label>
                        <div class="col-sm-9">
                            <asp:DropDownList CssClass="form-control" ID="cbToCity" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Route</label>
                        <div class="col-sm-9">
                            <asp:TextBox CssClass="form-control" ID="txtRoute" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Duration (in minutes)</label>
                        <div class="col-sm-9">
                            <asp:TextBox CssClass="form-control" ID="txtDuration" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-9">
                            <asp:LinkButton CssClass="btn btn-info" ID="btnSave"
                                 runat="server">
                                            <span class="fa fa-plus-square"></span> Save
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-info" ID="btnBack"
                                runat="server">
                                            <span class="fa fa-remove"></span> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </form>
                <asp:PlaceHolder ID="durationError" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
