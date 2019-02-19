<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="ArticleDetails.aspx.cs" Inherits="BlogSiteProject.ArticleDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="User.css" rel="stylesheet" />
    <style>
        .btn-new {
            background-color: #343a40;
            color: white;
            width: 100px;
            height: 25px;
        }

            .btn-new:hover {
                background-color: rgba(52, 58, 64, 0.60);
            }

        .txtBox-new {
            width: 150px;
            height: 25px;
            border: 1px dotted #343a40;
            padding: 2px;
            margin: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
        <asp:DataList ID="dlGetArticleDetail" runat="server" Width="690px">
            <ItemTemplate>
                <div style="width: 690px; margin: 0 auto; height: auto;">
                    <div style="width: 690px; height: 40px; float: left">

                        <div style="width: 40px; height: 40px; float: left">
                            <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl='<%# Eval("categoryPicture") %>' Width="40px" />
                        </div>
                        <div style="width: 650px; height: 40px; float: left; background-color: #C0C0C0; line-height: 40px; background-repeat: repeat-x; background-image: url('images/silver-background.jpg');">
                            &nbsp;
                            <asp:Label ID="Label1" runat="server" Font-Size="16pt" Text='<%# Eval("articleHeader") %>'></asp:Label>
                        </div>

                    </div>
                    <div style="float: left; height: auto; width: 690px; background-color: #CDCDCD; padding-bottom: 10px;">

                        <asp:Label ID="Label5" runat="server" Font-Size="12pt" Text='<%# Eval("articleContent") %>'></asp:Label>

                    </div>
                    <div style="width: 690px; height: 20px; float: left; line-height: 20px; font-size: 12px; background-color: #CDCDCD;">

                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style4" src="images/time1.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("articleDate","{0:dd MMMM yyyy}") %>' Font-Size="10pt"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style5" src="images/eye.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("articleReadCount") %>' Font-Size="10pt"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style5" src="images/comment.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("articleCommentCount") %>' Font-Size="10pt"></asp:Label>
                        </div>

                    </div>
                    <div style="width: 100%; height: 40px; float: left; background-color: #DADADA;"></div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div style="height: 30px; width: 100%;"></div>
    <div style="background-color: #343a40; color: white; height: 30px; text-align: center; font-size: 22px; font-weight: bolder; width: 100%">Makaleye Yapılan Yorumlar</div>
    <div style="width:690px; height:auto; margin:0 auto;">
        <asp:DataList ID="dlGetAllComments" Width="690px" runat="server">
            <ItemTemplate>
                <div style="width: 690px; height: auto; float: left; border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #343A40;">
                    <div style="float: left; width: 690px; height: 20px">
                        <div style="float:left; width:50px; height:60px;">
                            <asp:Image ID="Image4" runat="server" Height="60px" ImageUrl='<%# Eval("commentPicture") %>' Width="60px" />
                        </div>
                    </div>
                    <div style="float: left; width: 630px; height: auto">
                        <div style="float: left; width: 630px; height: 25px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblCommentName" runat="server" Text='<%# Eval("commentName") %>' Font-Size="18px" ForeColor="#660066" Font-Bold="True"></asp:Label>
                            &nbsp;
                            <asp:Label ID="lblCommentDate" runat="server" Font-Size="12px" ForeColor="#640064" Text='<%# Eval("commentDate","{0:dd MMMM yyyy}") %>'></asp:Label>
                        </div>
                        <div style="width:630px; height:auto;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblCommentContent" runat="server" Text='<%# Eval("commentContent") %>' ForeColor="#990099"></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:DataList>
    </div>
    <div style="height: 10px; width: 100%;"></div>


    <div style="height: 30px; width: 100%;"></div>
    <div style="background-color: #343a40; color: white; height: 30px; text-align: center; font-size: 22px; font-weight: bolder; width: 100%">Yorum Yap</div>
    <div style="height: 10px; width: 100%;"></div>
    <div class="auto-style6">
        <div style="border: 1px dotted #42464B; width: 340px; height: 200px; float: left; margin-left: 5px;">
            <asp:TextBox ID="txtComentContent" runat="server" Height="200px" Width="340px" TextMode="MultiLine" ToolTip="Yorumunuzu buraya giriniz."></asp:TextBox>
        </div>
        <div style="border: 1px dotted #42464B; width: 340px; height: 200px; float: right; margin-right: 5px;">
            <table class="auto-style12">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: right;">Ad Soyad:</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtCommentName" runat="server" CssClass="txtBox-new" Height="25px" ToolTip="Adınızı ve soyadınızı giriniz." MaxLength="200"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; text-align: right;">Email:</td>
                    <td style="text-align: left">
                        <asp:TextBox ID="txtCommentEmail" runat="server" CssClass="txtBox-new" Height="25px" ToolTip="Email adresinizi giriniz."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;"></td>
                    <td style="text-align: left; width: 240px; height: 25px;">
                        <asp:Button ID="btnAddComment" runat="server" Text="Gönder" Height="25px" Width="100px" CssClass="btn-new" ToolTip="Yorum göndermek için tıklayın." OnClick="btnAddComment_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left;" colspan="2">
                        <asp:Label ID="lblInfo" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left;" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: left;" colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
    <div style="height: 30px; width: 100%;"></div>

</asp:Content>
