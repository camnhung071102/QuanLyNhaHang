using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class ThongKe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LayDuLieuVaoGridViewTKBD();
        }
        private void LayDuLieuVaoGridViewTKBD()
        {
            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllTableTK();
            GridView1.DataBind();
        }
        private void LayDuLieuVaoGridViewTKTC()

        {
            DateTime tn;
            DateTime dn;
            string tnString = txt_tn.Text;
            string dnString = txt_dn.Text;
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd/MM/yyyy";
            dtfi.DateSeparator = "/";
            if (DateTime.TryParseExact(tnString, "d", dtfi, DateTimeStyles.None, out tn) && DateTime.TryParseExact(dnString, "d", dtfi, DateTimeStyles.None, out dn))
            {
                // Chuyển đổi ngày tháng thành công
                // Thực hiện các thao tác khác
                UserDAO userDAO = new UserDAO();
                GridView1.DataSource = userDAO.GetAllTableTKTC(tn, dn);
                GridView1.DataBind();
            }
            else
            {
                // Giá trị ngày tháng không hợp lệ
                // Hiển thị thông báo lỗi hoặc thực hiện các xử lý khác tùy thuộc vào yêu cầu của bạn
            }
            //DateTime tn = DateTime.Parse(txt_tn.Text);
          //  DateTime dn = DateTime.Parse(txt_dn.Text);

           
        }
        private void LayDuLieuVaoGridViewTKMA()

        {
            DateTime tn;
            DateTime dn;
            string tnString = txt_tn.Text;
            string dnString = txt_dn.Text;
            string mama = ddl_ma.SelectedValue.ToString();
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd/MM/yyyy";
            dtfi.DateSeparator = "/";
            if (DateTime.TryParseExact(tnString, "d", dtfi, DateTimeStyles.None, out tn) && DateTime.TryParseExact(dnString, "d", dtfi, DateTimeStyles.None, out dn))
            {
                // Chuyển đổi ngày tháng thành công
                // Thực hiện các thao tác khác
                UserDAO userDAO = new UserDAO();
                GridView2.DataSource = userDAO.GetAllTableTKMA(tn, dn, mama);
                GridView2.DataBind();
            }
            else
            {
                // Giá trị ngày tháng không hợp lệ
                // Hiển thị thông báo lỗi hoặc thực hiện các xử lý khác tùy thuộc vào yêu cầu của bạn
            }
            //DateTime tn = DateTime.Parse(txt_tn.Text);
            //  DateTime dn = DateTime.Parse(txt_dn.Text);


        }
        protected void btn_tk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_dn.Text) || string.IsNullOrEmpty(txt_tn.Text))
            {
                lb.Text = "Vui lòng nhập ngày cần thống kê";
                return;
            }

            DateTime tn, dn;
            if (!DateTime.TryParse(txt_tn.Text, out tn) || !DateTime.TryParse(txt_dn.Text, out dn))
            {
                lb.Text = "Ngày không hợp lệ";
                return;
            }

            if (dn < tn)
            {
                lb.Text = "Vui lòng nhập ngày sau lớn hơn ngày trước";
                return;
            }

            if (rbt_tc.Checked)
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
                LayDuLieuVaoGridViewTKTC();
                float tongtien = 0;

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    string gia = GridView1.Rows[i].Cells[2].Text;
                    tongtien += float.Parse(gia);
                }

                txt_dt.Text = tongtien.ToString();
            }
            else if (rbt_ma.Checked)
            {
                GridView1.Visible = false;
                GridView2.Visible = true;
                LayDuLieuVaoGridViewTKMA();
                float tongtien = 0;

                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    string gia = GridView2.Rows[i].Cells[4].Text;
                    tongtien += float.Parse(gia);
                }

                txt_dt.Text = tongtien.ToString();
            }
            else
            {
                lb.Text = "Vui lòng chọn loại thống kê";
            }
        }
    }
}
    
