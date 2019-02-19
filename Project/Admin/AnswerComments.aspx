<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AnswerComments.aspx.cs" Inherits="BlogSiteProject.Admin.AnswerComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 254px;
        }
        .auto-style3 {
            width: 150px;
            height: 25px;
            border: 1px dotted #343a40;
            padding: 2px;
            margin: 2px 2px 2px 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="auto-style1" style="background-color:silver;">
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">Admin:</td>
                <td>
                    <asp:TextBox ID="txtAdminName" runat="server" CssClass="txtBox-style"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">Yorum:</td>
                <td>
                    <asp:TextBox ID="txtCommentContent" runat="server" CssClass="auto-style3" Height="200px" TextMode="MultiLine" ViewStateMode="Disabled" Width="500px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td>
                    <asp:Button ID="btnCommentAnswer" runat="server" CssClass="btn-style" OnClick="btnCommentAnswer_Click" Text="Cevapla" />
                </td>
            </tr>
        </table>
    </div>
    <p>
        &nbsp;</p>
</asp:Content>
