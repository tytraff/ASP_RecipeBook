<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <h1 class="text-center">Recipes</h1>
    <hr />
    <asp:Panel ID="Panel1" runat="server" CssClass="container">
        <div class="row">
            <h1>Recipes List</h1>
            <a href="addRecipe.aspx" class="btn btn-success btn-sm">
                <i class="fa fa-plus"></i> Add Recipe
            </a>
            <br />
            <br />
            <asp:GridView ID="RecipesGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped table-hover"
                DataKeyNames="ID" OnRowDeleting="RecipesGridView_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" Visible="true" />
                    <asp:BoundField DataField="Name" HeaderText="Recipe Name" Visible="true" />
                    <asp:BoundField DataField="Description" HeaderText="Description" Visible="true" />
                    <asp:BoundField DataField="SubmittedBy" HeaderText="Submited By" Visible="true" />
                    <asp:BoundField DataField="PrepTime" HeaderText="Cooking Time" Visible="true" />
                    <asp:BoundField DataField="Servings" HeaderText="Number Of Serving" Visible="true" />
                    <asp:CommandField HeaderText="Detail" ControlStyle-CssClass="btn btn-success btn-sm" DeleteText="Detail" ShowDeleteButton="true" ButtonType="Link"/>
                    <asp:CommandField HeaderText="Delete" ControlStyle-CssClass="btn btn-danger btn-sm" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete"
                        ShowDeleteButton="true" ButtonType="Link" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" CssClass="btn-group center-block">
        <asp:Button ID="btnDark" runat="server" Text="Dark" OnClick="btnDark_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnLight" runat="server" Text="Light" OnClick="btnLight_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnDefault" runat="server" Text="Default" OnClick="btnDefault_Click" CssClass="btn btn-default" CausesValidation="false" />
    </asp:Panel>
</asp:Content>


