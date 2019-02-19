<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="BlogSiteProject.CategoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="User.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style4 {
            width: 24px;
            height: 24px;
        }

        .auto-style5 {
            width: 32px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="width: 690px; height: auto; margin: 0 auto;">
        <asp:DataList ID="dlGetCategoryDetail" runat="server" Width="690px">
            <ItemTemplate>
                <div style="width: 690px; margin: 0 auto; height: auto;">
                    <div style="width: 690px; height: 40px; float: left">

                        <div style="width: 40px; height: 40px; float: left">
                            <asp:Image ID="Image3" runat="server" Height="40px" ImageUrl='<%# Eval("categoryPicture") %>' Width="40px" />
                        </div>
                        <div style="width: 650px; height: 40px; float: left; background-color: #C0C0C0; line-height: 40px;">
                            &nbsp;
                             <a href="ArticleDetails.aspx?articleID=<%#Eval("articleID") %>" style="text-decoration:none;"><asp:Label ID="Label1" runat="server" Font-Size="18px" ForeColor="Black" Text='<%# Eval("articleHeader") %>'></asp:Label></a>
                        </div>

                    </div>
                    <div style="float: left; height: auto; width: 690px; background-color: #C0C0C0; padding-bottom: 10px;">

                        <asp:Label ID="Label5" runat="server" Font-Size="16px" ForeColor="Black" Text='<%# Eval("articleResume") %>'></asp:Label>

                    </div>
                    <div style="width: 690px; height: 20px; float: left; line-height: 20px; font-size: 12px; background-color: #C0C0C0;">

                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style4" src="images/time1.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label2" runat="server" ForeColor="Black" Text='<%# Eval("articleDate","{0:dd MMMM yyyy}") %>' Font-Size="12px"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style5" src="images/eye.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label3" runat="server" ForeColor="Black" Text='<%# Eval("articleReadCount") %>' Font-Size="12px"></asp:Label>
                        </div>
                        <div style="width: auto; height: 20px; float: left; margin-right: 15px;">
                            <img alt="" class="auto-style5" src="images/comment.png" style="width: 12px; height: 12px" />
                            <asp:Label ID="Label4" runat="server" ForeColor="Black" Text='<%# Eval("articleCommentCount") %>' Font-Size="12px"></asp:Label>
                        </div>

                    </div>
                    <div style="width: 100%; height: 40px; float: left; background-color: #E1E1E1;"></div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
