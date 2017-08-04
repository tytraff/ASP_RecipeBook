<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <div class="container">
        <div class="row">
            Submitted By:
    <asp:DropDownList AppendDataBoundItems="True" ID="SubmittedBy" runat="server" DataSourceID="SqlDataSource4" DataTextField="SubmittedBy" DataValueField="SubmittedBy" CssClass="form-control">
        <asp:ListItem Selected="True">All</asp:ListItem>
    </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:COMP229S17S2ConnectionString %>" SelectCommand="SELECT [SubmittedBy] FROM [recipe]"></asp:SqlDataSource>
            <br />
            Category:
    <asp:DropDownList AppendDataBoundItems="True" ID="Category" runat="server" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="Category" CssClass="form-control">
        <asp:ListItem Selected="True">All</asp:ListItem>
    </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COMP229S17S2ConnectionString %>" SelectCommand="SELECT [Category] FROM [recipe]"></asp:SqlDataSource>
            <br />
            Ingredient:
    <asp:DropDownList AppendDataBoundItems="True" ID="Ingredient" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name" CssClass="form-control">
        <asp:ListItem Selected="True">All</asp:ListItem>
    </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COMP229S17S2ConnectionString %>" SelectCommand="SELECT [Name] FROM [ingredient]"></asp:SqlDataSource>
            <br />
            

            <div class="text-center">
                <asp:Button ID="Button1" ControlStyle-CssClass="btn btn-primary btn-sm" runat="server" Text="Search!" OnClick="Button1_Click" />
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <br />
                        <asp:GridView ID="RecipeGridView" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-bordered table-striped table-hover" DataKeyNames="Id" OnRowDeleting="RecipesGridView_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" Visible="true" />
                                <asp:BoundField DataField="Name" HeaderText="Recipe Name" Visible="true" />
                                <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" />
                                <asp:BoundField DataField="SubmittedBy" HeaderText="Submited By" Visible="true" />
                                <asp:BoundField DataField="PrepTime" HeaderText="Cooking Time" Visible="true" />
                                <asp:BoundField DataField="Servings" HeaderText="Number Of Serving" Visible="true" />
                                <asp:ButtonField HeaderText="Detail" ButtonType="Link" ControlStyle-CssClass="btn btn-success btn-sm" Text="Detail" />
                                <asp:CommandField HeaderText="Delete" ControlStyle-CssClass="btn btn-danger btn-sm" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" ButtonType="Link" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


