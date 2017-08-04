<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="pages_Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
<title></title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="~/Content/MasterStyle.css" rel="stylesheet" />
    <link href="~/Content/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <br />
    <br />
    <h1 class="col-md-4 col-md-offset-4">Noni's Kitchen</h1>
    <br />
    <br />
    <form id="form1" runat="server">
        <div class="col-md-4 col-md-offset-4 form-group">
            <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label><br />
            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:Label ID="lblConfirm" runat="server" Text="Confirm Password"></asp:Label><br />
            <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control"></asp:TextBox>
            <br /><br /><br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-control btn btn-primary"/>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/pages/LogIn.aspx">Already Registered? Log In Now!</asp:HyperLink>
        </div>
    </form>
    <script src="~/Scripts/jquery-3.1.1.min.js"></script>
    <script src="~/Scripts/bootstrap.min.js"></script>
</body>
</html>
