<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Gioithieu.aspx.cs" Inherits="QLNH.Gioithieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style1">
        <tr>
            <td colspan="4" style="text-align :center"><h3>Giới thiệu</h3></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Image ID="Image1" runat="server" Height="304px" ImageAlign="Left" ImageUrl="~/image/gu-bistronomy-966901.jpg" Width="537px" />
            </td>
            <td colspan="2">
                <p style="font-weight: bold; font-size: 20px"> CN -Thương hiệu Hải Sản từ 1957</p>
                 <p> Có mặt hơn 60 năm tại 20 quốc gia khác nhau</p> 
                <p> Đạt chứng nhận Thai Select dành cho các nhà hàng phục vụ chuẩn hương vị Việt tại nước ngoài</p> 
                <p> Không gian hiện đại, phù hợp tổ chức tiệc liên hoan cho 80 người</p>
                 <p> Menu hơn 100 món từ khai vị, món chính, lẩu tới các món tráng miệng</p>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align :center">
                <h3>Các món phổ biến</h3></td>
        </tr>
        <tr>
            <td style="width: 15%">
                <asp:Image ID="Image2" runat="server" Height="120px" ImageUrl="~/image/cahoi.png" Width="120px" />
            </td>
            <td style="width: 35%">Cá Hồi tắm mắm Thái</td>
            <td style="width: 15%">
                <asp:Image ID="Image5" runat="server" Height="120px" ImageUrl="~/image/salmon-g9b47f0305_640.jpg" Width="120px" />
            </td>
            <td>Cá hồi nướng mật ong</td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image3" runat="server" Height="120px" ImageUrl="~/image/trung.jpg" Width="120px" />
            </td>
            <td>Trứng cá hồi 3 tầng.</td>
            <td>
                <asp:Image ID="Image6" runat="server" Height="120px" ImageUrl="~/image/pad-thai-g6eaca7ff1_640.jpg" Width="120px" />
            </td>
            <td>Mì xào hải sản</td>
        </tr>
        <tr>
            <td>
                <asp:Image ID="Image4" runat="server" Height="120px" ImageUrl="~/image/seafood-g30b0d2bfe_640.jpg" Width="120px" />
            </td>
            <td>Tôm hùm hấp rượu vang trắng</td>
            <td>
                <asp:Image ID="Image7" runat="server" Height="120px" ImageUrl="~/image/bo.jpg" Width="120px" />
            </td>
            <td>Bò áp chảo phô mai</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
