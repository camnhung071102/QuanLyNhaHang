<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Thanhtoan.aspx.cs" Inherits="QLNH.Thanhtoan" %>
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
    <h3>Thanh toán </h3>
    <br />
    <br />
 
    <table>
        <tr>
            <td rowspan="5">
                <asp:GridView ID="gvB" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" Height="176px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaBan" HeaderText="Mã bàn" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng " />
                        <asp:CommandField SelectText="Cụ thể" ShowSelectButton="True"></asp:CommandField>
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
               <td>
                   &nbsp;</td>
               <td rowspan="5">
                     <asp:Label ID="lbmb" runat="server"></asp:Label>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" Height="160px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaDatBan" HeaderText="Mã đặt bàn" />
                        <asp:BoundField DataField="MaMonAn" HeaderText="Mã món ăn" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                        <asp:BoundField HeaderText="Giá" DataField="Gia" />
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
        <tr>
               <td>
                <asp:DropDownList ID="ddlma" runat="server" DataSourceID="SqlDataSourceMa" DataTextField="TenMonAn" DataValueField="MaMonAn" Height="30px" Width="179px" AutoPostBack="True" >
                </asp:DropDownList>
                </td>
        </tr>
          <tr>
               <td>
                <asp:DropDownList ID="ddlgia" runat="server" DataSourceID="SqlDataSourceGia" DataTextField="Gia" DataValueField="Gia" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Label ID="lbMessage" runat="server"></asp:Label>
                </td>
              
        </tr> 
        <tr>
               <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="50px" ></asp:TextBox>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
             
        </tr>
          <tr>
               <td>
                <asp:Button ID="Button1" runat="server" Text="Thêm món" OnClick="Button1_Click" Width="94px" />
                <asp:Label ID="Message" runat="server"></asp:Label>
              </td>
             
        </tr>
          <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Mã nhân viên"></asp:Label>
                <asp:TextBox ID="txt_mnv" runat="server"></asp:TextBox>
                </td>
               <td>
                <asp:Label ID="Label4" runat="server" Text="Ngày lập hóa đơn"></asp:Label>
                <asp:TextBox ID="txt_nlhd" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:Label ID="Label1" runat="server" Text="Tổng tiền:"></asp:Label>
                <asp:TextBox ID="txt_tt" runat="server"></asp:TextBox>
              
              </td>
        </tr>

          <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceMa" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" SelectCommand="SELECT [MaMonAn], [TenMonAn] FROM [THUCDON]"></asp:SqlDataSource>
              </td>
               <td>
                <asp:Button ID="btn_tt" runat="server" OnClick="btn_tt_Click" Text="Thanh toán" />
              </td>
              <td>
                <asp:SqlDataSource ID="SqlDataSourceGia" runat="server" ConnectionString="<%$ ConnectionStrings:QLNHConnectionString %>" SelectCommand="SELECT [Gia] FROM [THUCDON] WHERE ([MaMonAn] = @MaMonAn)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlma" Name="MaMonAn" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>

    </table>
</asp:Content>
