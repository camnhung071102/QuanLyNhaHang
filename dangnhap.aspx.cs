using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Code xử lý khi trang được tải lên
        }
        public string maNhanVien;
        // Hàm lấy dữ liệu từ form và tạo đối tượng User
        public User LayDuLieuTuForm()
        {
            string tendn = txt_tdn.Text;
            string matkhau = txt_mk.Text;
            string vitri = ddl.SelectedValue.ToString();

            User user = new User()
            {
                TenDN = tendn,
                MatKhau = matkhau,
                ViTri = vitri,
            };

            return user;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Lấy dữ liệu từ form
            User TK = LayDuLieuTuForm();

            // Kiểm tra tài khoản và mật khẩu
            UserDAO userDAO = new UserDAO();
            bool exist = userDAO.CheckUserLG(TK.TenDN, TK.MatKhau, TK.ViTri);

            if (txt_tdn.Text == "" || txt_mk.Text == "")
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin";
                txt_tdn.Focus();
            }
            else if (exist)
            {
                Session["manv"] = userDAO.GetMaNhanVien(TK.TenDN, TK.MatKhau);
                // tạo session để phân quyền
                Session["Position"] = ddl.SelectedValue;
                Response.Redirect("QLthucdon.aspx");
            }
            else
            {
                lblMessage.Text = "Tài khoản hoặc mật khẩu không chính xác. Vui lòng thử lại.";
            }
        }
    }
}