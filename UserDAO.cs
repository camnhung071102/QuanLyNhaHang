using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace QLNH
{
    public class UserDAO
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        //---------------------------------------NHANVIEN-------------------------------------//

        //liem tra thu manv co trung khong

        public bool CheckUser(string maNV)
        {
            string sql = @"SELECT COUNT (*) FROM NHANVIEN WHERE MaNV = @mnv";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@mnv", maNV);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }
        public bool CheckUserLG(string tendn,string matkhau,string vitri)
        {
            string sql = @"SELECT COUNT (*) FROM NHANVIEN WHERE TenDN = @tendn AND MatKhau = @matkhau AND ViTri = @vitri ";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@TenDN", tendn);
                command.Parameters.AddWithValue("@MatKhau", matkhau);
                command.Parameters.AddWithValue("@ViTri", vitri);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }


        //Thêm nhân viên

        public bool InsertNV(User user)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO NHANVIEN(Manv,HoTen,ViTri,TenDN,MatKhau,Hinh) VALUES(@manv, @tennv, @vitri, @tendn, @matkhau, @hinh)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@manv", user.MaNV);
                cmd.Parameters.AddWithValue("@tennv", user.HoTen);
                cmd.Parameters.AddWithValue("@vitri", user.ViTri);
                cmd.Parameters.AddWithValue("@tendn", user.TenDN);
                cmd.Parameters.AddWithValue("@matkhau", user.MatKhau);
                cmd.Parameters.AddWithValue("@hinh", user.Hinh);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }

        // Xóa nhân viên button

        public bool DeleteNV(string manv)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from NHANVIEN  where manv = '" + manv + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }
        
        // Sửa nhân viên 

        public bool UpdateNV(User user)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE NHANVIEN SET 
                
                HoTen=@tennv,
                ViTri=@vitri,
                TenDN=@tendn,
                MatKhau=@matkhau,
                Hinh=@hinh WHERE MaNV=@manv";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@manv", user.MaNV);
                cmd.Parameters.AddWithValue("@tennv", user.HoTen);
                cmd.Parameters.AddWithValue("@vitri", user.ViTri);
                cmd.Parameters.AddWithValue("@tendn", user.TenDN);
                cmd.Parameters.AddWithValue("@matkhau", user.MatKhau);
                cmd.Parameters.AddWithValue("@hinh", user.Hinh);

                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result >= 1)
                {
                    return true;
                }
            }
            return false;
        }
        
        //lay du lieu de bo vao grid view

        public DataTable GetAllNV()
        {
            string sql = @"SELECT * FROM NHANVIEN";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        // SELECT

        public User GetUserByNV(string maNV)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"SELECT *FROM NHANVIEN WHERE MaNV =@manv";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@manv", maNV);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    User user = new User
                    {
                        MaNV = (string)reader["MaNV"],
                        HoTen = (string)reader["Hoten"],
                        ViTri = (string)reader["ViTri"],
                        TenDN = (string)reader["TenDN"],
                        MatKhau = (string)reader["MatKhau"],
                        Hinh = (string)reader["Hinh"],
                    };
                    return user;
                }
            }
            return null;
        }
        //--------------------------------THUC DON-----------------------------
          // lọc món ăn
        public List<THUCDON> FilterFoodByCategory(string category)
        {
            UserDAO userDAO = new UserDAO();
            DataTable dt = userDAO.GetAllFood();

            DataView dv = new DataView(dt);
            dv.RowFilter = "MaPhanLoai = '" + category + "'";

            List<THUCDON> filteredResults = new List<THUCDON>();

            foreach (DataRowView drv in dv)
            {
                THUCDON food = new THUCDON
                {
                    MaMonAn = drv["MaMonAn"] == DBNull.Value ? null : (string)drv["MaMonAn"],
                    TenMonAn = drv["TenMonAn"] == DBNull.Value ? null : (string)drv["TenMonAn"],
                    MaPhanLoai = drv["MaPhanLoai"] == DBNull.Value ? null : (string)drv["MaPhanLoai"],
                    Gia = (int)drv["Gia"],
                    Hinh = drv["Hinh"] == DBNull.Value ? null : (string)drv["Hinh"],
                };

                filteredResults.Add(food);
            }

            return filteredResults;
        }

        //kiem tra thuc don co trung khong

        public bool CheckFood(string maMA)
        {
            string sql = @"SELECT COUNT (*) FROM THUCDON WHERE MaMonAn = @mma";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@mma",maMA);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }


        //Thêm món ăn

        public bool InsertFood(THUCDON food)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO THUCDON(MaMonAn,TenMonAn,MaPhanLoai,Gia,Hinh) VALUES(@mamonan, @tenmonan, @maphanloai, @gia, @hinh)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@mamonan", food.MaMonAn);
                cmd.Parameters.AddWithValue("@tenmonan", food.TenMonAn);
                cmd.Parameters.AddWithValue("@maphanloai", food.MaPhanLoai);
                cmd.Parameters.AddWithValue("@gia", food.Gia);
                cmd.Parameters.AddWithValue("@hinh", food.Hinh);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }

        // Xóa mon an

        public bool DeleteFood(string mama)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from THUCDON  where MaMonAn = '" + mama + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }

        // Sửa mon an

        public bool UpdateFood(THUCDON food)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE THUCDON SET 
                MaMonAn=@mamonan,
                TenMonAn=@tenmonan,
                MaPhanLoai=@maphanloai,
                Gia=@gia,
                Hinh=@hinh WHERE MaMonAn = @mamonan";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@mamonan", food.MaMonAn);
                cmd.Parameters.AddWithValue("@tenmonan", food.TenMonAn);
                cmd.Parameters.AddWithValue("@maphanloai", food.MaPhanLoai);
                cmd.Parameters.AddWithValue("@gia", food.Gia);
                cmd.Parameters.AddWithValue("@hinh", food.Hinh);

                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result >= 1)
                {
                    return true;
                }
            }
            return false;
        }

        //lay du lieu de bo vao grid view

        public DataTable GetAllFood()
        {
            string sql = @"SELECT * FROM THUCDON";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        // SELECT

        public THUCDON GetUserByFood(string maMA)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"SELECT *FROM THUCDON WHERE MaMonAn =@mama";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@mama", maMA);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    THUCDON food = new THUCDON
                    {
                        MaMonAn = reader["MaMonAn"] == DBNull.Value ? null : (string)reader["MaMonAn"],
                        TenMonAn = reader["TenMonAn"] == DBNull.Value ? null : (string)reader["TenMonAn"],
                        MaPhanLoai = reader["MaPhanLoai"] == DBNull.Value ? null : (string)reader["MaPhanLoai"],
                        Gia = (int)reader["Gia"],
                        Hinh = reader["Hinh"] == DBNull.Value ? null : (string)reader["Hinh"],
                    };
                    return food;
                }
            }
            return null;
        }

        //------------------------------------------------DANGNHAP---------------------------------------------------//
        public bool CheckTK(string tdn,string mk)
        {
            string sql = @"SELECT COUNT (*) FROM NHANVIEN WHERE TenDN = @tendn AND MatKhau=@matkhau";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@tendn", tdn);
                command.Parameters.AddWithValue("@matkhau", mk);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }
        public string GetMaNhanVien(string tendn, string matkhau)
        {
            string maNV = "";

            string sql = @"SELECT MaNV FROM NHANVIEN WHERE TenDN = @tendn AND MatKhau = @matkhau";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@TenDN", tendn);
                command.Parameters.AddWithValue("@MatKhau", matkhau);


                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    maNV = reader.GetString(0);
                }
            }

            return maNV;
        }

        //------------------------------------------------KHACHHANG---------------------------------------------------//
        public bool InsertKH(KhachHang kh)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO KHACHHANG(MaKH,HoTen,SDT) VALUES(@makh,@hoten,@sdt)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@makh", kh.MaKH);
                cmd.Parameters.AddWithValue("@hoten", kh.HoTen);
                cmd.Parameters.AddWithValue("@sdt", kh.SDT);
               
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }
        //---------------------------------------------DATBAN---------------------------//
        public bool CheckTable(string maDB)
        {
            string sql = @"SELECT COUNT (*) FROM DATBAN WHERE MaDatBan = @madatban";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@madatban", maDB);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }
        public bool UpdateTT(string  mb,string tt)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE BAN SET 
                TrangThai=@trangthai
                WHERE MaBan = @maban";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@maban", mb);

                cmd.Parameters.AddWithValue("@trangthai",tt);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result >= 1)
                {
                    return true;
                }
            }
            return false;
        }
        public bool DeleteDB(string maDB)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from DATBAN  where MaDatBan = '" + maDB + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }
        public DataTable GetAllTable(string tt)
        {
            
            string sql = @"SELECT * FROM BAN WHERE TrangThai='"+tt+"'";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable GetAllTableHD()
        {

            string sql = @"SELECT * FROM BAN  ";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        //select bản bàn nè
        public BAN GetUserByTable(string maB)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"SELECT *FROM BAN WHERE MaBan=@maban";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@maban", maB);

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    BAN table = new BAN();  
                    {
                        table.MaBan = reader["MaBan"] == DBNull.Value ? null : (string)reader["MaBan"];
                        table.MoTa = reader["MoTa"] == DBNull.Value ? null : (string)reader["MoTa"];
                        table.TrangThai = reader["TrangThai"] == DBNull.Value ? null : (string)reader["TrangThai"];

                    };
                    return table;
                }
            }
            return null;
        }
        public bool InsertDB(DATBAN db)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO DATBAN(MaDatBan,MaBan,MaKH,NgayDatBan) VALUES(@madatban,@maban,@makh,@ngaydat)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@madatban", db.MaDatBan);
                cmd.Parameters.AddWithValue("@maban", db.MaBan);
                cmd.Parameters.AddWithValue("@makh", db.MaKH);
                cmd.Parameters.AddWithValue("@ngaydat", db.NgayDatBan);
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }
        //---------------------------------------CHITIETDATBAN----------------------
        //them du lieu vao ban chi tiet hoa don
        public bool InsertList(CHITIETDATBAN list)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO CHITIETDATBAN(MaDatBan,MaMonAn,SoLuong,Gia) VALUES(@madatban,@mamonan, @soluong, @gia)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@madatban", list.MaDatBan);
                cmd.Parameters.AddWithValue("@mamonan",list.MaMonAn);
             
                cmd.Parameters.AddWithValue("@soluong", list.SoLuong);
                cmd.Parameters.AddWithValue("@gia", list.Gia);
               
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }
        //xóa du lieu trong ban chi tiet hoa dơn
        public bool DeleteList(string mama)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from CHITIETDATBAN  where MaMonAn = '" + mama + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }
        //lấy dữ liệu từ bản CHI TIẾT ĐẶT BÀN RA
        public DataTable GetAllList(string madatban)
        {

            string sql = @"SELECT * FROM CHITIETDATBAN WHERE MaDatBan='"+madatban+"' ";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        //kiem tra thuc don co trung khong

        public bool CheckList(string maMA,string maDB)
        {
            string sql = @"SELECT COUNT (*) FROM CHITIETDATBAN WHERE MaMonAn = @mma and MaDatBan=@madatban" ;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@mma", maMA);
                command.Parameters.AddWithValue("@madatban", maDB);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }
        //--------------------------------------THANHTOAN-------------------------------




        //XOA CHI TIET HOA DON
        public bool DeleteHD(string maDB)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from CHITIETDATBAN  where MaDatBan = '" + maDB + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }
        //THEM VAO BNAN HOA DON
        public bool InsertHD(HOADON hd)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO HOADON(MaHoaDon,MaDatBan,MaNV,TongTien,NgayLapHD) VALUES(@mahd,@madb,@manv,@tongtien,@ngay)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@mahd", hd.MaHoaDon);
                cmd.Parameters.AddWithValue("@madb",hd.MaDatBan);
                cmd.Parameters.AddWithValue("@manv", hd.MaNV);

                cmd.Parameters.AddWithValue("@tongtien", hd.TongTien);
                cmd.Parameters.AddWithValue("@ngay", hd.NgayLapHD);

                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }
        //-------------------------THỐNG KÊ------------
        public DataTable GetAllTableTK()
        {

            string sql = @"SELECT * FROM HOADON  ";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable GetAllTableTKTC(DateTime tn, DateTime dn)
        {

            string sql = @"SELECT * FROM HOADON WHERE NgayLapHD BETWEEN '"+tn+"' AND '"+dn+"' ";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable GetAllTableTKMA(DateTime tn, DateTime dn, string mama)
        {

            string sql = @"SELECT *FROM
    HOADON
    INNER JOIN CHITIETDATBAN ON HOADON.MaDatBan = CHITIETDATBAN.MaDatBan
 WHERE NgayLapHD BETWEEN '" + tn + "' AND '" + dn + "' AND MaMonAn = '" + mama + "' ";
            SqlDataAdapter da = new SqlDataAdapter(sql, connectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        //--------------------------------BAN-----------------------

        //liem tra thu maban co trung khong

        public bool CheckTableB(string maban)
        {
            string sql = @"SELECT COUNT (*) FROM BAN WHERE MaBan = @maban";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@maban", maban);
                connection.Open();
                int count = (int)command.ExecuteScalar();
                return (count >= 1);
                //if (count >= 1) return true;
                //else return false:

            }
        }


        //Thêm bàn

        public bool InsertTable(BAN B)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"INSERT INTO BAN(MaBan,MoTa,TrangThai) VALUES(@maban,@mota,@trangthai)";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@maban", B.MaBan);
                cmd.Parameters.AddWithValue("@mota", B.MoTa);
                cmd.Parameters.AddWithValue("@trangthai", B.TrangThai);

                connection.Open();
                int result = cmd.ExecuteNonQuery();
                return (result >= 1);

            }
        }

        // Xóa bàn button

        public bool DeleteTable(string maban)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"delete from BAN  where MaBan = '" + maban + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                return (result >= 1);
            }
        }

        // Sửa bafn

     /*   public bool UpdateTable(BAN B)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string sql = @"UPDATE BAN SET 
                
                MoTa=@mota,
                TrangThai=@trangthai
                
                WHERE MaBan=@maban";
                SqlCommand cmd = new SqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@maban", B.MaBan);
                cmd.Parameters.AddWithValue("@mota",B.MoTa);
                cmd.Parameters.AddWithValue("@trangthai", B.TrangThai);
               
                connection.Open();
                int result = cmd.ExecuteNonQuery();
                if (result >= 1)
                {
                    return true;
                }
            }
            return false;
        }

       */
    }
}
