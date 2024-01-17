using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLNH
{
    public class User
    {
        private string manv;
        private string tennv;
        private string vitri;
        private string tendn;
        private string matkhau;
        private string hinh;

        public User()
        {
            manv = "";
            tennv = "";
            vitri= "";
            tendn = "";
            matkhau = "";
            hinh = "";


        }
        public User(string ma, string nv, string vt, string dn,
            string mk, string img)
        {
            manv = ma;
            tennv = nv;
            vitri = vt;
            tendn = dn;
            matkhau = mk;
            hinh=img;
        }
        public string MaNV
        {
            get { return manv; }
            set { manv = value; }
        }
        public string HoTen
        {
            get { return tennv; }
            set { tennv = value; }
        }
        public string ViTri
        {
            get { return vitri; }
            set { vitri = value; }
        }
        public string TenDN
        {
            get { return tendn; }
            set { tendn = value; }
        }
        public string MatKhau
        {
            get { return matkhau; }
            set { matkhau = value; }
        }
        public string Hinh
        {
            get { return hinh; }
            set { hinh = value; }
       
    }
}
    public class KhachHang
    {
        private string makh;
        private string tenkh;
        private int sdt;
       

        public KhachHang()
        {
            makh = "";
            tenkh = "";
            sdt = 0;
          
        }
        public KhachHang(string ma, string ten, int so)
        {
            makh = ma;
            tenkh= ten;
            sdt = so;
            
        }
        public string HoTen
        {
            get { return tenkh; }
            set { tenkh = value; }
        }
        public string MaKH
        {
            get { return makh; }
            set { makh = value; }
        }
        public int SDT
        {
            get { return sdt; }
            set { sdt = value; }
        }
       
    }
    public class BAN
    {
        private string maban;
        private string mota;
        private string trangthai;


        public BAN()
        {
            maban = "";
            mota = "";
            trangthai = "trống";

        }
        public BAN(string ma, string mt, string tt)
        {
            maban = ma;
            mota = mt;
            trangthai= tt;

        }
        public string MaBan
        {
            get { return maban; }
            set { maban = value; }
        }
        public string MoTa
        {
            get { return mota; }
            set { mota = value; }
        }
        public string TrangThai
        {
            get { return trangthai; }
            set { trangthai = value; }
        }

    }
   
    public class DATBAN
    {
        private string madatban;
        private string makh;
        private string maban;
        private DateTime ngay;
        private string manv;
       

        public DATBAN()
        {
            madatban = "";
            makh = "";
            maban = "";
         
            ngay = DateTime.Now;
            manv= "";
        }
        public DATBAN(string madb, string mak, string mab,  DateTime ng, string man)
        {
            madatban = madb;
            makh = mak;
            maban = mab;

            ngay = DateTime.Now;
            manv = man;


        }
        public string MaDatBan
        {
            get { return madatban; }
            set { madatban = value; }
        }
        public string MaKH
        {
            get { return makh; }
            set { makh = value; }
        }
        public string MaBan
        {
            get { return maban; }
            set { maban = value; }
        }
        public DateTime NgayDatBan
        {
            get { return ngay; }
            set { ngay = value; }
        }
        public string MaNV
        {
            get { return manv; }
            set { manv = value; }
        }

    }
    public class CHITIETDATBAN
    {
        private string madb;
        private string mama;
        private int sl;
        private int gia;
        public CHITIETDATBAN()
        {
            madb = "";
            mama = "";
            sl = 0;
            gia= 0;

        }
        public  CHITIETDATBAN(string ma, string mm,int so,int g)
        {
            madb = ma;
            mama = mm;
            sl = so;
            gia = g;



        }
        public string MaDatBan
        {
            get { return madb; }
            set { madb = value; }
        }
        public string MaMonAn
        {
            get { return mama; }
            set { mama = value; }
        }
        public int SoLuong
        {
            get { return sl; }
            set { sl = value; }
        }
        public int Gia
        {
            get { return gia; }
            set { gia = value; }
        }

    }
    public class HOADON
    {
        private string mahd;
        private string madb;
        private string manv;
        private int tongtien;
        private DateTime ngay;
      

        public HOADON()
        {
            mahd= "";
            madb = "";
            manv = "";
            tongtien = 0;
            ngay = DateTime.Now;
           

        }
        public HOADON(string hd, string db,
            string nv, int tt,DateTime ng)
        {
  
            mahd = hd;
            madb = db;
            manv = nv;
            tongtien = tt;
            ngay = ng;
        }
        public string MaHoaDon
        {
            get { return mahd; }
            set { mahd = value; }
        }
        public string MaDatBan
        {
            get { return madb; }
            set { madb = value; }
        }
        public string MaNV
        {
            get { return manv; }
            set { manv = value; }
        }
        public int  TongTien
        {
            get { return tongtien; }
            set { tongtien = value; }
        }
        public DateTime NgayLapHD
        {
            get { return ngay; }
            set { ngay = value; }
        }
       
       


    }
    public class THUCDON
    {
        private string mama;
        private string tenma;
        private string mapl;
        private int gia;
        private string hinh;


        public THUCDON()
        {
            mama = "";
            tenma = "";
            mapl = "";
            gia = 0;
            hinh = "";
          

        }
        public THUCDON(string ma, string tma, string pl,int g, string img)
        {
            mama = ma;
            tenma = tma;
            mapl = pl;
            gia = g;
            hinh = img;

        }
        public string MaMonAn
        {
            get { return mama; }
            set { mama= value; }
        }
        public string TenMonAn
        {
            get { return tenma; }
            set { tenma = value; }
        }
        public string MaPhanLoai
        {
            get { return mapl; }
            set { mapl = value; }
        }
        public int Gia
        {
            get { return gia; }
            set { gia = value; }
        }
        public string Hinh
        {
            get { return hinh; }
            set { hinh = value; }
        }
        

    }

}