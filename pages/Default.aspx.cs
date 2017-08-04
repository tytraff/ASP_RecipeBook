using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        Response.Redirect("~/pages/Default.aspx");
    }

    protected void btnLight_Click(object sender, EventArgs e)
    {
        Session["theme"] = "Light";
        Response.Redirect("~/pages/Default.aspx");
    }

    protected void btnDefault_Click(object sender, EventArgs e)
    {
        Session["theme"] = null;
        Response.Redirect("~/pages/Default.aspx");
    }
}