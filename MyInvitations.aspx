<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyInvitations.aspx.cs" Inherits="BabyCareProject.MyInvitations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Invitations</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />

    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />

    <link rel="stylesheet" href="css/style.css" />
    <script src="index1.js"></script>
    <link rel="stylesheet" href="css/style1.css" />
</head>

<body>
    <form id="myInvitations" runat="server">
        <div>

            <table>
                <tr>
                    <td colspan=" 4" align="center">
                        <h3>My invitations</h3>
                    </td>
                </tr>

                <tr>
                    <td style="color: darkblue">User ID</td>
                    <td>

                        <asp:TextBox ID="userID" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td style="color: darkblue">Password</td>
                    <td>

                        <asp:TextBox ID="password" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td colspan=" 4" align="center">
                        <asp:Button ID="Button1" runat="server" Style="color: darkblue" OnClick="Button1_Click" ForeColor="#6699FF" BorderColor="#000099" Text="Show invitations" />
                    </td>
                </tr>
            </table>
            <h4>Waiting for your approval:</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InvitationNumber" DataSourceID="SqlDataSource1" Visible="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                <Columns>



                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="ActualDate" HeaderText="ActualDate" SortExpression="ActualDate" />
                    <asp:BoundField DataField="InvitationDate" HeaderText="InvitationDate" SortExpression="InvitationDate" />
                    <asp:BoundField DataField="StartingTime" HeaderText="StartingTime" SortExpression="StartingTime" />
                    <asp:BoundField DataField="EndingTime" HeaderText="EndingTime" SortExpression="EndingTime" />
                    <asp:BoundField DataField="parentUserName" HeaderText="parentUserName" SortExpression="parentUserName" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="InvitationNumber" HeaderText="InvitationNumber" InsertVisible="False" ReadOnly="True" SortExpression="InvitationNumber" />
                    <%-- ask shaked why doesn't it work: --%>
            <%--        <asp:TemplateField HeaderText="Approve">
                        <ItemTemplate>
                            <asp:CheckBox ID="ProductSelector" runat="server" />
                            <asp:CheckBox ID="CheckBox1" runat="server" />


                        </ItemTemplate>
                    </asp:TemplateField>--%>
                   
                    <asp:TemplateField>
                          <ItemTemplate>
                            <asp:Button ID="AddButton" runat="server" 
                              CommandName="approve" 
                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                              Text="click to approve" />
                          </ItemTemplate> 
                        </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT * FROM [Invitation] WHERE (([UserName] = @UserName) AND ([Status] = @Status)) ORDER BY [StartingTime]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="userID" Name="UserName" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="waiting for babysitter's approval" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


            <h4>Approved invitations:</h4>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="InvitationNumber" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="ActualDate" HeaderText="ActualDate" SortExpression="ActualDate" />
                    <asp:BoundField DataField="InvitationDate" HeaderText="InvitationDate" SortExpression="InvitationDate" />
                    <asp:BoundField DataField="StartingTime" HeaderText="StartingTime" SortExpression="StartingTime" />
                    <asp:BoundField DataField="EndingTime" HeaderText="EndingTime" SortExpression="EndingTime" />
                    <asp:BoundField DataField="parentUserName" HeaderText="parentUserName" SortExpression="parentUserName" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="InvitationNumber" HeaderText="InvitationNumber" InsertVisible="False" ReadOnly="True" SortExpression="InvitationNumber" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BabySitterConnectionString %>" SelectCommand="SELECT Invitation.Status, Invitation.UserName, Invitation.ActualDate, Invitation.InvitationDate, Invitation.StartingTime, Invitation.EndingTime, Invitation.parentUserName, Invitation.price, Invitation.InvitationNumber FROM Invitation  WHERE (Invitation.Status = @Status) AND (Invitation.UserName = @UserName) ">
                <SelectParameters>
                    <asp:Parameter DefaultValue="approved" Name="Status" Type="String" />
                    <asp:ControlParameter ControlID="userID" DefaultValue="" Name="UserName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
