<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvitationsReport.aspx.cs" Inherits="BabyCareProject.InvitationsReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Invitations Report</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>

      <link rel="stylesheet" href="css/style.css"/>
    <link href="css/style1.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table>
                <tr>
                    <td colspan =" 4" align="center">
                        <h4> Show all invitations</h4>
                    </td>
                </tr>
                <tr>
                    <td style="color:darkblue">
                        From</td>
                    <td>

                        <asp:TextBox ID="from_textbox" runat="server" >01/01/2017</asp:TextBox>

                    </td>
                
                    <td style="color:darkblue">
                       
                        To</td>
                    <td>
                        <asp:TextBox ID="to_textbox" runat="server" ></asp:TextBox>
                       </td>
                </tr>
                
                <tr>
                    <td colspan =" 4" align="center">
                            <asp:Button ID="Button1" runat="server"  Text="Show invitations" style="color:darkblue" OnClick="Button1_Click"  ForeColor="#6699FF" BorderColor="#000099" />
                    </td>
                </tr>
            </table>

        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="InvitationNumber">
            <Columns>
                <asp:BoundField DataField="InvitationNumber" HeaderText="InvitationNumber" ReadOnly="True" SortExpression="InvitationNumber" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="ActualDate" HeaderText="ActualDate" SortExpression="ActualDate" />
                <asp:BoundField DataField="InvitationDate" HeaderText="InvitationDate" SortExpression="InvitationDate" />
                <asp:BoundField DataField="StartingTime" HeaderText="StartingTime" SortExpression="StartingTime" />
                <asp:BoundField DataField="EndingTime" HeaderText="EndingTime" SortExpression="EndingTime" />
                <asp:BoundField DataField="parentUserName" HeaderText="parentUserName" SortExpression="parentUserName" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="BS_Name" HeaderText="BS_Name" ReadOnly="True" SortExpression="BS_Name" />
                <asp:BoundField DataField="Parent_Name" HeaderText="Parent_Name" ReadOnly="True" SortExpression="Parent_Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT DISTINCT i.InvitationNumber, i.Status, i.UserName, i.ActualDate, i.InvitationDate, i.StartingTime, i.EndingTime, i.parentUserName, i.price, bs.UserName + ' ' + bs.LastName AS BS_Name, p.FirstName + ' ' + p.LastName AS Parent_Name FROM Invitation AS i INNER JOIN BabySitter AS bs ON i.UserName = bs.UserName INNER JOIN Parent AS p ON i.parentUserName = p.UserName WHERE (i.ActualDate &gt;= @FROM ) AND (i.ActualDate &lt;= @TO )">
            <SelectParameters>
                <asp:ControlParameter ControlID="from_textbox" Name="FROM" PropertyName="Text" />
                <asp:ControlParameter ControlID="to_textbox" Name="TO" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
