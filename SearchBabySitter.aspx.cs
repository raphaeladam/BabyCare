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
 //       ListViewItem lastItem = null;
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

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //let only one check item!!!! - add code! doesn't work:
            //if (e.NewValue == CheckState.Checked)
            //    for (int ix = 0; ix < checkedListBox1.Items.Count; ++ix)
            //        if (e.Index != ix) checkedListBox1.SetItemChecked(ix, false);
            
           

        }

        protected void Button2_Click(object sender, EventArgs e)

        {

            int count = 0;
            foreach (ListViewItem itm in ListView1.Items)
            {
                CheckBox cb = (CheckBox)itm.FindControl("CheckBox2");
                if (cb.Checked)
                    count++;
                if (count > 1)
                {


               //     ((CheckBox)itm.FindControl("CheckBox2")).Checked = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('You can choose only one babysitter');", true);
                
                    return;
                }
            }

            foreach (ListViewItem itm in ListView1.Items)
            {
                CheckBox cb = (CheckBox)itm.FindControl("CheckBox2");
                if (cb.Checked)
                {
          
                  
                    Label c = (Label)itm.FindControl("UserNameLabel");
                    this.bdika.Text = c.Text;
                    try
                    {
                        DateTime fromDT = DateTime.Parse(this.from_textbox.Text);
                        DateTime toDT = DateTime.Parse(this.to_textbox.Text);


                        //creating a new invitation. we can add an approve of the castumer before doing it
                        Invitation ans = new Invitation();
                        ans.UserName = ((Label)itm.FindControl("UserNameLabel")).Text;
                        ans.price = int.Parse(((Label)itm.FindControl("priceLabel")).Text);
                        ans.Status = "waiting for babysitter's approval";
                        ans.ActualDate = DateTime.Now;
                        ans.StartingTime = fromDT;
                        ans.EndingTime = toDT;
                        ans.InvitationDate = DateTime.Now;
                        ans.parentUserName = "Miki"; // change!!!!! get the userName from Raphael!!!!

                        
                        //      ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Are you sure?');", true);
                        dc.Invitations.InsertOnSubmit(ans);
                        dc.SubmitChanges();


                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('The invitation has been sent to the babysitter');", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Invalid date');", true);
                        return;
                    }
                   
                   
                
                }
            }
        }
           

        












        
    }
}