<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCity.aspx.cs" Inherits="CityBus.Admin.AdminCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <header class="panel-heading">
                    City table
                </header>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group col-md-4 col-md-offset-8 ">
                            <asp:TextBox ID="txtSearch" placeholder="City Name" onfocus="if(this.value===this.defaultValue)this.value='';"
                                CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="btnSearch" OnClick="SearchCity"
                                runat="server">
                                            <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="LinkButton2" OnClick="ShowAll"
                                runat="server">
                                            <span class="glyphicon glyphicon-list-alt"></span> Show all
                            </asp:LinkButton>
                        </div>
                    </div>
                    <hr />
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="CityID" AllowPaging="true"
                        AutoGenerateColumns="False" CssClass="table table-hover" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="CityID" ReadOnly="true" HeaderText="CityID" />
                            <asp:BoundField DataField="CityName" HeaderText="CityName" />
                            <asp:BoundField DataField="NationalID" HeaderText="NationalID" />
                            <asp:CommandField ControlStyle-CssClass="btn btn-sm btn-warning glyphicon glyphicon-edit" ShowEditButton="true" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="btn btn-sm btn-danger" ID="btnDelete" OnClientClick="return confirm('Are you sure to delete?')"
                                        CommandArgument='<%# Eval("CityID") %>'
                                        CommandName="Delete" runat="server" Text="">
                                         <span class="glyphicon glyphicon-remove"></span> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-sm" />
                    </asp:GridView>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>CityID:</label>
                            <asp:TextBox ID="txtID" required="true" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>CityName:</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>NationalID:</label>
                            <asp:TextBox ID="txtNationalID" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:LinkButton CssClass="btn btn-info" ID="LinkButton1" OnClick="btnAdd_Click"
                                runat="server">
                                            <span class="glyphicon glyphicon-plus-sign"></span> Add
                            </asp:LinkButton>
                            <%--<asp:Button ID="" runat="server" CssClass="btn btn-block btn-info" Text="Add" OnClick="btnAdd_Click" />--%>
                        </div>
                    </div>
                </div>
                <%if (Session["addOK"] != null)
                    {%>
                <div class="alert alert-success">
                    <%=Session["addOK"] %>
                </div>
                <%Session.Remove("addOK");
                    } %>
                <asp:PlaceHolder ID="phError" runat="server"></asp:PlaceHolder>
                <div id="error">
                    <asp:Label ID="lblresult" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
