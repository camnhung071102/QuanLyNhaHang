<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="QLnhanvien.aspx.cs" Inherits="QLNH.QLnhanvien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
      
        .auto-style4 {
            width: 232%;
            height: 671px;
        }
        .auto-style5 {
            height: 395px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
  
    <table class="auto-style4" runat="server"   >
    <tr>
        <td >
            <asp:Label ID="Label1" runat="server" Text="Mã nhân viên"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_mnv" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Tên đăng nhập"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_tdn" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label2" runat="server" Text="Tên nhân viên"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_tnv" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Mật khẩu"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txt_mk" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label5" runat="server" Text="Vị trí"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddlVitri" runat="server" Height="16px" Width="155px" DataSourceID="SqlDataSource1" DataTextField="ViTri" DataValueField="ViTri">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString2 %>" ProviderName="<%$ ConnectionStrings:QLNHConnectionString2.ProviderName %>" SelectCommand="SELECT DISTINCT [ViTri] FROM [NHANVIEN]"></asp:SqlDataSource>
        </td>
        <td colspan="2">
            <asp:FileUpload ID="fupAvatar" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="2">
            <asp:Button ID="btn_them" runat="server" Text="Thêm" OnClick="btn_them_Click" />
        </td>
        <td colspan="2" class="auto-style1">
            <asp:Button ID="btn_sua" runat="server" Text="Sửa" OnClick="btn_sua_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="4" style="text-align: center">
            <asp:Label ID="lbMessage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="auto-style5">
            <asp:GridView ID="GridView1" runat="server" Height="292px" Width="46%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Mã nhân viên" DataField="MaNV" />
                    <asp:BoundField HeaderText="Tên nhân viên" DataField="HoTen" />
                    <asp:BoundField HeaderText="Vị Trí" DataField="ViTri" />
                    <asp:BoundField HeaderText="Tên đăng nhập" DataField="TenDN" />
                    <asp:BoundField HeaderText="Mật khẩu" DataField="MatKhau" />
                    <asp:ImageField HeaderText="Hình" DataImageUrlField="Hinh" DataImageUrlFormatString="~/image/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="hinh anh" Visible="False">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh","~/images/{0}" )%>' Height="100px" Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
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
</table>

</asp:Content>
