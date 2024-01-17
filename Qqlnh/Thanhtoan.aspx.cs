using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class Thanhtoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LayDuLieuVaoGridViewB();
            LayDuLieuVaoGridViewList();

        }

        protected void SqlDataSourceBan_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        private void LayDuLieuVaoGridViewB()
        {
            UserDAO userDAO = new UserDAO();

            gvB.DataSource = userDAO.GetAllTableHD();
            gvB.DataBind();
        }
        string madatban;

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maban = gvB.SelectedRow.Cells[0].Text;
            lbmb.Text= maban;

            madatban = maban + "DB";

            LayDuLieuVaoGridViewList();
            float tongtien = 0;

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                string gia = GridView2.Rows[i].Cells[3].Text;
                tongtien += float.Parse(gia);
                txt_tt.Text = tongtien.ToString();
            }
        }
        private void LayDuLieuVaoGridViewList()

        {

            UserDAO userDAO = new UserDAO();
            GridView2.DataSource = userDAO.GetAllList(madatban);
            GridView2.DataBind();
        }
        public CHITIETDATBAN LayDuLieuTuForm()
        {

            string mma = ddlma.SelectedValue;
            int soluong = Int32.Parse(TextBox2.Text);
            int gia = Int32.Parse(ddlgia.SelectedValue) * soluong;
            string maban = gvB.SelectedRow.Cells[0].Text;
            madatban = maban + "DB";

            CHITIETDATBAN list = new CHITIETDATBAN();
            {
                list.MaDatBan = madatban;
                list.MaMonAn = mma;
                list.SoLuong = soluong;
                list.Gia = gia;

            };


            return list;
        }



        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                lbMessage.Text = " vui lòng điền số lượng";
            }
            else
            {
                CHITIETDATBAN list = LayDuLieuTuForm();

                UserDAO userDAO = new UserDAO();

                bool result = userDAO.InsertList(list);
                if (result)
                {
                    lbMessage.Text = "Đã Thêm món thành công";

                    LayDuLieuVaoGridViewList();

                }


            }

        }
        string mahoadon;
        public HOADON LayDuLieuTuFormHD()
        {
            string maban = gvB.SelectedRow.Cells[0].Text;
            madatban = maban + "DB";
            mahoadon = madatban + "HD";
            string mnv = txt_mnv.Text;

            int tongtien = Int32.Parse(txt_tt.Text);
            DateTime ngay = DateTime.Parse(txt_nlhd.Text);


            HOADON hd = new HOADON();
            {
                hd.MaHoaDon = mahoadon;
                hd.MaDatBan = madatban;
                hd.MaNV = mnv;
                hd.TongTien = tongtien;
                hd.NgayLapHD = ngay;

            };


            return hd;
        }
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

        protected void btn_tt_Click(object sender, EventArgs e)

        {
            UserDAO userDAO = new UserDAO();
            string maban = gvB.SelectedRow.Cells[0].Text;
            madatban = maban + "DB";
            //THÊM VAO BAN HOA DON
            if (txt_mnv.Text == "" || txt_nlhd.Text == "")
            {
                lbMessage.Text = "vui long dien day du thong tin";
            }
            else if (ktra_ngay(txt_nlhd.Text) == true)
            {

                //lấy các giá trị từ giao diện
                HOADON hd = LayDuLieuTuFormHD();

                bool exist = userDAO.CheckUser(txt_mnv.Text);


                if (exist)

                {

                    string tt = "Trong";

                    bool rs = userDAO.UpdateTT(maban, tt);

                    bool result = userDAO.InsertHD(hd);
                    if (result && rs)
                    {

                        lbMessage.Text = "Thanh toán thành công";
                        LayDuLieuVaoGridViewB();
                        //---------------XÓA BẢN CHI TIẾT DDAWJT BÀN--------

                        bool xoact = userDAO.DeleteHD(madatban);
                        if (xoact)
                        {


                            Message.Text = "Xóa thành công bản  chi tiết đặt bàn";
                            LayDuLieuVaoGridViewList();
                        }
                        else
                        {
                            Message.Text = "xóa không thành côngg CTDB";
                        }
                        //--------------XÓA BẢN DẶT BÀN------------


                        bool xoadb = userDAO.DeleteDB(madatban);
                        if (xoadb)
                        {


                            lblMessage.Text = "Xóa thành công bản đặt bàn";
                        }
                        else
                        {
                            lblMessage.Text = "xóa không thành côngg";
                        }


                    }
                    else
                    {
                        lbMessage.Text = "Thanh Toán  Không thành công";
                    }


                }
                else
                {
                    lbMessage.Text = "Mã Nhân viên không tồn tại";
                    return;
                }

            }
            else
            {
                lbMessage.Text = "vui long dien đúng định dạng ngày";
            }

        }
    }
}
