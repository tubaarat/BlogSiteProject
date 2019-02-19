<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateAnnouncement.aspx.cs" Inherits="BlogSiteProject.Admin.UpdateAnnouncement" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 287px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">&nbsp;</td>
            <td style="background-color: #808080">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">Başlık:</td>
            <td style="background-color: #808080">
                <asp:TextBox ID="txtUpdAnnounceHeader" runat="server" CssClass="txtBox-style"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">İçerik:</td>
            <td style="background-color: #808080">
                <dx:ASPxHtmlEditor ID="ASPxHtmlEditorUpdateAnnounce" runat="server" CssClass="txtBox-style" Height="600px" Width="600px">
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">&nbsp;</td>
            <td style="background-color: #808080">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">&nbsp;</td>
            <td style="background-color: #808080">
                <asp:Button ID="btnUpdateAnnounce" runat="server" CssClass="btn-style" OnClick="btnUpdateAnnounce_Click" Text="Güncelle" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right; background-color: #808080">&nbsp;</td>
            <td style="background-color: #808080">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
