<%@ Page Language="C#" AutoEventWireup="true" CodeFile="apple.aspx.cs" Inherits="apple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            你家有苹果：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br/>
            你家有梨子：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br/><br/>
            <asp:Button ID="Button1" runat="server" Text=" 提 交 " OnClick="Button1_Click" /><br/><br/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        </div>
    </form>
</body>
</html>
