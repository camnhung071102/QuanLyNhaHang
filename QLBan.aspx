<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLBan.aspx.cs" Inherits="QLNH.QLBan" %>
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
    <h3>Quản lí bàn</h3>
    <br />
    <br />
    <table class="auto-style2">
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Mã bàn :"></asp:Label>
            <asp:TextBox ID="txt_mb" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Trạng thái : "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="Trong">Trống</asp:ListItem>
                <asp:ListItem Value="full">Có khách</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Mô tả : "></asp:Label>
            <asp:TextBox ID="txt_mt" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="text-align: center" colspan="2">
            <asp:Button ID="btn_t" runat="server" OnClick="btn_t_Click" Text="Thêm" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" style="width: 100%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="151px" Width="100%" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaBan" HeaderText="Mã bàn" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái " />
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
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
</table>

</asp:Content>
