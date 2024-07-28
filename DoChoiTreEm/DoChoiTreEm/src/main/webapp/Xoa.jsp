<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.XoaDAO"%>
<%@ page import="entities.DoChoiTreEm"%>
<%
XoaDAO xoaDAO = new XoaDAO();
    List<DoChoiTreEm> doChoiTreEmList = xoaDAO.getAllDoChoiTreEm();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xóa Đồ Chơi</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
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
            margin-top: 20px;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <h1>Trang Chủ Quản Trị</h1>
        <nav>
            <ul>
                <li><a href="Them.jsp">Thêm</a></li>
                <li><a href="Xoa.jsp">Xóa</a></li>
                <li><a href="CapNhat.jsp">Cập Nhật</a></li>
                <li><a href="QuanLyTaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li> <!-- Thêm liên kết đăng xuất -->
            </ul>
        </nav>
    </header>
    <section>
        <h2>Xóa Đồ Chơi</h2>
        <table>
            <tr>
                <th>Mã Đồ Chơi</th>
                <th>Tên Đồ Chơi</th>
                <th>Giá</th>
                <th>Tình Trạng</th>
                <th>Loại Đồ Chơi</th>
                <th>Ảnh</th>
                <th>Hành Động</th>
            </tr>
            <%
            for (DoChoiTreEm doChoiTreEm : doChoiTreEmList) {
            %>
            <tr>
                <td><%= doChoiTreEm.getMaDoChoi() %></td>
                <td><%= doChoiTreEm.getTenDoChoi() %></td>
                <td><%= doChoiTreEm.getGia() %></td>
                <td><%= doChoiTreEm.getTinhTrang() %></td>
                <td><%= doChoiTreEm.getLoaiDoChoi() %></td>
                <td>
                    <%
                        
                        String maDoChoi = doChoiTreEm.getMaDoChoi();
                        if (maDoChoi != null && !maDoChoi.isEmpty()) {
                          
                            String imagePath = request.getContextPath() + "/img/" + maDoChoi + ".jpg";
                    %>
                        <img src="<%= imagePath %>" alt="Hình Ảnh" width="100" />
                    <%
                        } else {
                    %>
                        Không có hình ảnh
                    <%
                        }
                    %>
                </td>
                <td>
                    <form action="XoaServlet" method="post">
                        <input type="hidden" name="maDoChoi" value="<%= doChoiTreEm.getMaDoChoi() %>" />
                        <input type="submit" value="Xóa" />
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </section>
    <div>
        <a href="TrangChuAdmin.jsp" class="button">Quay lại Trang Chủ Admin</a>
    </div>
</body>
</html>
