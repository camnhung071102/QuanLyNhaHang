<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="dangnhap.aspx.cs" Inherits="QLNH.dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<style>

             @import url("https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Open+Sans:wght@400;600;700&display=swap");
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&display=swap');



h2 {
    font-family: 'Dancing Script', cursive;
    font-weight: bold;
    text-align: center;

}
.auto-style1 {
    border-collapse: collapse;
    margin: auto;
    width: 50%;
    background-color: #f2f2f2;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
}

.auto-style3 {
    width: 60%;
}

.auto-style4 {
    width: 40%;
}

.auto-style5 {
    padding: 10px;
    font-size: medium;
    font-weight: bold;
}

.auto-style6 {
    padding: 10px;
    font-size: medium;
    border: none;
    border-radius: 5px;
    box-sizing: border-box;
    display: block;
    width: 100%;
    margin-bottom: 20px;
    background-color: #f2f2f2;
    border: 2px solid #ccc;
}

.auto-style6:focus {
    border: 2px solid #4CAF50;
}

.auto-style7 {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    padding: 10px;
    font-size: medium;
    border-radius: 5px;
    transition-duration: 0.4s;
}

.auto-style7:hover {
    background-color: white;
    border: 2px solid #4CAF50;
    color: #4CAF50;
}

.auto-style8 {
    text-align: center;
    padding-top: 20px;
    font-size: x-large;
    font-weight: bold;
    color: #4CAF50;
}

.auto-style9 {
    font-weight: bold;
    font-size: medium;
    padding: 10px;
}

@media screen and (max-width: 768px) {
    .auto-style1 {
        width: 80%;
    }
}

@media screen and (max-width: 480px) {
    .auto-style1 {
        width: 100%;
    }
}
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h2 style="text-align:center">Đăng nhập</h2>
    <table class="auto-style1">
        <tr>
            <td colspan="2" style="text-align: center">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4" colspan="2" style="text-align: center">
                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/image/us.png" Width="100px" />
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
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Đăng nhập" OnClick="Button2_Click" />
            </td>
        </tr>
      
    </table>
    
</asp:Content>
