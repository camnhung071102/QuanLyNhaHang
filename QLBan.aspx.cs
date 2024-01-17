using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace QLNH
{
    public partial class QLBan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LayDuLieuVaoGridView();
        }
        private void LayDuLieuVaoGridView()
        {
            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllTableHD();
            GridView1.DataBind();
        }
        public BAN LayDuLieuTuForm()
        {

            string mamonan = txt_mb.Text;
            string mota = txt_mt.Text;
          
            string trangthai = DropDownList1.SelectedValue.ToString();
            
            BAN b = new BAN()
            {
                MaBan = mamonan,
                MoTa = mota,
                TrangThai = trangthai,
                
            };
            return b;
        }
        private void DoDuLieuLenForm(BAN  b)
        {
            txt_mb.Text = b.MaBan;
            txt_mt.Text = b.MoTa;
            

            DropDownList1.SelectedValue = b.TrangThai;
        }
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maban = GridView1.SelectedRow.Cells[0].Text;
            UserDAO userDAO = new UserDAO();
            BAN B = userDAO.GetUserByTable(maban);
            if (B != null)
            {
                DoDuLieuLenForm(B);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maban = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string tt = GridView1.Rows[e.RowIndex].Cells[2].Text;
            if (tt == "full")
            {
                lbMessage.Text = " Bàn này đã bị đặt.không thể xóa ";
            } 
            else
            {
                UserDAO userDAO = new UserDAO();
                bool result = userDAO.DeleteTable(maban);
                if (result)
                {
                    lbMessage.Text = "Đã xóa thành công người dùng có mã: " + maban;

                    GridView1.DataBind();
                    LayDuLieuVaoGridView();
                }
                else { lbMessage.Text = "Xóa không thành công, vui lòng kiểm tra lại"; }
            }
        }
        protected void btn_t_Click(object sender, EventArgs e)
        {
            //lấy các giá trị từ giao diện
            BAN b = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool exist = userDAO.CheckTableB(b.MaBan);
          

            if (exist)
            {
                lbMessage.Text = "Bàn  đã tồn tại";
            }
            else
            {
                bool result = userDAO.InsertTable(b);
                if (result)
                {
                    lbMessage.Text = "Đã Thêm món thành công";

                    LayDuLieuVaoGridView();
                }
                else
                    lbMessage.Text = "Có lỗi. Vui lòng thử lại.";
            }
        }
      /*  protected void btn_s_Click(object sender, EventArgs e)
        {
            BAN b = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool result = userDAO.UpdateTable(b);
           if(result)
            {
                lbMessage.Text = "Cập Nhật thành công bàn ăn có mã : " + b.MaBan;
                LayDuLieuVaoGridView();
                //DoDuLieuLenForm(user);
                // LayDuLieuTuForm();


            }
            else
            {
                lbMessage.Text = "Cập Nhật Không thành công";
            }
        }*/
    }
}