<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchBabySitter.aspx.cs" Inherits="BabyCareProject.SearchBabySitter" %>


<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>search for a babysitter</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>

      <link rel="stylesheet" href="css/style.css"/>
    <script src="index1.js"></script>
    <link rel="stylesheet" href="css/style1.css"/>
</head>
<body>
    <form id="SearchBabySitter" runat="server">
        <div>
            <table>
                
                <tr>
                    <asp:CheckBox ID="CheckBox2" runat="server" /><td colspan =" 4" align="center">
                        <h4> Find the best Babysitter for your child:</h4>
                    </td>
                </tr>
                <tr>
                    <td style="color:darkblue">
                     
                        From</td>
                    <td>

                        <asp:TextBox ID="from_textbox" runat="server" ></asp:TextBox>

                    </td>
                
                    <td style="color:darkblue">
                       
                        To</td>
                    <td>
                        <asp:TextBox ID="to_textbox" runat="server"></asp:TextBox>
                       </td>
                </tr>
                <tr>
                    <td style="color:darkblue">
                        <asp:Label ID="Label1" runat="server" Text="City"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [Babysitters] ORDER BY [city]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:DropDownList ID="city_DropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="City">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT DISTINCT [City] FROM [BabySitter]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                     <td style="color:darkblue">
                        <asp:Label ID="Label2" runat="server" Text="Price per hour"></asp:Label>
                        : less than</td>
                    <td>
                        <asp:TextBox ID="price_TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label3" style="color:darkblue" runat="server" Text="NIS"></asp:Label>
                  
                      
                     </td>
                </tr>
                <tr>
                    <td colspan =" 4" align="center">
                            <asp:Button ID="Button1" runat="server" style="color:darkblue" OnClick="Button1_Click"  ForeColor="#6699FF" BorderColor="#000099" Text="Search" />
                    </td>
                </tr>
            </table>
       
  
        <asp:ListView ID="ListView1" runat="server" 
            DataSourceID="SqlDataSource3"  Visible="False" DataKeyNames="InvitationNumber,UserName" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <tr style="">
<%--         how to add check boxes?????
  --%>
            
                    <td>
                        <asp:Label ID="InvitationNumberLabel" runat="server" Text='<%# Eval("InvitationNumber") %>' />
                    </td>


                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActualDateLabel" runat="server" Text='<%# Eval("ActualDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StartingTimeLabel" runat="server" Text='<%# Eval("StartingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EndingTimeLabel" runat="server" Text='<%# Eval("EndingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                      <td>
                      <asp:CheckBox ID="CheckBox2" runat="server" Width="50px" Text="choose" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="InvitationNumberLabel1" runat="server" Text='<%# Eval("InvitationNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel1" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ActualDateTextBox" runat="server" Text='<%# Bind("ActualDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StartingTimeTextBox" runat="server" Text='<%# Bind("StartingTime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EndingTimeTextBox" runat="server" Text='<%# Bind("EndingTime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                    <td>
                      <asp:CheckBox ID="CheckBox2" runat="server" Width="50px" Text="choose" />
                    </td>

                <%--    2018-12-12 07:32 --%>
                    
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="InvitationNumberTextBox" runat="server" Text='<%# Bind("InvitationNumber") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ActualDateTextBox" runat="server" Text='<%# Bind("ActualDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="StartingTimeTextBox" runat="server" Text='<%# Bind("StartingTime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EndingTimeTextBox" runat="server" Text='<%# Bind("EndingTime") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                    <td>
                      <asp:CheckBox ID="CheckBox2" runat="server" Width="50px" Text="choose" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="InvitationNumberLabel" runat="server" Text='<%# Eval("InvitationNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActualDateLabel" runat="server" Text='<%# Eval("ActualDate") %>' />
                    </td>
                    
                    <td>
                        <asp:Label ID="StartingTimeLabel" runat="server" Text='<%# Eval("StartingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EndingTimeLabel" runat="server" Text='<%# Eval("EndingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                    <td>
                      <asp:CheckBox ID="CheckBox2" runat="server" Width="50px" Text="choose"  />
                    </td>
                   
                </tr>
            </ItemTemplate>

            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">InvitationNumber</th>
                                    <th runat="server">Status</th>
                                    <th runat="server">UserName</th>
                                    <th runat="server">LastName</th>
                                    <th runat="server">ActualDate</th>
                                    <th runat="server">StartingTime</th>
                                    <th runat="server">EndingTime</th>
                                    <th runat="server">price</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="InvitationNumberLabel" runat="server" Text='<%# Eval("InvitationNumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ActualDateLabel" runat="server" Text='<%# Eval("ActualDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StartingTimeLabel" runat="server" Text='<%# Eval("StartingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EndingTimeLabel" runat="server" Text='<%# Eval("EndingTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                     
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>



            <asp:Button ID="inviteBabysitter_btn" runat="server" OnClick="Button2_Click" Text="Invite Babysitter" onclientclick="return confirm('Are you sure you want to save selected records?');" />



        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT bsi.InvitationNumber, bsi.Status, bs.UserName, bs.LastName, bsi.ActualDate, bsi.StartingTime, bsi.EndingTime, bsi.price FROM BabySitterInvitation AS bsi INNER JOIN BabySitter AS bs ON bsi.UserName = bs.UserName WHERE (bsi.StartingTime &lt;= @from ) AND (bsi.EndingTime &gt;= @to ) AND (bsi.price &lt;= @price_txt) AND (bs.City LIKE @city)">
            <SelectParameters>
                <asp:ControlParameter ControlID="from_textbox" DefaultValue="DateTime.Now()" Name="from" PropertyName="Text" />
                <asp:ControlParameter ControlID="to_textbox" DefaultValue="DateTime.Now()" Name="to" PropertyName="Text" />
                <asp:ControlParameter ControlID="price_TextBox1" DefaultValue="9999" Name="price_txt" PropertyName="Text" />
                <asp:ControlParameter ControlID="city_DropDownList" DefaultValue="" Name="city" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>



            <asp:Label ID="bdika" runat="server" Text="Label"></asp:Label>
    
         </div>
         </form>
</body>
</html>


      

  
