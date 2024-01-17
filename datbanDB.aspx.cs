using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class datbanDB : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        public String Maban;
        string makh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Đặt giá trị của TextBox1 thành giá trị được lưu trong Session
                TextBox1.Text = Session["Makh"].ToString();

                // Đổ dữ liệu món ăn vào GridView1
                LayDuLieuVaoGridViewMA();

                // Đổ dữ liệu bàn ăn vào GridView2
                LayDuLieuVaoGridViewB();

                // Đổ dữ liệu danh sách vào GridView2
                LayDuLieuVaoGridViewList();
            }
        }
        //----------dổ những bàn trống vào grid bàn ---------
        private void LayDuLieuVaoGridViewB()
        {
            UserDAO userDAO = new UserDAO();
            string tt = "Trong";
            gvB.DataSource = userDAO.GetAllTable(tt);
            gvB.DataBind();
        }
        //----------đổ  món ăn vào grid --------
        private void LayDuLieuVaoGridViewMA()
        {
            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllFood();
            GridView1.DataBind();
        }
      
        //show lên ban list các mon đã chọn
        private void LayDuLieuVaoGridViewList()
        {
            UserDAO userDAO = new UserDAO();
            GridView2.DataSource = userDAO.GetAllList(txt_mdb.Text);
            GridView2.DataBind();
        }
        //lấy dữ liệu bản bàn đổ lên form
        private void DoDuLieuLenFormTable(BAN table)
        {
            txt_mdb.Text = (table.MaBan + "DB").Trim();
            txt_mb.Text = table.MaBan;

        }
        //lấy dữ liệu bản thục đơn bàn đổ lên form
        private void DoDuLieuLenFormFood(THUCDON food)
        {
            txt_mma.Text = food.MaMonAn;

            txt_g.Text = food.Gia.ToString();

        }
        private void anhien(bool gt)
        {
            txt_mdb.Enabled = gt;
            txt_mb.Enabled = gt;
            txt_nd.Enabled = gt;
            gvB.Enabled = gt;
        }
        // kiem tra thu dung dinh dang ngay khong
        public bool ktra_ngay(string ngay)
        {
            DateTime date;

            if (DateTime.TryParseExact(ngay, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out date))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void gvB_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maban = gvB.SelectedRow.Cells[0].Text;

            UserDAO userDAO = new UserDAO();
            BAN table = userDAO.GetUserByTable(maban);
            if (table != null)
            {
                DoDuLieuLenFormTable(table);
            }
        }
        //lay du lieu form ban 
        public DATBAN LayDuLieuTuFormTable()
        {
            string madatban = txt_mdb.Text;
            string maban = txt_mb.Text;
            string makh = TextBox1.Text;

            DateTime ngaydat;
            string ngaydatString = txt_nd.Text;
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd/MM/yyyy";
            dtfi.DateSeparator = "/";
            if (DateTime.TryParseExact(ngaydatString, "d", dtfi, DateTimeStyles.None, out ngaydat))
            {
                DATBAN db = new DATBAN()
                {
                    MaDatBan = madatban,
                    MaBan = maban,
                    NgayDatBan = ngaydat,
                    MaKH = makh,
                };
                return db;
            }
            else
            {
                lbMessage.Text = "Bàn này không đúng định dạng ngày tháng";
                // Trả về một đối tượng rỗng nếu xảy ra lỗi
                return new DATBAN();
            }
        }
        protected void btn_b_Click(object sender, EventArgs e)
        {
           // buttonclick = true;
            if (txt_mb.Text == "" || txt_nd.Text == "")
            {
                lbMessage.Text = "vui long dien day du thong tin";
            }
            else if (ktra_ngay(txt_nd.Text) == true)
            {

                //lấy các giá trị từ giao diện
                DATBAN db = LayDuLieuTuFormTable();
                UserDAO userDAO = new UserDAO();
                bool exist = userDAO.CheckTable(db.MaDatBan);
                if (exist)
                {
                    lbMessage.Text = "Bàn này đã bị đặt trước rồi";
                }
                else
                {   
                    //doitrangthai
                    string mb = txt_mb.Text;
                    string tt = "full";
                    UserDAO user = new UserDAO();
                    bool rs = user.UpdateTT(mb, tt);
                    bool result = userDAO.InsertDB(db);
                    if (result && rs)
                    {
                        LayDuLieuVaoGridViewB();
                      
                        lbMessage.Text = "Đã đặt bàn thành công thành công ";
                      
                        anhien(false);
                    }
                    else
                    {
                        lbMessage.Text = "đặt bàn không  thành công";
                    }

                }

            }
            else
            {
                lbMessage.Text = "vui lòng điền đúng định dạng ngày";
            }

        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string mamonan = GridView1.SelectedRow.Cells[0].Text;
            UserDAO userDAO = new UserDAO();
            THUCDON food = userDAO.GetUserByFood(mamonan);
            if (food != null)
            {
                DoDuLieuLenFormFood(food);
                txt_mma.Enabled = false;
            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      

        protected void btn_huy_Click(object sender, EventArgs e)
        {
            string mb = txt_mb.Text;
            string tt = "Trong";
            UserDAO user = new UserDAO();
            bool rs = user.UpdateTT(mb, tt);
            bool result = user.DeleteDB(txt_mdb.Text);
            if (result && rs)
            {
                LayDuLieuVaoGridViewB();
                anhien(true);
               lbMessage.Text = "Hủy rồi đó vừa lòng chưa.hành hạ code 99 lần";
            }
            else
            {
                lbMessage.Text = "Hủy  Không thành công";
            }

        }
        public CHITIETDATBAN LayDuLieuTuForm()
        {
            if (txt_mdb.Text == "" || txt_mma.Text == "" || txt_sl.Text == "")
            {
                lbMessage.Text = "Vui lòng nhập đầy đủ thông tin";
            }
            string madatban = txt_mdb.Text;
            string mamonan = txt_mma.Text;
         
            int soluong = Int32.Parse(txt_sl.Text);
            int gia = Int32.Parse(txt_g.Text)* Int32.Parse(txt_sl.Text); 

            CHITIETDATBAN list = new CHITIETDATBAN()
            {
                MaDatBan = madatban,
                MaMonAn = mamonan,
                SoLuong = soluong,
                Gia = gia,


            };


            return list;
        }


        bool chonmon = false;
        protected void btn_themmon_Click(object sender, EventArgs e)
        {
            //lấy các giá trị từ giao diện
            if (txt_sl.Text == "")
            {
                lblMessage.Text = "vui lòng nhập số luọng";
            }
            else
            {
                CHITIETDATBAN list = LayDuLieuTuForm();
                UserDAO userDAO = new UserDAO();
                bool exist = userDAO.CheckList(list.MaMonAn, list.MaDatBan);

                // if (buttonclick)
                // {
                if (exist)
                {
                    lblMessage.Text = "Món ăn đã tồn tại";
                }
                else
                {
                    bool result = userDAO.InsertList(list);
                    if (result)
                    {
                        lblMessage.Text = "Đã Thêm món thành công";

                        LayDuLieuVaoGridViewList();
                        chonmon = true;
                    }
                    else
                        lbMessage.Text = "Có lỗi. Vui lòng thử lại.";
                }
               
            }

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string mama = GridView2.Rows[e.RowIndex].Cells[1].Text;

            UserDAO userDAO = new UserDAO();
            bool result = userDAO.DeleteList(mama);
            if (result)
            {


                GridView2.DataBind();
                LayDuLieuVaoGridViewList();
            }
            else { lbMessage.Text = "Xóa không thành công, vui lòng kiểm tra lại"; }
        }
        void reset()
        {
            txt_g.Text = "";
            txt_mdb.Text = "";
            txt_mb.Text = "";
            txt_nd.Text = "";
            txt_mma.Text = "";

        }
        protected void btn_chot_Click(object sender, EventArgs e)
        {
         
            string message = "thành công rồi!hẹn gặp bạn vào ngày " + txt_nd.Text;
            string script = "alert('"+ message + "'); window.location = 'datbanTTKH.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                reset();
            anhien(true);

        }
       
    }

}       
