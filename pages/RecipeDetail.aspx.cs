using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["RecipeID"] != null)
            {
                string RecipeID = Server.HtmlEncode(Request.Cookies["RecipeID"].Value);
                RecipeModel item = new RecipeModel();
                recipe Recipes = new recipe();
                Recipes = item.GetRecipeByRecipeID(Convert.ToInt32(RecipeID));
                //lblData.Text += string.Format("Recipe Name:{0}</br>Description: {1}</br>Submitted By: {2}</br>Category: {3}</br>Cooking time(mins): {4}</br>Number of serving: {5} </br>", 
                //    Recipes.Name, Recipes.Description, Recipes.SubmitedBy,Recipes.Category, Recipes.CookingTime, Recipes.Serving);
                txtName.Text = Recipes.Name;
                txtDescription.Text = Recipes.Description;
                lblSubmitedBy.Text = Recipes.SubmittedBy;
                DropDownList1.SelectedValue = Recipes.Category;
                txtTime.Text = Recipes.PrepTime.ToString();
                txtNumOfServing.Text = Recipes.Servings.ToString();
                IngredientModel item2 = new IngredientModel();
                RecipeIngredientModel item1 = new RecipeIngredientModel();
                List<recipeingredient> combine = new List<recipeingredient>();
                combine = item1.getIngredientDetailByRecipeID(Convert.ToInt32(RecipeID));
                int i = 1;
                grd.DataSource = GetTableWithInitialData(item1, item2, RecipeID); // get first initial data
                grd.DataBind();
                //foreach(var x in combine)
                //{
                //    lblData1.Text += string.Format("{3}. {0} {1} {2}</br>", item2.getIngredientByID(x.Ingredient), x.quantity, x.UnitOfMeasure, i);
                //    i++;
                //}
            }
        }
    }

    /// <summary>
    ///  Ilir Method
    /// </summary>
    /// 
    public DataTable GetTableWithInitialData(RecipeIngredientModel item1, IngredientModel item2, string RecipeID) // this might be your sp for select
    {
        DataTable table = new DataTable();
        table.Columns.Add("Ingredient", typeof(string));
        table.Columns.Add("Unit", typeof(string));
        table.Columns.Add("Quantity", typeof(string));
        List<recipeingredient> combine = new List<recipeingredient>();
        combine = item1.getIngredientDetailByRecipeID(Convert.ToInt32(RecipeID));
        foreach (var x in combine)
        {
            // lblData1.Text += string.Format("<strong>Name: {0}</strong> </br> Quantity: {1} </br> Unit of Measure: {2}</br></br>", item2.getIngredientByID(x.Ingredient), x.Quantity, x.UM);
            table.Rows.Add(item2.getIngredientByID(x.Ingredient), x.UM, x.Quantity.ToString());
        }
        //table.Rows.Add("Carrot", "KG", "1.5");

        return table;
    }

    protected void btnAddRow_Click(object sender, EventArgs e)
    {
        DataTable dt = GetTableWithNoData(); // get select column header only records not required
        DataRow dr;

        foreach (GridViewRow gvr in grd.Rows)
        {
            dr = dt.NewRow();

            TextBox txtIngredient = gvr.FindControl("txtIngredient") as TextBox;
            TextBox txtUnit = gvr.FindControl("txtUnit") as TextBox;
            TextBox txtQuantity = gvr.FindControl("txtQuantity") as TextBox;
            // if (Array.IndexOf(myIngredients, txtIngredient.Text) > -1)
            {
                dr[0] = txtIngredient.Text;
                dr[1] = txtUnit.Text;
                dr[2] = txtQuantity.Text;

                dt.Rows.Add(dr); // add grid values in to row and add row to the blank table
            }
        }

        dr = dt.NewRow(); // add last empty row
        dt.Rows.Add(dr);

        grd.DataSource = dt; // bind new datatable to grid
        grd.DataBind();
    }

    public DataTable GetTableWithNoData() // returns only structure if the select columns
    {
        DataTable table = new DataTable();
        table.Columns.Add("Ingredient", typeof(string));
        table.Columns.Add("Unit", typeof(string));
        table.Columns.Add("Quantity", typeof(string));
        return table;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["RecipeID"] != null)
        {
            int RecipeID = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["RecipeID"].Value));
            using (COMP229S17S2Entities dbConnection = new COMP229S17S2Entities())
            {
                /*
                recipe deletedRecipe = (from recipeRecords in dbConnection.recipes
                                        where recipeRecords.ID == RecipeID
                                        select recipeRecords).FirstOrDefault();

                dbConnection.recipes.Remove(deletedRecipe);
                dbConnection.SaveChanges();
                Response.Redirect("~/pages/Recipes.aspx");
                */

                RecipeIngredientModel a = new RecipeIngredientModel();
                List<int> b = a.getReInIDbyRecipe(RecipeID);
                for (int i = 0; i < b.Count; i++)
                {
                    int c = b[i];
                    recipeingredient combine = (from mix in dbConnection.recipeingredients
                                                where mix.ID == c
                                                select mix).FirstOrDefault();
                    dbConnection.recipeingredients.Remove(combine);
                    dbConnection.SaveChanges();
                }
                recipe deletedRecipe = (from recipeRecords in dbConnection.recipes
                                        where recipeRecords.ID == RecipeID
                                        select recipeRecords).FirstOrDefault();

                dbConnection.recipes.Remove(deletedRecipe);
                dbConnection.SaveChanges();
                Response.Redirect("Recipes.aspx");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int RecipeID = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["RecipeID"].Value));
        if (txtCategory.Visible == false)
        {
            string query = "UPDATE Recipe SET Name='" + txtName.Text + "',Category='" + DropDownList1.SelectedValue.ToString() +
                "',Description='" + txtDescription.Text + "',PrepTime=" + Convert.ToInt32(txtTime.Text) + ",Servings = " + Convert.ToInt32(this.txtNumOfServing.Text) + " WHERE ID =" + RecipeID + ";";

            using (SqlConnection db = new SqlConnection("Data Source=DESKTOP-FOJ2HKK;Initial Catalog=COMP229S17S2;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"))
            {
                SqlCommand command = new SqlCommand(query, db);
                db.Open();
                SqlDataReader reader = command.ExecuteReader();
            }
        }
        else
        {
            string query = "UPDATE Recipe SET Name='" + txtName.Text + "',Category='" + txtCategory.Text +
                "',Description='" + txtDescription.Text + "',PrepTime=" + Convert.ToInt32(txtTime.Text) + ",Servings = " + Convert.ToInt32(this.txtNumOfServing.Text) + " WHERE ID =" + RecipeID + ";";

            using (SqlConnection db = new SqlConnection("Data Source=DESKTOP-FOJ2HKK;Initial Catalog=COMP229S17S2;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"))
            {
                SqlCommand command = new SqlCommand(query, db);
                db.Open();
                SqlDataReader reader = command.ExecuteReader();
            }
        }
        using (COMP229S17S2Entities db = new COMP229S17S2Entities())
        {
            List<ListOfIngredients> ingredientList = new List<ListOfIngredients>();
            foreach (GridViewRow row in grd.Rows)
            {

                TextBox ingNameTB = (TextBox)row.FindControl("txtIngredient");
                string ingName = ingNameTB.Text;


                TextBox unitTB = (TextBox)row.FindControl("txtUnit");
                string ingUnit = unitTB.Text;

                TextBox quantityTB = (TextBox)row.FindControl("txtQuantity");
                int ingQuantity = Convert.ToInt32(quantityTB.Text);

                ingredientList.Add(new ListOfIngredients(ingName, ingQuantity, ingUnit));
            }
            db.SaveChanges();

            foreach (ListOfIngredients item in ingredientList)
            {
                recipeingredient newRepIng = new recipeingredient();
                IngredientModel ingModel = new IngredientModel();
                RecipeIngredientModel ReInModel = new RecipeIngredientModel();
                RecipeModel recipeModel = new RecipeModel();
                ingredient newIngredient = new ingredient();
                if (ReInModel.CheckIngredient(RecipeID, ingModel.getIngredientIDByName(item.Name)) < 0)
                {
                    if (ingModel.getIngredientIDByName(item.Name) < 0)
                    {
                        newIngredient.Name = item.Name;
                        ingModel.InsertIngredient(newIngredient);
                    }
                    newRepIng.Ingredient = ingModel.getIngredientIDByName(item.Name);
                    newRepIng.Recipe = RecipeID;
                    newRepIng.Quantity = item.Quantity;
                    newRepIng.UM = item.Unit;

                    ReInModel.InsertRecipeIngredient(newRepIng);
                }
                else
                {
                    string query1 = "UPDATE recipeingredients SET UM='" + item.Unit + "',Quantity="
                        + item.Quantity + "WHERE Recipe = " + RecipeID + "AND Ingredient = "
                        + ingModel.getIngredientIDByName(item.Name) + ";";
                    using (SqlConnection db1 = new SqlConnection("Data Source=DESKTOP-FOJ2HKK;Initial Catalog=COMP229S17S2;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"))
                    {
                        SqlCommand command = new SqlCommand(query1, db1);
                        db1.Open();
                        SqlDataReader reader = command.ExecuteReader();
                    }
                }
            }

            List<recipeingredient> freshest = (from recipeIngItems in db.recipeingredients
                                               where recipeIngItems.Recipe == RecipeID
                                               select recipeIngItems).ToList();
            List<int> recipeIngIdsToDelete = new List<int>();

            try
            {
                for (int i = 0; i < ingredientList.Count; i++)
                {
                    freshest[i].Quantity = ingredientList[i].Quantity;
                    freshest[i].UM = ingredientList[i].Unit;

                    if (freshest[i].Quantity == 0)
                    {
                        //recipeIngIdsToDelete.Add(freshest[i].id);
                        db.recipeingredients.Remove(freshest[i]);
                    }
                }
            }
            catch (Exception ed)
            {

            }
            db.SaveChanges();
            //Redirect bact to the updated recipes page
            Response.Redirect("Recipes.aspx");
        }

        Label1.Text = TextBox1.Text;

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "Other")
        {
            txtCategory.Visible = true;
        }
        else
        {
            txtCategory.Visible = false;
        }
    }
}
    