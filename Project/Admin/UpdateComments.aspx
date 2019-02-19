<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateComments.aspx.cs" Inherits="BlogSiteProject.Admin.UpdateComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 239px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1" style="background-color:gray;">
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Yorumcu Adı:</td>
            <td>
                <asp:TextBox ID="txtCommentatorName" runat="server" CssClass="txtBox-style" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Yorum:</td>
            <td>
                <asp:TextBox ID="txtCommentContent" runat="server" CssClass="txtBox-style" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">Onay:</td>
            <td>
                <asp:CheckBox ID="cbConfirm" runat="server" Text="Onayla" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" style="text-align: right">&nbsp;</td>
            <td>
                <asp:Button ID="btnUpdateComment" runat="server" CssClass="btn-style" OnClick="btnUpdateComment_Click" Text="Güncelle" />
            </td>
        </tr>
    </table>
</asp:Content>
