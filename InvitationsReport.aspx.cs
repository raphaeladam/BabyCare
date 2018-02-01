using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BabyCareProject
{
    public partial class InvitationsReport : System.Web.UI.Page
    {
        BSDataContext dc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dc = Connection.GetDataContextInstance();
            if (!IsPostBack)
            {
                //default:
                this.from_textbox.Text = "2017-01-01 00:00 ";
                this.to_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm");
            }
        }


        
      

            


            protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.from_textbox.Text == "" || this.to_textbox.Text == "") {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Please enter date');", true);
                return;
            }
            try
            {
                DateTime fromDT = DateTime.Parse(this.from_textbox.Text);
                DateTime toDT = DateTime.Parse(this.to_textbox.Text);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Invalid date. The form should be yyyy-MM-dd hh:mm');", true);
                return;
            }

            this.GridView1.Visible = true;
            return;
        }
    }
}