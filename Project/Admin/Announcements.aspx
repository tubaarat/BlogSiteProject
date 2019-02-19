<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="BlogSiteProject.Admin.Announcements" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Admin.css" rel="stylesheet" />   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
            &nbsp;<asp:Button ID="btnAnnouncePnlOpen" runat="server" Height="25px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnAnnouncePnlOpen_Click" />

            &nbsp;<asp:Button ID="btnAnnouncePnlClose" runat="server" Height="25px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnAnnouncePnlClose_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duyuru Ekleme Paneli
        </div>
        <asp:Panel ID="pnlAnnounceAdd" runat="server" BackColor="Gray" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td style="text-align: right" class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Başlık:</td>
                    <td>
                        <asp:TextBox ID="txtAddAnnounceHeader" runat="server" CssClass="txtBox-style"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">İçerik:</td>
                    <td>
                        <dx:ASPxHtmlEditor ID="ASPxHtmlEditorAddAnnounce" runat="server" Height="400px" Width="600px">
                        </dx:ASPxHtmlEditor>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right"></td>
                    <td class="auto-style4">
                        <asp:Button ID="btnAddAnnounce" runat="server" CssClass="btn-style" OnClick="btnAddAnnounce_Click" Text="Ekle" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: right">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height: 30px; background-color: #f8f9fa"></div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
            &nbsp;<asp:Button ID="btnEditAnnouncePnlOpen" runat="server" Height="25px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnEditAnnouncePnlOpen_Click" />

            &nbsp;<asp:Button ID="btnEditAnnouncePnlClose" runat="server" Height="25px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnEditAnnouncePnlClose_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Duyuru Düzenleme Paneli
        </div>
        <asp:Panel ID="pnlEditAnnounce" runat="server" BackColor="Gray" ForeColor="White">
            <asp:DataList ID="dlGetAnnounce" runat="server" Width="700px">
                <HeaderTemplate>
                    <table class="dx-justification">
                        <tr>
                            <td class="auto-style5">DUYURU BAŞLIK</td>
                            <td class="auto-style6">GÜNCELLE</td>
                            <td>SİL</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="dx-justification">
                        <tr>
                            <td class="auto-style5">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("announceHeader") %>'></asp:Literal>
                            </td>
                            <td class="auto-style6">
                                <a href="UpdateAnnouncement.aspx?announceID=<%#Eval("announceID")%>"><img alt="" class="auto-style7" src="../images/edit.png" /></a>
                            </td>
                            <td>
                                <a href="Announcements.aspx?announceID=<%#Eval("announceID") %>&transaction=delete"><img alt="" class="auto-style8" src="../images/delete.png" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>

        </asp:Panel>
        <div style="height: 30px; background-color: #f8f9fa"></div>
    </div>
</asp:Content>
