<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="datbanDB.aspx.cs" Inherits="QLNH.datbanDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 24px;
        }
        .auto-style3 {
            width: 30%;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 30%;
            height: 25px;
        }
        .auto-style6 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
  
    <table class="auto-style1">
        <tr>
            <td><h3>Chọn bàn</h3></td>
            <td>&nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" rowspan="4">
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
            <td colspan="2"><hr /></td>
            <td colspan="2">
                <asp:Button ID="btn_b" runat="server" OnClick="btn_b_Click" Text="Xong" />
                <asp:Button ID="btn_huy" runat="server" OnClick="btn_huy_Click" Text="Hủy" />
            </td>
        </tr>

        <tr>
            <td class="auto-style4" id="load"><h3>Chọn món</h3></td>
            <td class="auto-style4"></td>
            <td class="auto-style3"></td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="4">
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
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btn_themmon" runat="server" Text="Thêm món"   OnClick="btn_themmon_Click" style="height: 29px"  />
            </td>
        </tr>
        <tr>
            <td colspan="2" rowspan="2">
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
            <td class="auto-style3" rowspan="2">&nbsp;</td>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_chot" runat="server" Text="Chốt kèo" OnClick="btn_chot_Click" />
            </td>
        </tr>
      
    </table>
  
</asp:Content>
