using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BabyCareProject
{
    public partial class MyInvitations : System.Web.UI.Page
    {
        BSDataContext dc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dc = Connection.GetDataContextInstance();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.GridView1.Visible = true;
            
        }
        protected void approve_click(object sender, EventArgs e)
        {
           

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           

            if (e.CommandName == "approve")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
                GridViewRow row = GridView1.Rows[index];

                // Add code here to add the item to the shopping cart.
                Invitation inv = (from i in dc.Invitations
                                  where i.InvitationNumber == int.Parse(row.Cells[8].Text) //((Label)row.FindControl("UserName")).Text
                                  select i).FirstOrDefault(); // בוחר את כל הנתונים של המשתמש
              

                try
                {
                    inv.Status = "approved";
                    dc.SubmitChanges();
                    GridView2.DataBind();
                    GridView1.DataBind();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Invitation approved');", true);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Something went wrong');", true);
                }
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}