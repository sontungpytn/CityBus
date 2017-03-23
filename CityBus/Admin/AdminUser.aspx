<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="CityBus.Admin.AdminUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    User table
                </header>
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Email"
                            AutoGenerateColumns="False" CssClass="table table-hover" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Email" ReadOnly="true" HeaderText="Email" />
                                <asp:BoundField DataField="password" HeaderText="Password" />
                                <asp:BoundField DataField="name" HeaderText="Fullname" />
                                <asp:BoundField DataField="role" ReadOnly="true" HeaderText="Is Admin" />
                                <asp:CommandField ShowEditButton="true" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="" ID="btnDelete" OnClientClick="return confirm('Are you sure to delete?')"
                                            CommandArgument='<%# Eval("Email") %>'
                                            CommandName="Delete" runat="server" Text="Delete">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div class="form-inline">
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Name:</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="chkAdmin" runat="server" />
                                    Admin</label>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-block btn-info" Text="Add" OnClick="btnAdd_Click" />
                                
                            </div>
                        </div>
                        <div>
                            <asp:Label ID="lblresult" runat="server"></asp:Label>
                        </div>
                    </div>
                    <%--<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail"
                             ForeColor="Red" runat="server" ErrorMessage="Email must not be empty"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                             ForeColor="Red" runat="server" ErrorMessage="Password must not be empty"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName"
                             ForeColor="Red" runat="server" ErrorMessage="Name must not be empty"></asp:RequiredFieldValidator>
                    </div>--%>
                </div>
            </div>
        </div>
    </form>

</asp:Content>
