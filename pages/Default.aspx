<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Content/DefaultStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">

    <asp:panel runat="server" CssClass="jumbotron container">
        <asp:panel runat="server" CssClass="container text-right jumbotext" ID="JumboText">
            <h1 class="lead title"><b>Noni's Kitchen</b></h1>
            <p class="lead subTitle">Bada Bing Bada Boom!</p>
        </asp:panel>
    </asp:panel>

    <asp:panel runat="server" CssClass="container">
        <h1>Get ready to explore Noni's Kitchen, Where you can.....</h1>
        <ul class="list-group">
            <li class="list-group-item">
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/pages/Recipes.aspx" runat="server" CssClass="list-group-item">Browse Recipes</asp:HyperLink></li>
            <li class="list-group-item">
                <asp:HyperLink ID="HyperLink2" NavigateUrl="AddRecipe.aspx" runat="server" CssClass="list-group-item">Add Recipe</asp:HyperLink></li>
            <li class="list-group-item">
                <asp:HyperLink ID="HyperLink3" NavigateUrl="Search.aspx" runat="server" CssClass="list-group-item">Search</asp:HyperLink></li>
        </ul>
    </asp:panel>

    <asp:Panel ID="Panel2" runat="server" CssClass="btn-group center-block">
        <asp:Button ID="btnDark" runat="server" Text="Dark" OnClick="btnDark_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnLight" runat="server" Text="Light" OnClick="btnLight_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnDefault" runat="server" Text="Default" OnClick="btnDefault_Click" CssClass="btn btn-default" CausesValidation="false" />
    </asp:Panel>
</asp:Content>

