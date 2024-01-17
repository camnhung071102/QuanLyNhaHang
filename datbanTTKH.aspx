<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="datbanTTKH.aspx.cs" Inherits="QLNH.datbanTTKH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   
       

.auto-style1 {
  border-collapse: collapse;
  margin: auto;
  width: 60%;
  background-color: #f2f2f2;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
}

.auto-style2, .auto-style5 {
  height: 50px;
}

.auto-style3 {
  width: 20%;
}

.auto-style4 {
  width: 40%;
}

.auto-style6, .auto-style7 {
  font-size: medium;
  padding: 10px;
  border-radius: 5px;
  border: none;
  box-sizing: border-box;
  display: block;
  width: 100%;
  margin-bottom: 20px;
  background-color: #f2f2f2;
}

.auto-style7 {
  font-style: italic;
  font-size: 14px;
  color: red;
}

.btn_tieptheo {
  background-color: #4CAF50;
  color: white;
  border: none;
  cursor: pointer;
  padding: 10px;
  font-size: medium;
  border-radius: 5px;
  transition-duration:
"transition-duration: 0.4s;
}

.btn_tieptheo:hover {
background-color: white;
color: #4CAF50;
border: 2px solid #4CAF50;
}

@media screen and (max-width: 768px) {
.auto-style1 {
width: 90%;
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
     <h3 style="text-align:center">Thông tin khách hàng</h3>
    <br />
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
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
                    <asp:Button ID="btn_tieptheo" runat="server" Text="Tiếp theo" OnClick="btn_tieptheo_Click" Style="height: 29px" />
                </td>
                <td class="auto-style5"></td>
            </tr>
        </table>
   
</asp:Content>
