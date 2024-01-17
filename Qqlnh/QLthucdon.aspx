<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLthucdon.aspx.cs" Inherits="QLNH.QLthucdon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            width: 169px;
        }
        .auto-style4 {
            height: 29px;
            width: 169px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table >
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Mã món"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_mma" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Phân loại"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:DropDownList ID="ddl_pl" runat="server" DataSourceID="SqlDataSource1" DataTextField="MaPhanLoai" DataValueField="MaPhanLoai">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" ProviderName="<%$ ConnectionStrings:QLNHConnectionString.ProviderName %>" SelectCommand="SELECT [MaPhanLoai] FROM [PHANLOAI] WHERE ([TenLoai] IS NOT NULL) ORDER BY [MaPhanLoai]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Tên món"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_tma" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Giá"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="txt_g" runat="server">10000</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style2">
            <asp:FileUpload ID="fupAvatar" runat="server" />
        </td>
        <td class="auto-style2"></td>
        <td class="auto-style4"></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btn_them" runat="server" Text="Thêm" OnClick="btn_them_Click" />
        </td>
        <td colspan="2">
            <asp:Button ID="btn_sua" runat="server" Text="Sửa" OnClick="btn_sua_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:GridView ID="GridView1" runat="server" Height="192px" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Mã" DataField="MaMonAn" />
                    <asp:BoundField HeaderText="Tên món ăn" DataField="TenMonAn" />
                    <asp:BoundField HeaderText="Phân loại" DataField="MaPhanLoai" />
                    <asp:BoundField HeaderText="Giá" DataField="Gia" />
                    <asp:ImageField HeaderText="Hình" DataImageUrlField="Hinh" DataImageUrlFormatString="~/image/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="hinhanh" Visible="False">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh","~/image/{0}" )%>' Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
