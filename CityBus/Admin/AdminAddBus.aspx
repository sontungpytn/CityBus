<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAddBus.aspx.cs" Inherits="CityBus.Admin.AdminAddBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <header class="panel-heading">
                ADD NEW BUS
            </header>
            <div class="panel-body">
                <form id="form1" class="form-horizontal" runat="server">
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
                            <asp:DropDownList AutoPostBack="true" ID="ddlRoute" runat="server" OnSelectedIndexChanged="ddlRoute_SelectedIndexChanged"></asp:DropDownList>
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
                        <label class="col-sm-2 control-label">Departure date</label>
                        <div class="col-sm-9">
                            <input runat="server" id="txtDate" type="date" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Departure time</label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txtTime" TextMode="Time"
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
                                OnClick="AddBus" runat="server">
                                            <span class="fa fa-plus-square"></span> Save
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-info" ID="LinkButton2"
                                PostBackUrl="~/Admin/AdminBus.aspx" runat="server">
                                            <span class="fa fa-remove"></span> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </form>
                <asp:PlaceHolder ID="phError" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
