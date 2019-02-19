<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BlogSiteProject.Admin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Admin.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
            &nbsp;<asp:Button ID="btnCatPanelOpen" runat="server"  Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnCatPanelOpen_Click" />

            &nbsp;<asp:Button ID="btnCatPanelClose" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnCatPanelClose_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kategori Ekleme Paneli
        </div>
        <asp:Panel ID="pnlCategoryAdd" runat="server" BackColor="Gray" ForeColor="White">
            <table>
                <tr>
                    <td style="padding: 5px; text-align: right; width: 200px; height: 30px">Kategori Adı:</td>
                    <td style="padding: 2px; width: 200px; height: 30px">
                        <asp:TextBox ID="txtCategoryName" runat="server" CssClass="txtBox-style" Height="25px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px; text-align: right; width: 200px; height: 30px">Sıra:</td>
                    <td style="padding: 2px; width: 200px; height: 30px">
                        <asp:TextBox ID="txtCategoryNo" runat="server" CssClass="txtBox-style" Height="25px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 5px; text-align: right; width: 200px; height: 30px">Resim:</td>
                    <td style="padding: 2px; width: 200px; height: 30px">
                        <asp:FileUpload ID="fuCategoryPicture" runat="server" CssClass="txtBox-style" Height="35px" Width="300px" />
                    </td>
                    <td>
                        <asp:Label ID="lblValidation" runat="server" Text=""></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px; text-align: right; width: 200px; height: 30px"></td>
                    <td style="padding: 2px; width: 200px; height: 30px">
                        <asp:Button ID="btnAddCategory" runat="server" Text="Ekle" Width="100px" CssClass="btn-style" Height="25px" OnClick="btnAddCategory_Click" />
                    </td>

                </tr>
                <tr>
                    <td style="padding: 5px; text-align: right; width: 200px; height: 30px"></td>
                    <td class="auto-style4"></td>
                </tr>
            </table>

        </asp:Panel>
         <div style="height:30px; background-color:#f8f9fa"></div>
        <div style="height: 30px; background-color: #343a40; color: white; font-weight: bolder; padding: 5px;">
            &nbsp;<asp:Button ID="btnEditCatOpen" runat="server" Height="20px" Text="+" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="true" BorderStyle="Solid" OnClick="btnEditCatOpen_Click" />

            &nbsp;<asp:Button ID="btnEditCatClose" runat="server" Height="20px" Text="-" Width="25px" BackColor="#f8f9fa" ForeColor="#343a40" Font-Bold="True" BorderStyle="Solid" OnClick="btnEditCatClose_Click"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kategori Düzenleme Paneli
        </div>
       
    <asp:Panel ID="pnlCategoryEdit" runat="server" BackColor="Gray" ForeColor="White">
        <asp:DataList ID="dlCategoryList" runat="server">
            <HeaderTemplate>
                <table class="auto-style6">
                    <tr>
                        <td style="width:auto; height:30px;">KATEGORİ ADI</td>
                        <td style="width:auto; height:30px;">DÜZENLE</td>
                        <td>SİL</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table class="auto-style6">
                    <tr>
                        <td class="auto-style7">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("categoryName") %>'></asp:Literal>
                        </td>
                        <td style="vertical-align: middle;" class="auto-style12">
                            <a href="UpdateCategory.aspx?categoryID=<%# Eval("categoryID") %>"><img alt="" src="../images/edit.png" height="30px" width="30px" style="width: 30px; height: 30px; vertical-align: middle; float: left;"/></a>
                        </td>
                        <td style="width: 30px; height: 30px; float: left;">
                            <a href="Categories.aspx?categoryID=<%# Eval("categoryID") %>&transaction=delete"><img alt="" class="auto-style10" src="../images/delete.png" height="30px" width="30px" style="width: 30px; height: 30px; vertical-align: middle; float: left;" /></a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </asp:Panel>
        <div style="background-color:#f8f9fa" class="auto-style11"></div>
    </div>
</asp:Content>
