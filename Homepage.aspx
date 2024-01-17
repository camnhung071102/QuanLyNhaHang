<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="QLNH.Homepage" %>

<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+JwGgwFmkGgR5S6Mvr9QkZZQaThX2Q8" crossorigin="anonymous">

  <title>Nhà hàng 5 Chị Em</title>

  <style>
    /* Style cho header */
    .header {
      background-image: url("https://picsum.photos/2000/800");
      background-size: cover;
      background-position: center;
      height: 500px;
      position: relative;
    }
    .header:before {
      content: "";
      background: rgba(0, 0, 0, 0.4);
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
    .header .container {
      position: relative;
      z-index: 2;
      padding-top: 100px;
    }
    .header h1 {
      color: white;
      font-size: 80px;
      font-weight: 700;
    }
    /* Style cho thanh navbar */
    .navbar-brand>img {
      max-height: 40px;
    }
    .navbar-toggler {
      border: none;
      outline: none;
    }
    .navbar-nav a {
      color: #777;
      font-weight: bold;
      text-transform: uppercase;
      font-size: 14px;
    }
    .navbar-nav a:hover,
    .navbar-nav a.active {
      color: #000;
    }
    /* Style cho phần content */
    .main {
      padding: 50px 0;
    }
    .main h2 {
      margin-bottom: 30px;
      font-weight: 700;
    }
    .main p {
      font-size: 18px;
      line-height: 1.5;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <!-- Thanh navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="https://picsum.photos/200" alt="Nhà hàng Ba Con Cóc">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">      <li class="nav-item">
        <a class="nav-link active" href="#">Trang chủ</a>
      </li>
      <!-- Liên kết đến trang đặt bàn-->
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#datbanModal">Đặt bàn</a>
      </li>
      <!-- Liên kết đến trang đăng nhập-->
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#dangnhapModal">Đăng nhập</a>
      </li>
    </ul>
  </div>
</div>
</nav> <!-- Modal cho trang đặt bàn--> <div class="modal fade" id="datbanModal" tabindex="-1" role="dialog" aria-labelledby="datbanModalLabel" aria-hidden="true"> <div class="modal-dialog" role="document"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="datbanModalLabel">Đặt bàn</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div> <div class="modal-body"> <p>Đặt bàn tại nhà hàng Ba Con Cóc:</p> <form> <div class="form-group"> <label for="ngay-dat-ban">Ngày đặt bàn</label> <input type="text" class="form-control" id="ngay-dat-ban"> </div> <div class="form-group"> <label for="so-nguoi">Số người</label> <input type="text" class="form-control" id="so-nguoi"> </div> <button type="submit" class="btn btn-primary">Đặt bàn</button> </form> </div> </div> </div> </div> <!-- Modal cho trang đăng nhập--> <div class="modal fade" id="dangnhapModal" tabindex="-1" role="dialog" aria-labelledby="dangnhapModalLabel" aria-hidden="true"> <div class="modal-dialog" role="document"> <div class="modal-content"> <div class="modal-header"> <h5 class="modal-title" id="dangnhapModalLabel">Đăng nhập</h5> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div> <div class="modal-body"> <p>Đăng nhập vào hệ thống quản lý nhà hàng:</p> <form> <div class="form-group"> <label for="username">Tên đăng nhập</label> <input type="text" class="form-control" id="username"> </div> <div class="form-group"> <label for="password">Mật khẩu</label> <input type="password" class="form-control" id="password"> </div> <button type="submit" class="btn btn-primary">Đăng nhập</button> </form> </div> </div> </div> </div> <!-- Phần content --> <div class="header"> <div class="container"> <h1>Nhà hàng Ba Con Cóc</h1> </div> </div> <div class="main"> <div class="container"> <h2>Giới thiệu</h2> <p> Nhà hàng Ba Con Cóc là một trong những nhà hàng nổi tiếng tại Hà Nội với các món ăn đậm đà hương vị Việt Nam. Tại đây, bạn có thể thưởng thức những món ăn truyền thống như phở, bánh xèo, gà nướng... Ngoài ra, nhà hàng Ba Con Cóc còn được thiết kế bởi các kiến trúc sư hàng đầu, với không gian sang trọng và ấm cúng. Chúng tôi cam kết mang đến cho bạn những giây phút thư giãn và ngon miệng nhất. </p>  <h2>Món ăn</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <img src="https://picsum.photos/300/300/?random" alt="Phở bò">
        <div class="caption">
          <h3>Phở bò</h3>
          <p>Phở bò ngon nhất thành phố</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <img src="https://picsum.photos/300/300/?random" alt="Bánh xèo">
        <div class="caption">
          <h3>Bánh xèo</h3>
          <p>Bánh xèo giòn tan, thơm ngon</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <img src="https://picsum.photos/300/300/?random" alt="Gà nướng">
        <div class="caption">
          <h3>Gà nướng</h3>
          <p>Gà nướng sốt cay giòn tan, đậm đà</p>
        </div>
      </div>
    </div>
  </div>

  <h2>Không gian</h2>
  <div class="row">
    <div class="col-md-6 mb-4">
      <img src="https://picsum.photos/600/400/?random" alt="Không gian">
      <p>Phòng ăn rộng rãi với nhiều bàn ghế thoải mái</p>
    </div>
    <div class="col-md-6 mb-4">
      <img src="https://picsum.photos/600/400/?random" alt="Không gian">
      <p>Quầy bar sang trọng với nhiều loại đồ uống</p>
    </div>
  </div>
</div>
    </div> <!-- Optional JavaScript --> <!-- jQuery first, then Popper.js, then Bootstrap JS --> <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgcFJMWLPvG245xvP3bXSh6rPg+1fXn/dFpzT0UuT7Iiqd49QQpzgYJQfV8WQ6Tj" crossorigin="anonymous"></script> </body> </html> 
         

