<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="entities.DoChoiTreEm" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dao.DoChoiTreEmDAO" %>
<%
    String maDoChoi = request.getParameter("maDoChoi");
    DoChoiTreEmDAO doChoiTreEmDAO = new DoChoiTreEmDAO();
    DoChoiTreEm doChoiTreEm = null;
    String errorMessage = null;
    try {
        doChoiTreEm = doChoiTreEmDAO.getDoChoiTreEmByMa(maDoChoi);
        if(doChoiTreEm == null){
            errorMessage = "Sản phẩm không tồn tại.";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        errorMessage = "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đồ Chơi</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .detail-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .detail-container img {
            max-width: 300px; /* Giới hạn chiều rộng */
            max-height: 300px; /* Giới hạn chiều cao */
            height: auto;
            border-radius: 8px;
            display: block;
            margin: 0 auto; /* Căn giữa hình ảnh */
        }
        .detail-container h2 {
            font-size: 24px;
            margin: 10px 0;
            text-align: center;
        }
        .detail-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Chi Tiết Đồ Chơi</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHangServlet">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <div class="detail-container">
            <%
            if (doChoiTreEm != null) {
            %>
            <h2><%= doChoiTreEm.getTenDoChoi() %></h2>
            <img src="img/<%= doChoiTreEm.getMaDoChoi() %>.jpg" alt="<%= doChoiTreEm.getTenDoChoi() %>">
            <p><strong>Giá:</strong> <%= doChoiTreEm.getGia() %> VND</p>
            <p><strong>Tình Trạng:</strong> <%= doChoiTreEm.getTinhTrang() %></p>
            <p><strong>Loại Đồ Chơi:</strong> <%= doChoiTreEm.getLoaiDoChoi() %></p>
            <div class="button-group">
                <form action="GioHangServlet" method="post">
                    <input type="hidden" name="maDoChoi" value="<%= doChoiTreEm.getMaDoChoi() %>">
                    <button type="submit" class="button">Mua Hàng</button>
                </form>
                <a href="TrangChuKhach.jsp" class="button">Quay Lại</a>
            </div>
            <%
            } else {
            %>
            <p><%= errorMessage %></p>
            <%
            }
            %>
        </div>
    </section>
</body>
</html>
