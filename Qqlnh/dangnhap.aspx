<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="QLNH.dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 24px;
        }
        .auto-style4 {
            height: 25px;
        }
    .auto-style5 {
        height: 29px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="auto-style1">
        <tr>
            <td colspan="2" style="text-align: center">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="ĐĂNG NHẬP"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="2" style="text-align: center">
                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/image/user.png" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Text="Tên đăng nhập"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txt_tdn" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Mật khẩu"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_mk" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Vị trí"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl" runat="server">
                    <asp:ListItem Value="NhanVien">Nhân viên</asp:ListItem>
                    <asp:ListItem Value="Admin">Quản lí</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Đăng nhập" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:Content>
