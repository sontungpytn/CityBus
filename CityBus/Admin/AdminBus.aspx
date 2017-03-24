<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBus.aspx.cs" Inherits="CityBus.Admin.AdminBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <header class="panel-heading">
                    BUS TABLE
                </header>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group col-md-2">
                            <asp:LinkButton CssClass="btn btn-lg btn-block" ID="btnAdd"
                                OnClick="AddBus" runat="server">
                                            <span class="fa fa-plus-square-o"></span> Add bus
                            </asp:LinkButton>
                        </div>
                        <div class="form-group col-md-4 col-md-offset-6">
                            <asp:TextBox ID="txtSearch" placeholder="Bus Name" onfocus="if(this.value===this.defaultValue)this.value='';"
                                CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="btnSearch"
                                OnClick="SearchBus" runat="server">
                                            <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="LinkButton2" OnClick="ShowAll"
                                runat="server">
                                            <span class="glyphicon glyphicon-list-alt"></span> Show all
                            </asp:LinkButton>
                        </div>
                    </div>
                    <br /><br /><hr /><br />
                    <div class="col-md-12 table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AllowPaging="true" PageSize="10"
                            AutoGenerateColumns="False" DataKeyNames="BusID" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="BusID" HeaderText="BusID" ReadOnly="True" SortExpression="BusID" />
                                <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
                                <asp:BoundField DataField="RouteID" HeaderText="RouteID" SortExpression="RouteID" />
                                <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
                                <asp:BoundField DataField="TotalSeat" HeaderText="TotalSeat" SortExpression="TotalSeat" />

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="btn btn-sm btn-block" ID="btnUpdate"
                                            OnClick="UpdateBus" CommandArgument='<%# Eval("BusID") %>'
                                            CommandName="Update" runat="server">
                                            <span class="glyphicon glyphicon-edit"></span> Update
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="btn btn-sm btn-link" ID="btnView"
                                            OnClick="ViewBusDetail" CommandArgument='<%# Eval("BusID") %>'
                                            CommandName="ViewDetail" runat="server">
                                            <span class="fa fa-eye"></span> Bus Detail
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
