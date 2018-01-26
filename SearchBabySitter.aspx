<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchBabySitter.aspx.cs" Inherits="BabyCareProject.SearchBabySitter" %>


<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="SearchBabySitter" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan =" 4" align="center">
                        <h3 style="color:darksalmon"> Find the best Babysitter for your child:</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        From*</td>
                    <td>

                        <asp:TextBox ID="from_textbox" runat="server" ></asp:TextBox>

                    </td>
                
                    <td>
                       
                        To*</td>
                    <td>
                        <asp:TextBox ID="to_textbox" runat="server"></asp:TextBox>
                       </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="City"></asp:Label>
                        *<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [Babysitters] ORDER BY [city]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:DropDownList ID="city_DropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="City">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT DISTINCT [City] FROM [BabySitter]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Price per hour"></asp:Label>
                        : less than</td>
                    <td>
                        <asp:TextBox ID="price_TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="NIS"></asp:Label>
                    &nbsp;</td>
                </tr>
                <tr>
                    <td colspan =" 4" align="center">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                    </td>
                </tr>
            </table>
       
    // add db contact
        <asp:ListView ID="ListView1" runat="server" 
            DataSourceID="SqlDataSource3"  Visible="False" DataKeyNames="InvitationNumber">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
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
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
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
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
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
                </tr>
            </ItemTemplate>

            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">InvitationNumber</th>
                                     <th runat="server">Status</th>
                                    <th runat="server">UserName</th>
                                    <th runat="server">LastName</th>
                                    <th runat="server">ActualDate</th>
                                    <th runat="server">StartingTime</th>
                                    <th runat="server">EndingTime</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold;color: #333333;">
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
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>



        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT bsi.InvitationNumber, bsi.Status, bs.UserName, bs.LastName, bsi.ActualDate, bsi.StartingTime, bsi.EndingTime, bsi.price FROM BabySitterInvitation AS bsi INNER JOIN BabySitter AS bs ON bsi.UserName = bs.UserName WHERE (bsi.StartingTime &lt;= @from ) AND (bsi.EndingTime &gt;= @to ) AND (bsi.price &lt;= @price_txt) AND (bs.City LIKE @city)">
            <SelectParameters>
                <asp:ControlParameter ControlID="from_textbox" DefaultValue="DateTime.Now()" Name="from" PropertyName="Text" />
                <asp:ControlParameter ControlID="to_textbox" DefaultValue="DateTime.Now()" Name="to" PropertyName="Text" />
                <asp:ControlParameter ControlID="price_TextBox1" DefaultValue="9999" Name="price_txt" PropertyName="Text" />
                <asp:ControlParameter ControlID="city_DropDownList" DefaultValue="" Name="city" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>



        
    
         </div>
         </form>
</body>
</html>


      

  
