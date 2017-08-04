using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        GetRecipes();
    }

    private void GetRecipes()
    {
        string submitted_by = SubmittedBy.SelectedValue;
        string category = Category.SelectedValue;
        string name_ingredient = Ingredient.SelectedValue;
        RecipeGridView.DataSource = GetRecipesSubmittedBy_Category_Ingredient(submitted_by, category, name_ingredient);
        RecipeGridView.DataBind();
    }

    List<recipe> GetRecipesSubmittedBy_Category_Ingredient(string submittedby, string category, string ingredient)
    {
        IngredientModel inModel = new IngredientModel();
        RecipeIngredientModel reInModel = new RecipeIngredientModel();
        RecipeModel reModel = new RecipeModel();
        using (COMP229S17S2Entities dbConnection = new COMP229S17S2Entities())
        {
            if (submittedby == "All")
            {
                if (category == "All")
                {
                    if (ingredient == "All")
                    {
                        try
                        {
                            List<recipe> result = (from x in dbConnection.recipes
                                                   select x).ToList();
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }
                    }
                    else
                    {
                        try
                        {
                            List<int> RecipeID = reInModel.GetRecipeIDByIngredient(ingredient);
                            List<recipe> result = new List<recipe>();
                            for (int i = 0; i < RecipeID.Count; i++)
                            {
                                int b = RecipeID[i];
                                List<recipe> a = (from x in dbConnection.recipes
                                                  where x.ID == b
                                                  select x).ToList();
                                result.Add(a[0]);
                            }
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }
                    }
                }
                else
                {
                    if (ingredient == "All")
                    {
                        try
                        {
                            List<recipe> result = (from x in dbConnection.recipes
                                                   where x.Category == category
                                                   select x).ToList();
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }
                    }
                    else
                    {
                        try
                        {
                            List<int> RecipeID = reInModel.GetRecipeIDByIngredient(ingredient);
                            List<recipe> result = new List<recipe>();
                            for (int i = 0; i < RecipeID.Count; i++)
                            {
                                int b = RecipeID[i];
                                List<recipe> a = (from x in dbConnection.recipes
                                                  where x.ID == b
                                                  select x).ToList();
                                foreach (recipe x in a)
                                {
                                    if (x.Category == category)
                                    {
                                        result.Add(a[0]);
                                    }
                                }
                            }
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }

                    }
                }
            }
            else
            {
                if (category == "All")
                {
                    if (ingredient == "All")
                    {
                        try
                        {
                            List<recipe> result = (from x in dbConnection.recipes
                                                   where x.SubmittedBy == submittedby
                                                   select x).ToList();
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }
                    }
                    else
                    {
                        try
                        {
                            List<int> RecipeID = reInModel.GetRecipeIDByIngredient(ingredient);
                            List<recipe> result = new List<recipe>();
                            for (int i = 0; i < RecipeID.Count; i++)
                            {
                                int b = RecipeID[i];
                                List<recipe> a = (from x in dbConnection.recipes
                                                  where x.ID == b
                                                  select x).ToList();
                                foreach (recipe x in a)
                                {
                                    if (x.SubmittedBy == submittedby)
                                    {
                                        result.Add(a[0]);
                                    }
                                }
                            }
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }

                    }
                }
                else
                {
                    if (ingredient == "All")
                    {
                        try
                        {
                            List<recipe> result = (from x in dbConnection.recipes
                                                   where x.Category == category && x.SubmittedBy == submittedby
                                                   select x).ToList();
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }
                    }
                    else
                    {
                        try
                        {
                            List<int> RecipeID = reInModel.GetRecipeIDByIngredient(ingredient);
                            List<recipe> result = new List<recipe>();
                            for (int i = 0; i < RecipeID.Count; i++)
                            {
                                int b = RecipeID[i];
                                List<recipe> a = (from x in dbConnection.recipes
                                                  where x.ID == b
                                                  select x).ToList();
                                foreach (recipe x in a)
                                {
                                    if (x.SubmittedBy == submittedby && x.Category == category)
                                    {
                                        result.Add(a[0]);
                                    }
                                }
                            }
                            return result;
                        }
                        catch (Exception ex)
                        {
                            return new List<recipe>();
                        }

                    }
                }
            }

        }


    }


    protected void RecipesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int selectedRow = e.RowIndex;

        int ID = Convert.ToInt32(RecipeGridView.DataKeys[selectedRow].Values["ID"]);

        Response.Cookies["RecipeID"].Value = Convert.ToString(ID);
        Response.Redirect("~/pages/RecipeDetail.aspx");

    }

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
        Response.Redirect("~/pages/Search.aspx");
    }

    protected void btnLight_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Light";
        Response.Redirect("~/pages/Search.aspx");
    }

    protected void btnDefault_Click(object sender, EventArgs e)
    {
        Session["theme"] = null;
        Response.Redirect("~pages/Search.aspx");
    }
}