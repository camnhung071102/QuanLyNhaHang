<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLBan.aspx.cs" Inherits="QLNH.QLBan" %>
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
        <td colspan="2">
            <asp:Label ID="Label3" runat="server" Text="Mô tả : "></asp:Label>
            <asp:TextBox ID="txt_mt" runat="server"></asp:TextBox>
        </td>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="151px" Width="502px" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="MaBan" HeaderText="Mã bàn" />
                    <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                    <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái " />
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

</asp:Content>
