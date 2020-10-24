<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="results.aspx.cs" Inherits="systemNumberTest10.results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>            
            Password:<br />
            <asp:TextBox ID="tbPassword" runat="server"  TextMode="Password"/><br />            
            <asp:Button ID="get_results" runat="server" OnClick="get_results_Click1" Text="Get results"/>
            <asp:GridView ID="gridView" runat="server"></asp:GridView>
            <asp:Label ID="lblStatus" runat="server" />
        </div>
    </form>
</body>
</html>
