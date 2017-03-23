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
                        <div class="form-group col-md-3 col-md-offset-9">
                            <asp:TextBox ID="txtSearch" placeholder="Bus Name" onfocus="if(this.value===this.defaultValue)this.value='';"
                                CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="btnSearch"
                                runat="server">
                                            <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                        </div>
                    </div>
                    <hr />
                    <div class="col-md-12 table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AllowPaging="true" PageSize="10"
                            AutoGenerateColumns="False" DataKeyNames="BusID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="BusID" HeaderText="BusID" ReadOnly="True" SortExpression="BusID" />
                                <asp:BoundField DataField="BusName" HeaderText="BusName" SortExpression="BusName" />
                                <asp:BoundField DataField="RouteID" HeaderText="RouteID" SortExpression="RouteID" />
                                <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
                                <asp:BoundField DataField="TotalSeat" HeaderText="TotalSeat" SortExpression="TotalSeat" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton  CssClass="btn btn-sm btn-warning" ID="btnUpdate"
                                            CommandArgument='<%# Eval("BusID") %>'
                                            CommandName="Update" runat="server">
                                            <span class="glyphicon glyphicon-edit"></span> Update
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
