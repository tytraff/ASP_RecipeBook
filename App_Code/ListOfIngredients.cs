using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ListOfIngredients
/// </summary>
public class ListOfIngredients
{
    public string Name { get; set; }
    public int Quantity { get; set; }
    public string Unit { get; set; }

    public ListOfIngredients(string name, int quantity, string unit)
    {
        Name = name;
        Quantity = quantity;
        Unit = unit;
    }

}