<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLkhachhang.aspx.cs" Inherits="QLNH.QLkhachhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 168px;
        }
        .auto-style3 {
            width: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table >
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label1" runat="server" Text="Mã khách hàng"></asp:Label>
        </td>
        <td>
            <input id="Text1" type="text" /></td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Tên khách hàng"></asp:Label>
        </td>
        <td>
            <input id="Text5" type="text" /></td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label2" runat="server" Text="Liên hệ"></asp:Label>
        </td>
        <td>
            <input id="Text2" type="text" class="auto-style2" /></td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btn_them" runat="server" Text="Thêm" />
        </td>
        <td colspan="2">
            <asp:Button ID="btn_sua" runat="server" Text="Sửa" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="174px" Width="506px">
                <Columns>
                    <asp:BoundField HeaderText="Mã khách hàng" />
                    <asp:BoundField HeaderText="Tên khách hàng" />
                    <asp:BoundField HeaderText="Liên hệ" />
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
