﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class ingredient
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public ingredient()
    {
        this.recipeingredients = new HashSet<recipeingredient>();
    }

    public int ID { get; set; }
    public string Name { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<recipeingredient> recipeingredients { get; set; }
}

public partial class recipe
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public recipe()
    {
        this.recipeingredients = new HashSet<recipeingredient>();
    }

    public int ID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public string SubmittedBy { get; set; }
    public int PrepTime { get; set; }
    public int Servings { get; set; }
    public string Category { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<recipeingredient> recipeingredients { get; set; }
}

public partial class recipeingredient
{
    public int ID { get; set; }
    public int Recipe { get; set; }
    public int Ingredient { get; set; }
    public int Quantity { get; set; }
    public string UM { get; set; }

    public virtual ingredient ingredient1 { get; set; }
    public virtual recipe recipe1 { get; set; }
}
