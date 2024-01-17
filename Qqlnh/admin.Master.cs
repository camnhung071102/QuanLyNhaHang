using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Position"].ToString() == "NhanVien")
            {
                // Ẩn liên kết quản lý nhân viên
                HyperLink2.Visible = false;


            }
            else if (Session["Position"].ToString() == "Admin")
            {

            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Xóa toàn bộ dữ liệu Session để đăng xuất người dùng
            Session.Clear();
            Session.Abandon();

            // Chuyển hướng người dùng đến trang đăng nhập
            Response.Redirect("dangnhap.aspx");
        }
    }
}