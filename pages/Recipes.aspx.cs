using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recipies : System.Web.UI.Page
{
    StringBuilder table = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetRecipes();
        }
    }

    private void GetRecipes()
    {
        COMP229S17S2Entities dbconnection = new COMP229S17S2Entities();
        var recipes = (from allRecipes in dbconnection.recipes select allRecipes);

        RecipesGridView.DataSource = recipes.ToList();
        RecipesGridView.DataBind();
    }

    protected void RecipesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int selectedRow = e.RowIndex;

        int ID = Convert.ToInt32(RecipesGridView.DataKeys[selectedRow].Values["ID"]);

        Response.Cookies["RecipeID"].Value = Convert.ToString(ID);
        Response.Redirect("~/pages/RecipeDetail.aspx");
    }

    protected void RecipesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow gvRow = RecipesGridView.Rows[index];
        Response.Cookies["RecipeID"].Value = Convert.ToString(ID);
        Response.Redirect("~/pages/RecipeDetail.aspx");
    }

    // Page Pre-Initialize to load theme
    protected void Page_PreInit(object sender, EventArgs e)
    {
        string theme = (string)Session["theme"];
        if (theme != null)
        {
            Page.Theme = theme;
        }
    }


    protected void btnDark_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Dark";
        Response.Redirect("~/pages/Recipes.aspx");
    }

    protected void btnLight_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Light";
        Response.Redirect("~/pages/Recipes.aspx");
    }

    protected void btnDefault_Click(object sender, EventArgs e)
    {
        Session["theme"] = null;
        Response.Redirect("~/pages/Recipes.aspx");
    }


}