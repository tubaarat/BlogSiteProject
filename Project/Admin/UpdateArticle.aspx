<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateArticle.aspx.cs" Inherits="BlogSiteProject.Admin.UpdateArticle" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="background-color: #808080">&nbsp;</td>
            <td style="background-color: #808080">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">Başlık:</td>
            <td style="background-color: #808080">
                <asp:TextBox ID="txtUpdArtHeader" runat="server" CssClass="txtBox-style" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">Özet:</td>
            <td style="background-color: #808080">
                <asp:TextBox ID="txtResume" runat="server" CssClass="txtBox-style" Height="40px" TextMode="MultiLine" Width="500px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">İçerik:</td>
            <td style="background-color: #808080">
                <dx:ASPxHtmlEditor ID="ASPxHtmlEditorUpdateArticle" runat="server" Height="250px" Width="500px" CssClass="txtBox-style">
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">Yorum Sayısı:</td>
            <td style="background-color: #808080">
                <asp:TextBox ID="txtCommentCount" runat="server" CssClass="txtBox-style"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">&nbsp;</td>
            <td style="background-color: #808080">
                <asp:Button ID="btnUpdateArticle" runat="server" CssClass="btn-style" OnClick="btnUpdateArticle_Click" Text="Güncelle" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="background-color: #808080; text-align: right;">&nbsp;</td>
            <td style="background-color: #808080">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
