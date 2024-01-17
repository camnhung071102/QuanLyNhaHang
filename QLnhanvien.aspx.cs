using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI.WebControls;

namespace QLNH
{
    public partial class QLnhanvien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                LayDuLieuVaoGridView();

            }

        }
        public User LayDuLieuTuForm()
        {


            string manv= txt_mnv.Text;
            string tennv = txt_tnv.Text;
            string tendn = txt_tdn.Text;
            string vitri =ddlVitri.SelectedValue.ToString();
            string matkhau = txt_mk.Text;

            string extension = System.IO.Path.GetExtension(fupAvatar.FileName);
            string fileName = manv + extension;

            User user = new User()
            {
                MaNV = manv,
                HoTen = tennv,
                ViTri= vitri,
                TenDN = tendn,
                MatKhau = matkhau,
                Hinh = fileName
            };
            return user;
        }
        private void LayDuLieuVaoGridView()
        {
            UserDAO userDAO = new UserDAO();
            GridView1.DataSource = userDAO.GetAllNV();
            GridView1.DataBind();
        }
        private void DoDuLieuLenForm(User user)
        {
            txt_mnv.Text = user.MaNV;
            txt_tnv.Text = user.HoTen;
            txt_tdn.Text = user.TenDN;
            txt_mk.Text = user.MatKhau;

            ddlVitri.SelectedValue = user.ViTri;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string username = GridView1.SelectedRow.Cells[0].Text;
            UserDAO userDAO = new UserDAO();
            User user = userDAO.GetUserByNV(username);
            if (user != null)
            {
                DoDuLieuLenForm(user);
            }
        }

        protected void btn_them_Click(object sender, EventArgs e)
        {
            //lấy các giá trị từ giao diện
            User user = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool exist = userDAO.CheckUser(user.MaNV);
            UploadAvatar(user.Hinh);

            if (exist)
            {
                lbMessage.Text = "Mã nhân viên  đã tồn tại";
            }
            else
            {
                bool result = userDAO.InsertNV(user);
                if (result)
                {
                    lbMessage.Text = "Đã thêm  thành công";

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
            User user = LayDuLieuTuForm();
            UserDAO userDAO = new UserDAO();
            bool result = userDAO.UpdateNV(user);
            UploadAvatar(user.Hinh);
            if (result)
            {
                lbMessage.Text = "Cập Nhật thành công mã nhân viên : " + user.MaNV;
                LayDuLieuVaoGridView();
                //DoDuLieuLenForm(user);
                // LayDuLieuTuForm();


            }
            else
            {
                lbMessage.Text = "Cập Nhật Không thành công";
            }
        }

        

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string manv = GridView1.Rows[e.RowIndex].Cells[0].Text;

            UserDAO userDAO = new UserDAO();
            bool result = userDAO.DeleteNV(manv);
            if (result)
            {
                lbMessage.Text = "Đã xóa thành công người dùng có mã: " + manv;

                GridView1.DataBind();
                LayDuLieuVaoGridView();
            }
            else { lbMessage.Text = "Xóa không thành công, vui lòng kiểm tra lại"; }
        }
    }
    }
    
