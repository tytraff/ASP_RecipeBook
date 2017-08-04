using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RecipeIngredientModel
/// </summary>
public class RecipeIngredientModel
{
    public RecipeIngredientModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string InsertRecipeIngredient(recipeingredient item)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            dbConnection.recipeingredients.Add(item);
            Console.WriteLine("<p>" + item.ToString() + "</p>");
            dbConnection.SaveChanges();
            return "Item " + item.Recipe + " was saved.";

        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
    // write a method that takes a recipe id and returns a collection of
    // records which contain all igredients of the recipe
    List<int> getIngridientByRecipe(int RecipeNumber)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> ID = (from x in dbConnection.recipeingredients where x.Recipe == RecipeNumber select x.Ingredient).ToList();
            return ID;
        }
        catch (Exception e)
        {
            return new List<int>();
        }
    }

    public int GetIngredientIdByName(string name)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> ID = (from x in dbConnection.ingredients where x.Name == name select x.ID).ToList();
            return ID[0];
        }
        catch (Exception e)
        {
            return -1;
        }
    }

    public List<int> GetRecipeIDByIngredient(string name)
    {
        int ingridientID = GetIngredientIdByName(name);
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //instead of an sql query we are building a LINQ query
            List<int> result = (from x in dbConnection.recipeingredients where x.Ingredient == ingridientID select x.Recipe).ToList();
            return result;
        }
        catch (Exception e)
        {
            return new List<int>();
        }
    }
    public recipe GetRecipeByID(int ID)
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
    // write a method that takes an ingredient and returns a collection
    // of recipes that use that ingredient
    public List<recipeingredient> getIngredientDetailByRecipeID(int RecipeNumber)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<recipeingredient> ID = (from x in dbConnection.recipeingredients where x.Recipe == RecipeNumber select x).ToList();
            return ID;
        }
        catch (Exception e)
        {
            return new List<recipeingredient>();
        }
    }

    public List<int> getReInIDbyRecipe(int RecipeNumber)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> ID = (from x in dbConnection.recipeingredients where x.Recipe == RecipeNumber select x.ID).ToList();
            return ID;
        }
        catch (Exception e)
        {
            return new List<int>();
        }
    }

    public int CheckIngredient(int recipeID, int ingredientID)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> ID = (from x in dbConnection.recipeingredients where x.Ingredient == ingredientID & x.Recipe == recipeID select x.ID).ToList();
            return ID[0];
        }
        catch (Exception e)
        {
            return -1;
        }
    }
}