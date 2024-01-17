<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QLNH.ThongKe" %>
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


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <h3>Thống kê </h3>
    <br />
    <br />
    <table class="auto-style2">
            <tr>
        <td class="auto-style1">
           
            <asp:RadioButton ID="rbt_tc" runat="server" Text="Tất cả" GroupName="thongKeGroup" />
           
        </td>
        <td class="auto-style1">
           
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" SelectCommand="SELECT [MaMonAn], [TenMonAn], [MaPhanLoai], [Gia], [Hinh] FROM [THUCDON]"></asp:SqlDataSource>
           
        </td>
        <td class="auto-style1"></td>
    </tr>
           <tr>
        <td class="auto-style1">
           
            <asp:RadioButton ID="rbt_ma" GroupName="thongKeGroup" runat="server" Text="Món ăn" />
           
        </td>
        <td class="auto-style1">
         
            <asp:DropDownList ID="ddl_ma" runat="server" DataSourceID="SqlDataSource2" DataTextField="TenMonAn" DataValueField="MaMonAn" AutoPostBack="True">
            </asp:DropDownList>
         
        </td>
        <td class="auto-style1"></td>
    </tr>
          <tr>
        <td colspan="2" style="text-align: center">
          <hr />
        </td>
        <td>&nbsp;</td>
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="Từ ngày :"></asp:Label>
            <asp:TextBox ID="txt_tn" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Đến ngày : "></asp:Label>
            <asp:TextBox ID="txt_dn" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="2">
            <asp:Label ID="lb" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="btn_tk" runat="server" OnClick="btn_tk_Click" Text="Thống kê" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="150px" ShowHeaderWhenEmpty="True" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaHoaDon" HeaderText="Mã hóa đơn" />
                    <asp:BoundField DataField="MaDatBan" HeaderText="Mã đặt bàn" />
                    <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
                    <asp:BoundField DataField="NgayLapHD" HeaderText="Ngày Lập " />
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
        <td>&nbsp;</td>
    </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã Hóa Đơn" />
                        <asp:BoundField DataField="MaMonAn" HeaderText="Mã Món ăn" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" />
                        <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
                        <asp:BoundField DataField="NgayLapHD" HeaderText="Ngày" />
                    </Columns>
                </asp:GridView>
            </td>
            <td></td>
        </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="Label3" runat="server" Text="Doanh thu :   "></asp:Label>
            <asp:TextBox ID="txt_dt" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
