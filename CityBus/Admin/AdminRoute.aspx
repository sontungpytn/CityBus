<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminRoute.aspx.cs" Inherits="CityBus.Admin.AdminRoute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--ROUTE TABLE--%>
    <form id="form1" runat="server">
        <%--start panel--%>
        <div class="col-md-12">
            <div class="panel panel-primary">
                <header class="panel-heading">
                    ROUTE
                </header>
                <%--start panel body--%>
                <div class="panel-body">
                    <%--start search form--%>
                    <div class="form-inline">
                        <div class="form-group col-md-4 col-md-offset-8 ">
                            <asp:TextBox ID="txtSearch" placeholder="Route ID" onfocus="if(this.value===this.defaultValue)this.value='';"
                                CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="LinkButton3"
                                runat="server" OnClick="SearchRoute">
                                            <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="LinkButton4"
                                runat="server" OnClick="ShowAll">
                                            <span class="glyphicon glyphicon-list-alt"></span> Show all
                            </asp:LinkButton>
                        </div>

                        <%--end search from--%>
                    </div>
                    <hr />
                    <%--show routeTBL--%>
                    <div class="col-md-12 table-responsive">
                        <asp:GridView ID="GridView1" CssClass="table table-hover"
                            AllowPaging="true" DataKeyNames="RouteID"
                            runat="server" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing">
                            <Columns>
                                <asp:BoundField DataField="RouteID" ReadOnly="true" HeaderText="RouteID" />
                                <asp:BoundField DataField="Route" ReadOnly="true" HeaderText="Route" />
                                <asp:BoundField DataField="Duration" HeaderText="Duration(in minutes)" />
                                <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-block glyphicon glyphicon-edit" ShowEditButton="true" />
                            </Columns>
                            <PagerStyle CssClass="pagination-sm" />
                        </asp:GridView>
                    </div>
                    <%--end panel body--%>
                </div>
                <%--end panel--%>
            </div>
        </div>
    </form>
</asp:Content>
