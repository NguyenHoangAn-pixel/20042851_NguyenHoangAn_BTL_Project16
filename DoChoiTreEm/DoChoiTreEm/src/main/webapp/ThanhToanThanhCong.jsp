<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.DoChoiTreEm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán Thành Công</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .invoice-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .invoice-container h2 {
            font-size: 24px;
            margin: 10px 0;
            text-align: center;
        }
        .invoice-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .invoice-container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .invoice-container table, .invoice-container th, .invoice-container td {
            border: 1px solid #ddd;
        }
        .invoice-container th, .invoice-container td {
            padding: 10px;
            text-align: left;
        }
        .invoice-container th {
            background-color: #f4f4f4;
        }
        .total-price {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
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
        <h1>Thanh Toán Thành Công</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHang.jsp">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <div class="invoice-container">
            <h2>Hóa Đơn Thanh Toán</h2>
            <p><strong>Ngày giờ:</strong> <%=session.getAttribute("orderDate")%></p>
            <table>
                <thead>
                    <tr>
                        <th>Mã Đồ Chơi</th>
                        <th>Tên Đồ Chơi</th>
                        <th>Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<DoChoiTreEm> gioHang = (List<DoChoiTreEm>) session.getAttribute("gioHang");
                                            int totalPrice = 0;
                                            if (gioHang != null && !gioHang.isEmpty()) {
                                                for (DoChoiTreEm doChoiTreEm : gioHang) {
                                                    totalPrice += doChoiTreEm.getGia();
                    %>
                                <tr>
                                    <td><%= doChoiTreEm.getMaDoChoi() %></td>
                                    <td><%= doChoiTreEm.getTenDoChoi() %></td>
                                    <td><%= doChoiTreEm.getGia() %> VND</td>
                                </tr>
                                <% 
                            }
                        } else {
                            %>
                            <tr>
                                <td colspan="3">Không có đồ chơi nào.</td>
                            </tr>
                            <% 
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                Tổng tiền: <%= totalPrice %> VND
            </div>
            <div class="button-group">
                <form action="ResetCartServlet" method="post">
                    <input type="submit" value="Trở Về Trang Chủ" class="button">
                </form>
            </div>
        </div>
    </section>
</body>
</html>
