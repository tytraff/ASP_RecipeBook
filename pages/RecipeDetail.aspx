<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecipeDetail.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <asp:Panel runat="server" CssClass="container form-group">
        <h1>Recipe:</h1>
        Recipe Name: <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox><br />
        Description: <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox><br />
        Submited by: <asp:Label ID="lblSubmitedBy" runat="server" Text="Label" CssClass="form-control"></asp:Label><br />
        Category: <asp:DropDownList AutoPostBack="True" AppendDataBoundItems="true" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Category" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtCategory" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COMP229S17S2ConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Recipe]"></asp:SqlDataSource>
        <br />
        Cooking time:
        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control"></asp:TextBox><br />
        Number of Serving:
        <asp:TextBox ID="txtNumOfServing" runat="server" CssClass="form-control"></asp:TextBox><br />
        <asp:GridView ID="grd" runat="server" DataKeyNames="Ingredient" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" CssClass="table table-hover table-striped">
            <Columns>
                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Ingredient" InsertVisible="False">
                    <ItemTemplate>
                        <asp:TextBox ID="txtIngredient" runat="server" Text='<%# Eval("Ingredient") %>'></asp:TextBox>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Unit">
                    <ItemTemplate>
                        <asp:TextBox ID="txtUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:TextBox>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                    </ItemTemplate>

                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnAddRow" runat="server" OnClick="btnAddRow_Click" Text="Add Ingredient" CssClass="btn btn-primary"/><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-success"/>
        <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" Text="Delete Recipe" CssClass="btn btn-danger"/>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </asp:Panel>
</asp:Content>
