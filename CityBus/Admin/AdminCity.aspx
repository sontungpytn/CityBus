<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCity.aspx.cs" Inherits="CityBus.Admin.AdminCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    City table
                </header>
                <div class="panel-body">
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="CityID" AllowPaging="true"
                        AutoGenerateColumns="False" CssClass="table table-hover" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="CityID" ReadOnly="true" HeaderText="CityID" />
                            <asp:BoundField DataField="CityName" HeaderText="CityName" />
                            <asp:BoundField DataField="NationalID" HeaderText="NationalID" />
                            <asp:CommandField ShowEditButton="true" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" OnClientClick="return confirm('Are you sure to delete?')"
                                        CommandArgument='<%# Eval("CityID") %>'
                                        CommandName="Delete" runat="server" Text="Delete">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="form-inline">
                        <div class="form-group">
                            <label>CityID:</label>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-block btn-info" Text="Add" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                    <div>
                        <asp:Label ID="lblresult" runat="server"></asp:Label>
                    </div>
                </div>
                <%--<div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtID"
                        ForeColor="Red" runat="server" ErrorMessage="City ID must not be empty"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtName"
                        ForeColor="Red" runat="server" ErrorMessage="City Name must not be empty"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtNationalID"
                        ForeColor="Red" runat="server" ErrorMessage="National ID must not be empty"></asp:RequiredFieldValidator>
                </div>--%>
            </div>
        </div>
    </form>
</asp:Content>
