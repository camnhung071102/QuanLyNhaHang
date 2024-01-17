using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class datbanTTKH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public KhachHang LayDuLieuTuForm()
        {
            string tenkh = txt_ht.Text;
            int sdt;
            string makh = Regex.Replace(tenkh, "[^0-9a-zA-Z]+", "") + Guid.NewGuid().ToString(); ;

            if (!Int32.TryParse(txt_sdt.Text, out sdt))
            {
                
            }

            KhachHang kh = new KhachHang()
            {
                MaKH = makh,
                HoTen = tenkh,
                SDT = sdt,

            };
            return kh;

        }

        protected void btn_tieptheo_Click(object sender, EventArgs e)
        {
            KhachHang kh = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            if (txt_ht.Text == "" || txt_sdt.Text == "")
            {
                lblMessage.Text = "Vui lòng nhập đầy đủ thông tin";
                txt_ht.Focus();
            }
            else
            {
                userDAO.InsertKH(kh);
                string tenkh = txt_ht.Text;

                string makh = Regex.Replace(tenkh.Substring(0, Math.Min(tenkh.Length, 10)), "[^0-9a-zA-Z]+", "") + Guid.NewGuid().ToString();
                Session["Makh"] = makh;


                string url = "datbanDB.aspx?makh=" + makh;
                Response.Redirect(url);


            }



        }
    }
}