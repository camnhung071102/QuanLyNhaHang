<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="datbanTTKH.aspx.cs" Inherits="QLNH.datbanTTKH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        height: 48px;
    }
        .auto-style3 {
            width: 26%;
        }
        .auto-style4 {
            height: 26px;
            width: 26%;
        }
        .auto-style5 {
            height: 33px;
        }
        .auto-style6 {
            width: 26%;
            height: 33px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td>&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 20%">&nbsp;</td>
        <td class="auto-style3">
            <asp:Label ID="Label2" runat="server" Text="Họ tên"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_ht" runat="server"></asp:TextBox>
        </td>
        <td style="width: 20%">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2"></td>
        <td class="auto-style4">
            <asp:Label ID="Label3" runat="server" Text="Số điện thoại"></asp:Label>
        </td>
        <td class="auto-style2">
            <asp:TextBox ID="txt_sdt" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style2"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style7" colspan="2">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
        <td class="auto-style2">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5"></td>
        <td class="auto-style6"></td>
        <td style="text-align: right" class="auto-style5">
            <asp:Button ID="btn_tieptheo" runat="server" Text="Tiếp theo" OnClick="btn_tieptheo_Click" style="height: 29px" />
        </td>
        <td class="auto-style5"></td>
    </tr>
</table>
</asp:Content>
