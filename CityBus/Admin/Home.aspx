<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CityBus.Admin.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    User table
                </header>
                <div class="panel-body">
                    <div class="table-responsive">
                            <br />
                            <div class="form-group col-md-3 col-md-offset-9">
                                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                                <button type="submit" runat="server" name="btnSearch" class="btn btn-info">
                                    <span class="glyphicon glyphicon-search"></span> Search
                                </button>
                            </div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="dsUser" CssClass="table table-hover" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                            <Columns>
                                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:CheckBoxField DataField="Role" HeaderText="Role" SortExpression="Role" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Email") %>' CommandName="Select" Text="View Booking"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument='<%# Eval("Email") %>' CommandName="Del" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString="Data Source=(local);Initial Catalog=CityBus;User ID=sa;Password=123456" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [USERS] WHERE ([Email] LIKE '%' + @Email + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUser" DefaultValue="@" Name="Email" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</asp:Content>
