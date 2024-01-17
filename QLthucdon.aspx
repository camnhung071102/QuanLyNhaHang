<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLthucdon.aspx.cs" Inherits="QLNH.QLthucdon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style type="text/css">
        @import url("https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Open+Sans:wght@400;600;700&display=swap");
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&display=swap');



h3 {
    font-family: 'Dancing Script', cursive;
    font-weight: bold;
    text-align: center;

}
        table {
  border-collapse: collapse;
  margin:auto;
width: 80%;
}

td,
th {
  padding: 8px;
  text-align: center;
  font-size: 14px;
}

th {
  background-color: #507CD1;
  color: #fff;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

.gridview-buttons {
  text-align: center;
}

.gridview-image {
  height: 70px;
  max-width: 100px;
  object-fit: cover;
  object-position: center;
}
}

    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <h3>Quản lí thực đơn</h3>
    <br />
    <br />
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
            <asp:DropDownList ID="ddl_pl" runat="server" OnSelectedIndexChanged="ddl_sx_SelectedIndexChanged">
                <asp:ListItem>Tất cả</asp:ListItem>
                <asp:ListItem Value="KV">Khai Vị</asp:ListItem>
                <asp:ListItem Value="DU">Đồ uống</asp:ListItem>
                <asp:ListItem Value="MC">Món Chính</asp:ListItem>
                <asp:ListItem Value="TM">Tráng miệng</asp:ListItem>
            </asp:DropDownList>
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
        <td class="auto-style2">
            <asp:Label ID="Label5" runat="server" Text="Sắp xếp"></asp:Label>
        </td>
        <td class="auto-style4">
            <asp:DropDownList ID="ddl_sx" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sx_SelectedIndexChanged">
                <asp:ListItem>Tất cả</asp:ListItem>
                <asp:ListItem Value="KV">Khai Vị</asp:ListItem>
                <asp:ListItem Value="DU">Đồ uống</asp:ListItem>
                <asp:ListItem Value="MC">Món Chính</asp:ListItem>
                <asp:ListItem Value="TM">Tráng miệng</asp:ListItem>
            </asp:DropDownList>
        </td>
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
            <asp:GridView ID="GridView1" runat="server" Height="192px" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
