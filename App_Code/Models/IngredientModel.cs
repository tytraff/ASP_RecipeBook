using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for IngredientModel
/// </summary>
public class IngredientModel
{
    public IngredientModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string InsertIngredient(ingredient item)
    {
        try
        {
            //Create database connection
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //Add item of ingredients to database
            dbConnection.ingredients.Add(item);
            dbConnection.SaveChanges();
            return "Item " + item.Name + " was saved";
        }
        catch (Exception e)
        {
            return e.ToString();
        }
    }

    public string getIngredientByName(string name)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            //instead of an sql query we are building a LINQ query
            List<string> nameOfIngre = (from x in dbConnection.recipes where x.Name == name select x.Name).ToList();
            return nameOfIngre[0];
        }
        catch (Exception e)
        {
            return "";
        }
    }
    public string getIngredientByID(int ID)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<string> item = (from x in dbConnection.ingredients where x.ID == ID select x.Name).ToList();
            return item[0];
        }
        catch (Exception e)
        {
            return "";
        }
    }
    public int getIngredientIDByName(string Name)
    {
        try
        {
            COMP229S17S2Entities dbConnection = new COMP229S17S2Entities();
            List<int> item = (from x in dbConnection.ingredients where x.Name == Name select x.ID).ToList();
            return item[0];
        }
        catch (Exception e)
        {
            return -1;
        }
    }

}