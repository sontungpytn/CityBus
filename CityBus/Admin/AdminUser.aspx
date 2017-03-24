<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="CityBus.Admin.AdminUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <header class="panel-heading">
                    USER TABLE
                </header>
                <div class="panel-body">
                    <div class="form-inline">
                        <div class="form-group col-md-3 col-md-offset-9">
                            <asp:TextBox ID="txtSearch" placeholder="Email" onfocus="if(this.value===this.defaultValue)this.value='';"
                                CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:LinkButton CssClass="btn btn-sm btn-info" ID="btnSearch" OnClick="SearchUser"
                                runat="server">
                                            <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                        </div>
                    </div>
                    <br /><br /><hr /><br />
                    <div class="col-md-12 table-responsive">
                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Email" AllowPaging="true" PageSize="10"
                            AutoGenerateColumns="False" CssClass="table table-hover" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Email" ReadOnly="true" HeaderText="Email" />
                                <asp:BoundField DataField="password" HeaderText="Password" />
                                <asp:BoundField DataField="name" HeaderText="Fullname" />
                                <asp:CheckBoxField DataField="role" ReadOnly="true" HeaderText="Is Admin" />
                                <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-sm btn-block glyphicon glyphicon-edit" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton CssClass="btn btn-sm btn-danger" ID="btnDelete" OnClientClick="return confirm('Are you sure to delete?')"
                                            CommandArgument='<%# Eval("Email") %>'
                                            CommandName="Delete" runat="server">
                                            <span class="glyphicon glyphicon-remove"></span> Delete
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
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
                            <asp:LinkButton CssClass="btn btn-info" ID="LinkButton1" OnClick="btnAdd_Click"
                                runat="server">
                                            <span class="glyphicon glyphicon-plus-sign"></span> Add
                            </asp:LinkButton>
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
