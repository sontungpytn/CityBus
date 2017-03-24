<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateBus.aspx.cs" Inherits="CityBus.Admin.AdminUpdateBus" %>

<%@ Import Namespace="CityBus.Com.Entities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <header class="panel-heading">
                UPDATE BUS
            </header>
            <div class="panel-body">
                <form id="form1" class="form-horizontal" runat="server">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">BusID</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtID" ReadOnly="true"
                                CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Bus Name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtBusName"
                                CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Select RouteID</label>
                        <div class="col-sm-9">
                            <asp:DropDownList AutoPostBack="true" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Route name</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtRouteName" ReadOnly="true"
                                CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Fare</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtFare"
                                CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Total seat</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtSeat"
                                CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-9">
                            <asp:LinkButton CssClass="btn btn-info" ID="LinkButton1"
                                runat="server" OnClick="LinkButton1_Click">
                                            <span class="glyphicon glyphicon-saved"></span> Save
                            </asp:LinkButton>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
