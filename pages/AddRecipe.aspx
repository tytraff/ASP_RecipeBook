<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="AddRecipie" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Content/AddRecipe.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="Server">
    <asp:Label ID="testLabel" runat="server"></asp:Label>
    <h1 class="text-center">ADD A RECIPE!</h1>
    <hr />

    <asp:Panel ID="Panel1" runat="server" CssClass=" container form-group">
        <div>
            <h1>Recipe Info</h1>
            <p>
                <b>Recipe Name: </b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <b>Submitted By:</b>
                <asp:RequiredFieldValidator ID="reqSubmit" runat="server" ControlToValidate="txtSubmit" ErrorMessage="Submitted By Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtSubmit" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <b>Category:</b>
                <asp:RequiredFieldValidator ID="reqCat" runat="server" ControlToValidate="txtCategory" ErrorMessage="Category Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <b>Prep/Cook Time:</b>
                <asp:RequiredFieldValidator ID="reqTime" runat="server" ControlToValidate="txtTime" ErrorMessage="Prep Time Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTime" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <b>Num Of Servings:</b>
                <asp:RequiredFieldValidator ID="reqServings" runat="server" ControlToValidate="txtServings" ErrorMessage="Servings Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtServings" runat="server" CssClass="form-control"></asp:TextBox>
            </p>
            <p>
                <b>Description:</b>
                <asp:RequiredFieldValidator ID="reqDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
            </p>

            <asp:Panel ID="pnlIngredients" runat="server" CssClass="panel panel-default">
                <asp:Panel ID="Panel3" runat="server" CssClass="panel-heading">
                    <p><b>Ingredients: </b></p>
                </asp:Panel>
                <asp:Panel ID="pnlDropDown" runat="server" CssClass="panel-body">
                    <asp:Label ID="lblDrop" runat="server" Text="Label"></asp:Label>
                    <asp:DropDownList ID="numberIngredients" runat="server" CssClass="form-control dlist">
                        <asp:ListItem Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                        <asp:ListItem Value="3"></asp:ListItem>
                        <asp:ListItem Value="4"></asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                        <asp:ListItem Value="6"></asp:ListItem>
                        <asp:ListItem Value="7"></asp:ListItem>
                        <asp:ListItem Value="8"></asp:ListItem>
                        <asp:ListItem Value="9"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="11"></asp:ListItem>
                        <asp:ListItem Value="12"></asp:ListItem>
                        <asp:ListItem Value="13"></asp:ListItem>
                        <asp:ListItem Value="14"></asp:ListItem>
                        <asp:ListItem Value="15"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Select" OnClick="Button1_Click" CausesValidation="false" CssClass="btn btn-primary" />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount1" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName1" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameOfIngredient" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName1"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity1" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="quantityOfIngredientReq" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity1"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="quantityOfIngredientRang" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity1"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units1" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount2" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName2" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName2"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity2" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity2"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity2"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units2" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount3" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName3"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity3"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity3"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units3" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount4" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName4" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName4"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity4" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity4"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity4"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units4" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount5" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName5" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName5"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity5" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity5"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity5"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units5" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount6" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName6" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName6"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity6" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity6"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator5" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity6"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units6" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount7" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName7" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName7"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity7" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity7"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator6" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity7"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units7" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount8" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName8" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName8"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity8" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity8"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator7" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity8"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units8" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount9" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName9" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName9"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity9" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity9"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator8" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity9"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units9" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount10" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName10" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName10"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity10" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity10"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator9" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity10"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units10" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount11" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName11" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName11"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity11" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity11"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator10" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity11"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units11" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount12" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName12" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName12"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity12" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity12"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator11" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity12"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units12" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount13" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName13" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName13"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity13" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity13"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator12" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity13"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units13" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount14" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName14" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName14"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity14" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity14"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator13" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity14"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units14" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="ingredientAmount15" Visible="false" runat="server">
                    <asp:Label runat="server" Text="Name of Ingredient: "></asp:Label>
                    <asp:TextBox ID="ingredientName15" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Must enter a name for the ingredient." ControlToValidate="ingredientName15"></asp:RequiredFieldValidator><br />

                    <asp:Label runat="server" Text="Quantity: "></asp:Label>
                    <asp:TextBox ID="ingredientQuantity15" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Must enter a value for the quantity." ControlToValidate="ingredientQuantity15"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator14" MinimumValue="0" MaximumValue="1000" Type="Double" runat="server" ErrorMessage="Must enter a quantity of the ingredient." ControlToValidate="ingredientQuantity15"></asp:RangeValidator>
                    <br />
                    <asp:Label runat="server" Text="Unit of Measure (kg, g, l, cups, pieces): "></asp:Label>
                    <asp:DropDownList ID="units15" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Select Unit" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Teaspoon(s)" Value="Teaspoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Tablespoon(s)" Value="Tablespoon(s)"></asp:ListItem>
                        <asp:ListItem Text="Fluid Ounce(s)" Value="Fluid Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Cup(s)" Value="Cup(s)"></asp:ListItem>
                        <asp:ListItem Text="Pint(s)" Value="Pint(s)"></asp:ListItem>
                        <asp:ListItem Text="Quart(s)" Value="Quart(s)"></asp:ListItem>
                        <asp:ListItem Text="Gallon(s)" Value="Gallon(s)"></asp:ListItem>
                        <asp:ListItem Text="Mililitre(s)" Value="Mililitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Litre(s)" Value="Litre(s)"></asp:ListItem>
                        <asp:ListItem Text="Decilitre(s)" Value="Decilitre(s)"></asp:ListItem>
                        <asp:ListItem Text="Pound(s)" Value="Pound(s)"></asp:ListItem>
                        <asp:ListItem Text="Ounce(s)" Value="Ounce(s)"></asp:ListItem>
                        <asp:ListItem Text="Milligram(s)" Value="Milligram(s)"></asp:ListItem>
                        <asp:ListItem Text="Gram(s)" Value="Gram(s)"></asp:ListItem>
                        <asp:ListItem Text="Kilogram(s)" Value="Kilogram(s)"></asp:ListItem>
                        <asp:ListItem Text="Piece(s)" Value="Piece(s)"></asp:ListItem>
                    </asp:DropDownList><br />
                    <br />
                </asp:Panel>
            </asp:Panel>
            <div class="form-group">
                <asp:Label ID="lblImg" runat="server" Text="Label"></asp:Label>
                <asp:FileUpload ID="flImage" runat="server" CssClass="form-control"></asp:FileUpload>
                <p class="help-block">Select An Image Of Dish To Upload.</p>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
            <asp:Label ID="StatusLabel" runat="server" Text="Label"></asp:Label>
            <input type="reset" name="reset" value="Clear Input" class="btn btn-danger" />

        </div>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" CssClass="btn-group center-block">
        <asp:Button ID="btnDark" runat="server" Text="Dark" OnClick="btnDark_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnLight" runat="server" Text="Light" OnClick="btnLight_Click" CssClass="btn btn-default" CausesValidation="false" />
        <asp:Button ID="btnDefault" runat="server" Text="Default" OnClick="btnDefault_Click" CssClass="btn btn-default" CausesValidation="false" />
    </asp:Panel>


</asp:Content>
