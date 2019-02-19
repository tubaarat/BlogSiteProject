<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BlogSiteProject.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Sayfası</title>
    <link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            border: 0;
        }

        .auto-style1 {
            width: 417%;
        }

        .auto-style2 {
            width: auto;
        }

        .auto-style3 {
            float: left;
            width: auto;
        }

        .auto-style4 {
            width: auto;
        }
    </style>
</head>
<body style="background-color: #f8f9fa">
    <form id="form1" runat="server">
        <div style="height: 100px; background-color: #343a40; color: #f8f9fa;">
            <div style="float: left; margin-top: 20px; margin-left: 20px; width: 250px; color: white;">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2" style="text-align: right">Kullanıcı Adı:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtAdminUserName" runat="server" Height="25px"></asp:TextBox>

                        </td>
                        <td style="text-align: right">Şifre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtAdminPassword" runat="server" Height="25px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td style="width: 300px">
                            <asp:Button ID="btnAdminEnter" runat="server" Text="Giriş" Width="80px" class="btn btn-primary btn-sm" OnClick="btnAdminEnter_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div style="float:right; text-align:right; margin:25px">
                <asp:Label ID="lblInfo" runat="server" Text="Admin Paneli" ForeColor="White"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
