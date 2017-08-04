using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblImg.Text = "Upload Image:";
        btnSubmit.Text = "Submit Recipe";
        lblDrop.Text = "How many ingredients would you like to include?";


        for (int i = 1; i <= 15; i++)
        {
            Panel a = (Panel)FindControlRecursive(Page, String.Format("pnlIng{0}", i));
            if (a != null)
                a.Visible = false;

        }

    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        string theme = (string)Session["theme"];
        if (theme != null)
        {
            Page.Theme = "Dark";
        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {


            recipe recipeItem = new recipe();
            recipeItem.Name = txtName.Text;
            recipeItem.SubmittedBy = txtSubmit.Text;
            recipeItem.PrepTime = Convert.ToInt32(txtTime.Text);
            recipeItem.Servings = Convert.ToInt32(txtServings.Text);
            recipeItem.Description = txtDescription.Text;
            recipeItem.Category = txtCategory.Text;


            RecipeModel recipeModel = new RecipeModel();
            recipeModel.InsertRecipe(recipeItem);



            int ingamount = Convert.ToInt32(numberIngredients.SelectedValue);

            IngredientModel ingModel = new IngredientModel();
            ingredient ingItem;
            RecipeIngredientModel recIngModel = new RecipeIngredientModel();
            recipeingredient recIngItem;

            string[] ingredName = {ingredientName1.Text, ingredientName2.Text, ingredientName3.Text, ingredientName4.Text, ingredientName5.Text, ingredientName6.Text, ingredientName7.Text,
            ingredientName8.Text, ingredientName9.Text, ingredientName10.Text, ingredientName11.Text, ingredientName12.Text, ingredientName13.Text, ingredientName14.Text, ingredientName15.Text};

            string[] unitType = {units1.Text, units2.Text, units3.Text, units4.Text, units5.Text, units6.Text, units7.Text, units8.Text, units9.Text, units10.Text, units11.Text, units12.Text,
            units13.Text, units14.Text, units15.Text};

            string[] ingQuant = {ingredientQuantity1.Text, ingredientQuantity2.Text, ingredientQuantity3.Text, ingredientQuantity4.Text, ingredientQuantity5.Text, ingredientQuantity6.Text,
            ingredientQuantity7.Text, ingredientQuantity8.Text, ingredientQuantity9.Text, ingredientQuantity10.Text, ingredientQuantity11.Text, ingredientQuantity12.Text, ingredientQuantity13.Text,
            ingredientQuantity14.Text, ingredientQuantity15.Text};

            for (int i = 0; i < ingamount; i++)
            {
                ingItem = new ingredient();
                recIngItem = new recipeingredient();
                ingItem.Name = ingredName[i];
                ingModel.InsertIngredient(ingItem);
                recIngItem.Recipe = recipeModel.GetRecipeIDByName(txtName.Text);
                testLabel.Text = Convert.ToString(recIngItem.Recipe);
                recIngItem.Ingredient = ingModel.getIngredientIDByName(ingredName[i]);
                testLabel.Text += Convert.ToString(recIngItem.Ingredient) + " ";
                recIngItem.UM = unitType[i];
                recIngItem.Quantity = Convert.ToInt32(ingQuant[i]);
                testLabel.Text += recIngItem.UM + " ";
                testLabel.Text += recIngItem.ToString();
                recIngModel.InsertRecipeIngredient(recIngItem);

            }

            if (flImage.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(flImage.FileName);
                    flImage.SaveAs(Server.MapPath("~/") + filename);
                    StatusLabel.Text = "Upload status: File uploaded!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }







    private Control FindControlRecursive(Control rootControl, string controlID)
    {
        if (rootControl.ID == controlID) return rootControl;

        foreach (Control controlToSearch in rootControl.Controls)
        {
            Control controlToReturn = FindControlRecursive(controlToSearch, controlID);
            if (controlToReturn != null) return controlToReturn;
        }
        return null;
    }

    protected void btnDark_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Dark";
        Response.Redirect("~/pages/AddRecipe.aspx");
    }

    protected void btnLight_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Light";
        Response.Redirect("~/pages/AddRecipe.aspx");
    }

    protected void btnDefault_Click(object sender, EventArgs e)
    {
        Session["theme"] = null;
        Response.Redirect("~/pages/AddRecipe.aspx");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= 15; i++)
        {
            Panel a = (Panel)FindControlRecursive(Page, String.Format("ingredientAmount{0}", i));
            a.Visible = false;
        }
        int x = 0;
        int.TryParse(numberIngredients.SelectedValue, out x);
        for (int i = 1; i <= x; i++)
        {
            Panel a = (Panel)FindControlRecursive(Page, String.Format("ingredientAmount{0}", i));
            if (a != null)
                a.Visible = true;
        }
    }
}