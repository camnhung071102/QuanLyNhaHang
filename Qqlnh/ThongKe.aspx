<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QLNH.ThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
    <tr>
        <td class="auto-style1"></td>
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
        <td class="auto-style1">&nbsp;</td>
        <td class="auto-style1" colspan="2">
            <asp:Label ID="lb" runat="server"></asp:Label>
        </td>
        <td class="auto-style1">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="btn_tk" runat="server" OnClick="btn_tk_Click" Text="Thống kê" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="150px" ShowHeaderWhenEmpty="True" Width="505px">
                <Columns>
                    <asp:BoundField DataField="MaHoaDon" HeaderText="Mã hóa đơn" />
                    <asp:BoundField DataField="MaDatBan" HeaderText="Mã đặt bàn" />
                    <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" />
                    <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
                    <asp:BoundField DataField="NgayLapHD" HeaderText="Ngày Lập " />
                </Columns>
            </asp:GridView>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="Label3" runat="server" Text="Doanh thu :   "></asp:Label>
            <asp:TextBox ID="txt_dt" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
