using System;
using System.Collections.Generic;
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
        private void LayDuLieuVaoGridViewTK()

        {
            DateTime tn = DateTime.Parse(txt_tn.Text);
            DateTime dn = DateTime.Parse(txt_dn.Text);

            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllTableTKW(tn,dn);
            GridView1.DataBind();
        }
        protected void btn_tk_Click(object sender, EventArgs e)
        {
            DateTime tn = DateTime.Parse(txt_tn.Text);
            DateTime dn = DateTime.Parse(txt_dn.Text);

            if (dn < tn)
            {
                lb.Text = "vui lòng nhập ngày sau lớn hơn ngày trước";
            }
            else
            {
                LayDuLieuVaoGridViewTK();
                float tongtien = 0;

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    string gia = GridView1.Rows[i].Cells[3].Text;
                    tongtien += float.Parse(gia);
                    txt_dt.Text = tongtien.ToString();
                }
            }
        }
    }
}