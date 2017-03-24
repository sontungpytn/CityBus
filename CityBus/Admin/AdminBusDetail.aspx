<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBusDetail.aspx.cs" Inherits="CityBus.Admin.AdminBusDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <header class="panel-heading">
                    BUS DETAIL
                </header>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group col-md-2">
                            <asp:LinkButton CssClass="btn btn-lg btn-block" ID="btnAdd"
                                PostBackUrl="~/Admin/AdminBus.aspx" runat="server">
                                            <span class="fa fa-backward"></span> Back to Bus
                            </asp:LinkButton>
                        </div>
                        <div class="form-group col-md-3 col-md-offset-7">
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
                            AutoGenerateColumns="False" DataKeyNames="BusID">
                            <Columns>
                                <asp:BoundField DataField="BusID" HeaderText="BusID" ReadOnly="True" />
                                <asp:BoundField DataField="BusName" HeaderText="BusName" />
                                <asp:BoundField DataField="BusDetailID" HeaderText="BusDetailID" />
                                <asp:BoundField DataField="Route" HeaderText="Route" />
                                <asp:BoundField DataField="DepartureDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="DepartureDate" />
                                <asp:BoundField DataField="DepartureTime" HeaderText="DepartureTime" />
                                <asp:BoundField DataField="AvailableSeat" HeaderText="AvailableSeat" />
                                <asp:BoundField DataField="TotalSeat" HeaderText="TotalSeat" />
                                <%--<asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton  CssClass="btn btn-sm btn-warning" ID="btnUpdate"
                                            CommandArgument='<%# Eval("BusID") %>'
                                            CommandName="Update" runat="server">
                                            <span class="glyphicon glyphicon-edit"></span> Update
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton  CssClass="btn btn-sm btn-info" ID="btnView"
                                            CommandArgument='<%# Eval("BusID") %>'
                                            CommandName="View" runat="server">
                                            <span class="fa fa-eye"></span> Bus Detail
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
