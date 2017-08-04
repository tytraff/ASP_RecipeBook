using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RecipeModel
/// </summary>
public class RecipeModel
{
    public RecipeModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string InsertRecipe(recipe item)
    {
        try
        {
            //Create database connection
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //Add item of ingredients to database
            dbConnection.recipes.Add(item);
            dbConnection.SaveChanges();
            return "Item " + item.ToString() + " was saved";
        }
        catch (Exception e)
        {
            return e.ToString();
        }
    }
    public List<recipe> GetRecipesSubmittedBy(string submittedBy)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //instead of an sql query we are building a LINQ query
            List<recipe> result = (from x in dbConnection.recipes where x.SubmittedBy == submittedBy select x).ToList();
            return result;
        }
        catch (Exception e)
        {
            return new List<recipe>();
        }
    }

    public List<recipe> GetRecipeByRecipeName(string name)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //instead of an sql query we are building a LINQ query
            List<recipe> result = (from x in dbConnection.recipes where x.Name == name select x).ToList();
            return result;
        }
        catch (Exception e)
        {
            return new List<recipe>();
        }
    }
    public int GetRecipeIDByName(string name)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> ID = (from x in dbConnection.recipes where x.Name == name select x.ID).ToList();
            return ID[0];
        }
        catch (Exception e)
        {
            return -1;
        }

    }

    public recipe GetRecipeByRecipeID(int ID)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //instead of an sql query we are building a LINQ query
            List<recipe> result = (from x in dbConnection.recipes where x.ID == ID select x).ToList();
            return result[0];
        }
        catch (Exception e)
        {
            return new recipe();
        }
    }

    public override string ToString()
    {
        recipe item = new recipe();
        return string.Format("{0} {1} {2} {3} {4}", item.Name, item.SubmittedBy, item.Description, item.PrepTime, item.Servings);
    }
}