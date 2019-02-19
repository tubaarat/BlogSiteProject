<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="BlogSiteProject.Admin.Articles" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.2, Version=17.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <link href="Admin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px; font-family: 'Times New Roman', Times, serif;">
            &nbsp;<asp:Button ID="btnArticlePnlOpen" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnArticlePnlOpen_Click" />

            &nbsp;<asp:Button ID="btnArticlePnlClose" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnArticlePnlClose_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Makale Ekleme Paneli
        </div>
        <asp:Panel ID="pnlArticleAdd" runat="server" BackColor="Gray" ForeColor="White">
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right">Kategori:</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropDownList-style">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" class="auto-style3">Başlık:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtHeader" runat="server" CssClass="txtBox-style" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">Özet:</td>
                    <td>
                        <asp:TextBox ID="txtResume" runat="server" CssClass="auto-style9" Height="50px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">İçerik:</td>
                    <td>
                        <dx:ASPxHtmlEditor ID="ASPxHtmlEditorAddArticle" runat="server" Width="600px" Height="255px">
                            <SettingsDialogs>
                                <InsertImageDialog>
                                    <SettingsImageUpload UploadFolder="~/UploadFiles/Images/">
                                        <ValidationSettings AllowedFileExtensions=".jpe,.jpeg,.jpg,.gif,.png" MaxFileSize="500000">
                                        </ValidationSettings>
                                    </SettingsImageUpload>
                                </InsertImageDialog>
                            </SettingsDialogs>

                        </dx:ASPxHtmlEditor>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right"></td>
                    <td class="auto-style2">
                        <asp:Button ID="btnAddArticle" runat="server" CssClass="btn-style" Text="Ekle" Width="99px" OnClick="btnAddArticle_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>

            </table>
        </asp:Panel>
        <div style="height: 30px; background-color: #f8f9fa"></div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px; font-family: 'times New Roman', Times, serif;">
            &nbsp;<asp:Button ID="btnOpenEditArtPnl" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnOpenEditArtPnl_Click" />

            &nbsp;<asp:Button ID="btnCloseEditArtPnl" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnCloseEditArtPnl_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Makale Düzenleme Paneli
        </div>
        <asp:Panel ID="pnlEditArticle" runat="server" BackColor="Gray" ForeColor="White">
            <asp:DataList ID="dtlGetArticles" runat="server" Width="600px">
                <HeaderTemplate>
                    <table class="dx-justification">
                        <tr>
                            <td class="auto-style4">MAKALE ADI</td>
                            <td class="auto-style5">DÜZENLE</td>
                            <td>SİL</td>
                        </tr>

                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style8">
                        <tr>
                            <td class="auto-style4">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("articleHeader") %>'></asp:Literal>
                            </td>
                            <td style="vertical-align: middle">
                                <a href="UpdateArticle.aspx?articleID=<%# Eval("articleID") %>">
                                    <img alt="" class="auto-style6" src="../images/edit.png" style="width: 30px; height: 30px" /></a>
                            </td>
                            <td style="float: left; vertical-align: middle;">
                                <a href="Articles.aspx?articleID=<%# Eval("articleID")%>&transaction=delete">
                                    <img alt="" class="auto-style7" src="../images/delete.png" style="width: 30px; height: 30px" /></a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>

        </asp:Panel>
        <div style="height: 30px; background-color: #f8f9fa"></div>

        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px; font-family: 'times New Roman', Times, serif;">
            &nbsp;<asp:Button ID="btnOpenPnlAddFile" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnOpenPnlAddFile_Click" />

            &nbsp;<asp:Button ID="btnClosePnlAddFile" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnClosePnlAddFile_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Makale Dosya Ekleme Paneli
        </div>
        <asp:Panel ID="pnlAddFile" runat="server" BackColor="Gray" ForeColor="White">
            <table class="dx-justification">
                <tr>
                    <td style="text-align: right" class="auto-style11">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11" style="text-align: right">Dosya Seç:</td>
                    <td>
                        <asp:FileUpload ID="fuAddFile" runat="server" CssClass="txtBox-style" Width="300px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnAddFiles" runat="server" CssClass="btn-style" OnClick="btnAddFiles_Click" Text="Ekle" Width="85px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11" style="text-align: right">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11" style="text-align: right">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblAddFileError" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="White" Font-Names="Times New Roman"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div style="height: 30px; background-color: #f8f9fa"></div>
    </div>

</asp:Content>
