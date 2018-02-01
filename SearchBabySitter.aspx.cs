using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BabyCareProject
{
    public partial class SearchBabySitter : System.Web.UI.Page
    {
        BSDataContext dc;
        protected void Page_Load(object sender, EventArgs e)
        {

            dc = Connection.GetDataContextInstance();
            if (!IsPostBack)
            {
                // change the default view date 
                //  this.from_textbox.Text = (DateTime.Today.ToLongTimeString());
                //  this.to_textbox.Text = (DateTime.Today.ToShortDateString()) + " 0:00:00";

                this.from_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm ");
                this.to_textbox.Text = DateTime.Now.ToString("yyyy-MM-dd hh:mm");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fromDT = DateTime.Parse(this.from_textbox.Text);
                DateTime toDT = DateTime.Parse(this.to_textbox.Text);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Invalid date');", true);
                return;
            }

            if (this.city_DropDownList.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Please choose a city');", true);
                return;
            }
                if (DateTime.Parse(this.from_textbox.Text) > (DateTime.Parse(this.to_textbox.Text)))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Choose valid time');", true);
                return; //add error window! and also check first if it looks like date
            }
            //add var = select ... to check all the babysitters' availabilities that fee to the parameters in the form 
            //    if this.price_TextBox1 != null than cjeck b.price <= this.price...
            //var babysitterAvailability = from ba in dc.BabySitterAvailabilities
            //                             where (ba.startTime <= DateTime.Parse(this.from_textbox.Text)) &&
            //                             (ba.endTime >= DateTime.Parse(this.to_textbox.Text))
            //                             select ba;
            ////add check valid above of ID
            //if (babysitterAvailability == null)

            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('There no babysitters that available');", true);
            //else
            //{



            //    //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Your availability was added successfully ');", true);
            //}
            //   ListViewItem lvi = new ListViewItem(babysitterAvailability);

            this.ListView1.Visible = true;


        }
    }
}