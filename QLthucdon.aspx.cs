using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class QLthucdon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LayDuLieuVaoGridView();

            }
        }
        public THUCDON LayDuLieuTuForm()
        {

            string mamonan = txt_mma.Text;
            string tenmonan = txt_tma.Text;
            int gia = Int32.Parse(txt_g.Text);
            string phanloai = ddl_pl.SelectedValue.ToString();
            string extension = System.IO.Path.GetExtension(fupAvatar.FileName);
            string fileName = mamonan + extension;

            THUCDON food = new THUCDON()
            {
                MaMonAn = mamonan,
                TenMonAn = tenmonan,
                Gia = gia,
                MaPhanLoai = phanloai,
                Hinh = fileName
            };
            return food;
        }
        private void LayDuLieuVaoGridView()
        {
            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllFood();
            GridView1.DataBind();
        }
        private void DoDuLieuLenForm(THUCDON food)
        {
            txt_mma.Text = food.MaMonAn;
            txt_tma.Text = food.TenMonAn;
            txt_g.Text = food.Gia.ToString();

            ddl_pl.SelectedValue = food.MaPhanLoai;
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            //lấy các giá trị từ giao diện
            THUCDON food = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool exist = userDAO.CheckFood(food.MaMonAn);
            UploadAvatar(food.Hinh);

            if (exist)
            {
                lbMessage.Text = "Món ăn  đã tồn tại";
            }
            else
            {
                bool result = userDAO.InsertFood(food);
                if (result)
                {
                    lbMessage.Text = "Đã Thêm món thành công";

                    LayDuLieuVaoGridView();
                }
                else
                    lbMessage.Text = "Có lỗi. Vui lòng thử lại.";
            }
        }
        public bool UploadAvatar(string filename)
        {
            String filePath = "~/image/" + filename;
            if (fupAvatar.HasFile)
            {
                fupAvatar.SaveAs(Server.MapPath(filePath));
                return true;
            }
            else
                return false;
        }
        protected void btn_sua_Click(object sender, EventArgs e)
        {
            THUCDON food = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool result = userDAO.UpdateFood(food);
            UploadAvatar(food.Hinh);
            if (result)
            {
                lbMessage.Text = "Cập Nhật thành công món ăn có mã : " + food.MaMonAn;
                LayDuLieuVaoGridView();
                //DoDuLieuLenForm(user);
                // LayDuLieuTuForm();


            }
            else
            {
                lbMessage.Text = "Cập Nhật Không thành công";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mamonan = GridView1.SelectedRow.Cells[0].Text;
            UserDAO userDAO = new UserDAO();
            THUCDON food = userDAO.GetUserByFood(mamonan);
            if (food != null)
            {
                DoDuLieuLenForm(food);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mama = GridView1.Rows[e.RowIndex].Cells[0].Text;

            UserDAO userDAO = new UserDAO();
            bool result = userDAO.DeleteFood(mama);
            if (result)
            {
                lbMessage.Text = "Đã xóa thành công người dùng có mã: " + mama;

                GridView1.DataBind();
                LayDuLieuVaoGridView();
            }
            else { lbMessage.Text = "Xóa không thành công, vui lòng kiểm tra lại"; }
        }
     
        
        protected void ddl_sx_SelectedIndexChanged(object sender, EventArgs e)
        {

            string selectedValue = ddl_sx.SelectedValue.ToString();

            if (selectedValue == "") // Hiển thị tất cả món ăn nếu chọn "Tất cả" trong DropDownList
            {
                LayDuLieuVaoGridView(); // Gọi phương thức BindGridView để hiển thị tất cả món ăn
            }
            else // Hiển thị món ăn theo phân loại được chọn trong DropDownList
            {
                UserDAO userDAO = new UserDAO();
                List<THUCDON> filteredResults = userDAO.FilterFoodByCategory(selectedValue); // Gọi phương thức FilterFoodByCategory để lọc món ăn theo phân loại

                GridView1.DataSource = filteredResults;
                GridView1.DataBind();
            }
        }
    }
    
}