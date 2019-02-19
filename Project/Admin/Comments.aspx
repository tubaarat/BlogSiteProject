<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="BlogSiteProject.Admin.Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 25px;
            height: 25px;
            margin-left: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
                &nbsp;<asp:Button ID="btnNotConfirmCommentPnlOpen" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnNotConfirmCommentPnlOpen_Click" />

                &nbsp;<asp:Button ID="btnNotConfirmCommentPnlClose" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnNotConfirmCommentPnlClose_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Onaylanmamış Yorumlar Paneli
            </div>
            <asp:Panel ID="pnlNotConfirmComments" runat="server" BackColor="#f8f9fa" ForeColor="White">
                <asp:DataList ID="dlGetComments" runat="server" Width="700px">
                    <ItemTemplate>
                        <div>
                            <div style="width: 100px; height: auto; float: left;">
                                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl='<%# Eval("commentPicture") %>' Width="60px" />
                            </div>
                            <div style="width: 590px; height: auto; float: left;">
                                <div style="float: left; width: 590px; height: 25px; background-color: #808080;">
                                    <asp:Label ID="lblCommentatorName" runat="server" Font-Size="18px" Text='<%# Eval("commentName") %>' Font-Bold="True" ForeColor="White"></asp:Label>
                                    &nbsp;<asp:Label ID="lblCommentatorEmail" runat="server" Font-Size="12px" Text='<%# Eval("commentEmail") %>' ForeColor="White"></asp:Label>
                                    &nbsp;<asp:Label ID="lblCommenTime" runat="server" Font-Size="12px" Text='<%# Eval("commentDate", "{0:dd MMMM yyyy}") %>' ForeColor="White"></asp:Label>
                                </div>
                                <div style="width: 590px; float: left; height: 25px; background-color: #A7A7A7; color: white;">
                                    Makale:
                        <asp:Label ID="lblArticleHeader" runat="server" Font-Size="16px" Text='<%# Eval("articleHeader") %>' Font-Bold="True" ForeColor="White"></asp:Label>
                                </div>
                                <div style="width: 590px; height: auto; float: left; background-color: #C0C0C0; color: white;">
                                    <asp:Label ID="lblCommentContent" runat="server" Text='<%# Eval("commentContent") %>' ForeColor="Black"></asp:Label>
                                </div>
                                <div style="width: 590px; height: 25px; float: left;">
                                    <table class="auto-style1">
                                        <tr>
                                            <td style="text-align: right; vertical-align: middle; height: auto;">
                                                <a href="UpdateComments.aspx?commentID=<%#Eval("commentID") %>&articleID=<%#Eval("articleID") %>">
                                                    <img alt="" class="auto-style5" src="../images/edit.png" /></a>
                                            </td>
                                            <td style="text-align: right; width: 35px; height: auto;">
                                                <a href="Comments.aspx?commentID=<%#Eval("commentID") %>&transaction=delete">
                                                    <img alt="" class="auto-style5" src="../images/delete.png" /></a>
                                            </td>
                                            <td style="text-align: right; width: 35px; height: auto">
                                               <a href="AnswerComments.aspx?articleID=<%#Eval("articleID") %>"> <img alt="" class="auto-style5" src="../images/cevap.png" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div style="width: 590px; height: 30px;"></div>
                        </div>

                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
            <div style="height: 30px; background-color: #f8f9fa"></div>
            <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
                &nbsp;<asp:Button ID="btnConfirmCommentPnlOpen" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnConfirmCommentPnlOpen_Click" />

                &nbsp;<asp:Button ID="btnConfirmCommentPnlClose" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnConfirmCommentPnlClose_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Onaylanan Yorumlar Paneli
            </div>

            <asp:Panel ID="pnlConfirmComment" runat="server" BackColor="#f8f9fa" ForeColor="White">
                <asp:DataList ID="dlConfirmedComment" runat="server" Width="700px">
                    <ItemTemplate>
                        <div>
                            <div style="width: 100px; height: auto; float: left;">
                                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl='<%# Eval("commentPicture") %>' Width="60px" />
                            </div>
                            <div style="width: 590px; height: auto; float: left;">
                                <div style="float: left; width: 590px; height: 25px; background-color: #808080;">
                                    <asp:Label ID="lblCommentatorName" runat="server" Font-Size="18px" Text='<%# Eval("commentName") %>' Font-Bold="True" ForeColor="White"></asp:Label>
                                    &nbsp;<asp:Label ID="lblCommentatorEmail" runat="server" Font-Size="12px" Text='<%# Eval("commentEmail") %>' ForeColor="White"></asp:Label>
                                    &nbsp;<asp:Label ID="lblCommenTime" runat="server" Font-Size="12px" Text='<%# Eval("commentDate", "{0:dd MMMM yyyy}") %>' ForeColor="White"></asp:Label>
                                </div>
                                <div style="width: 590px; float: left; height: 25px; background-color: #A7A7A7; color: white;">
                                    Makale:
                        <asp:Label ID="lblArticleHeader" runat="server" Font-Size="16px" Text='<%# Eval("articleHeader") %>' Font-Bold="True" ForeColor="White"></asp:Label>
                                </div>
                                <div style="width: 590px; height: auto; float: left; background-color: #C0C0C0; color: white;">
                                    <asp:Label ID="lblCommentContent" runat="server" Text='<%# Eval("commentContent") %>' ForeColor="Black"></asp:Label>
                                </div>
                                <div style="width: 590px; height: 25px; float: left;">
                                    <table class="auto-style1">
                                        <tr>
                                            <td style="text-align: right; width: 35px; height: auto;">
                                                <a href="UpdateComments.aspx?commentID=<%#Eval("commentID") %>&articleID=<%#Eval("articleID") %>">
                                                    <img alt="" class="auto-style5" src="../images/delete.png" /></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div style="width: 590px; height: 30px;"></div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
