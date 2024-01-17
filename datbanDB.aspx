<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="datbanDB.aspx.cs" Inherits="QLNH.datbanDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
    /* Center the table on the page */
    table {
      margin: 0 auto;
    }

    /* Style for table cell containing a label */
    td.auto-style3 {
      text-align: right;
      font-weight: bold;
      padding-right: 10px;
    }

    /* Style for table cell containing a form control */
    td.auto-style4 {
      padding-left: 10px;
    }

    /* Style for the "Xong" button */
    #btn_b {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 10px 16px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 5px;
    }

    /* Style for the "Hủy" button */
    #btn_huy {
      background-color: #f44336;
      color: white;
      border: none;
      padding: 10px 16px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
      border-radius: 5px;
    }

    /* Style for the table's header row */
    th {
      background-color: #507CD1;
      color: white;
      font-weight: bold;
    }

    /* Style for the table's data rows */
    td {
      border: 1px solid #ddd;
      padding: 8px;
    }
    button {
  background-color: #4CAF50; /* Màu nền của button */
  color: white; /* Màu chữ trên button */
  font-size: 16px; /* Cỡ chữ */
  padding: 10px 16px; /* Khoảng cách giữa nội dung và biên của button */
  border: none; /* Không có đường viền */
  border-radius: 4px; /* Bo tròn góc của button */
  cursor: pointer; /* Biến đổi hình con trỏ khi di chuột qua button */
}

/* CSS cho khi hover chuột qua button */
button:hover {
  background-color: #3e8e41; /* Màu nền thay đổi */
}

    /* Style for the "Chọn" button in the table */
    .GridView td input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 5px 10px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 12px;
      margin: 2px 2px;
      cursor: pointer;
      border-radius: 3px;
    }
       .auto-style1 {
           height: 47px;
       }
       .auto-style2 {
           width: 601px;
           height: -15px;
       }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
  
    <table class="auto-style1">
        <tr>
            <td><h3>Chọn bàn</h3></td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td rowspan="4">
                <asp:GridView ID="gvB" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvB_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaBan" HeaderText="Mã Bàn" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
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
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Mã đặt bàn"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_mdb" runat="server"></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label2" runat="server" Text="Mã Bàn"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_mb" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label7" runat="server" Text="Ngày "></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_nd" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="auto-style4" colspan="2">
                <asp:Label ID="lbMessage" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td colspan="2">
                <asp:Button ID="btn_b" runat="server" OnClick="btn_b_Click" Text="Xong" />
                <asp:Button ID="btn_huy" runat="server" OnClick="btn_huy_Click" Text="Hủy" />
            </td>
        </tr>

        <tr>
            <td colspan="3"><hr class="auto-style2" /></td>
        </tr>

        <tr>
            <td class="auto-style4" id="load" colspan="3"><h3>Chọn món</h3></td>
        </tr>
        <tr>
            <td rowspan="5">
                 <asp:GridView ID="GridView1" runat="server" Height="192px" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Mã món ăn" DataField="MaMonAn" />
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
                    <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
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
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Text="Mã món ăn"></asp:Label>
                </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_mma" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Giá" runat="server" Text="Giá"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_g" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label5" runat="server" Text="Số lượng"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txt_sl" runat="server">1</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btn_themmon" runat="server" Text="Thêm món"   OnClick="btn_themmon_Click" style="height: 29px"  />
            </td>
        </tr>
        <tr><td colspan="3" style="text-align"><h3 style="text-align: center">Danh sách món ăn đã chọn</h3></td></tr>
        <tr>
            <td colspan="3">
                 <asp:GridView ID="GridView2" runat="server" Height="192px" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDeleting="GridView2_RowDeleting" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Mã đặt bàn" DataField="MaDatBan" />
                    <asp:BoundField HeaderText="Mã Món ăn" DataField="MaMonAn" />
                    <asp:BoundField HeaderText="Số lượng" DataField="SoLuong" />
                    <asp:BoundField HeaderText="Giá" DataField="Gia" />
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
        <tr><td colspan="3" style="text-align: center">
                <asp:Button ID="btn_chot" runat="server" Text="Chốt kèo" OnClick="btn_chot_Click" />
            </td></tr>
    </table>
  
</asp:Content>
