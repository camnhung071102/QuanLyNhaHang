<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Thanhtoan.aspx.cs" Inherits="QLNH.Thanhtoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 376px;
        }
        .auto-style5 {
            width: 376px;
            height: 26px;
        }
        .auto-style9 {
            height: 156px;
        }
        .auto-style10 {
            height: 181px;
        }
        .auto-style11 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style2">
        <tr>
            <td class="auto-style4" rowspan="4">
                <asp:GridView ID="gvB" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="350px" Height="176px">
                    <Columns>
                        <asp:BoundField DataField="MaBan" HeaderText="Mã bàn" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng " />
                        <asp:CommandField SelectText="Cụ thể" ShowSelectButton="True"></asp:CommandField>
                    </Columns>
                </asp:GridView>
            </td>
            <td class="auto-style9" rowspan="3"></td>
            <td class="auto-style9">
                <asp:DropDownList ID="ddlma" runat="server" DataSourceID="SqlDataSourceMa" DataTextField="TenMonAn" DataValueField="MaMonAn" Height="30px" Width="179px" AutoPostBack="True" >
                </asp:DropDownList>
                <asp:DropDownList ID="ddlgia" runat="server" DataSourceID="SqlDataSourceGia" DataTextField="Gia" DataValueField="Gia" AutoPostBack="True">
                </asp:DropDownList>
                <asp:TextBox ID="TextBox2" runat="server" Width="50px" ></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Thêm món" OnClick="Button1_Click" Width="75px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:Label ID="lbMessage" runat="server"></asp:Label>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                <asp:Label ID="Message" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11" style="text-align: center; font-weight: bold; font-size: large;">
                <asp:Label ID="lbmb" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" Height="160px" Width="457px">
                    <Columns>
                        <asp:BoundField DataField="MaDatBan" HeaderText="Mã đặt bàn" />
                        <asp:BoundField DataField="MaMonAn" HeaderText="Mã món ăn" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                        <asp:BoundField HeaderText="Giá" DataField="Gia" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:SqlDataSource ID="SqlDataSourceGia" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" SelectCommand="SELECT [Gia] FROM [THUCDON] WHERE ([MaMonAn] = @MaMonAn)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlma" Name="MaMonAn" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMa" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" SelectCommand="SELECT [MaMonAn], [TenMonAn] FROM [THUCDON]"></asp:SqlDataSource>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Tổng tiền:"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="txt_tt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Mã nhân viên"></asp:Label>
                <asp:TextBox ID="txt_mnv" runat="server"></asp:TextBox>
                <asp:Label ID="Label4" runat="server" Text="Ngày lập hóa đơn"></asp:Label>
                <asp:TextBox ID="txt_nlhd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style1">
                <asp:Button ID="btn_tt" runat="server" OnClick="btn_tt_Click" Text="Thanh toán" />
            </td>
        </tr>
    </table>

</asp:Content>
