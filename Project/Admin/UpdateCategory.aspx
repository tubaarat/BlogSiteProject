<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="BlogSiteProject.Admin.UpdateCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style8 {
            height: 30px;
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="text-align: right; background-color: #808080;">
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">&nbsp;</td>
            <td style="padding: 5px; text-align: right; width: 200px; height: 30px">&nbsp;</td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">Kategori Adı:</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">
                <asp:TextBox ID="txtUpdCatName" runat="server" CssClass="txtBox-style"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">Sırası:</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">
                <asp:TextBox ID="txtUpdCatNo" runat="server" CssClass="txtBox-style"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">Adet:</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">
                <asp:TextBox ID="txtUpdCatCount" runat="server" CssClass="txtBox-style"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">Resim:</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">
                <asp:FileUpload ID="fuCatUpdatePicture" runat="server" CssClass="txtBox-style" Width="300px" />
            </td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">&nbsp;</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">
                <asp:Button ID="btnUpdateCategory" runat="server" CssClass="btn-style" Text="Güncelle" Width="100px" OnClick="btnUpdateCategory_Click" />
            </td>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: right; " class="auto-style8">&nbsp;</td>
            <td style="padding: 5px; text-align: left; width: 200px; height: 30px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
