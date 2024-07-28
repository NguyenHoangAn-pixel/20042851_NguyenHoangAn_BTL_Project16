package servlet;

import dao.ThemDAO;
import entities.DoChoiTreEm;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/them")
@MultipartConfig
public class ThemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ThemDAO themDAO;

    @Override
    public void init() throws ServletException {
        themDAO = new ThemDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Them.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDoChoi = request.getParameter("maDoChoi");
        String tenDoChoi = request.getParameter("tenDoChoi");
        String giaStr = request.getParameter("gia");
        String tinhTrang = request.getParameter("tinhTrang");
        String loaiDoChoi = request.getParameter("loaiDoChoi");

        if (maDoChoi == null || maDoChoi.isEmpty() ||
        	tenDoChoi == null || tenDoChoi.isEmpty() ||
            giaStr == null || giaStr.isEmpty() ||
            tinhTrang == null || tinhTrang.isEmpty() ||
            loaiDoChoi == null || loaiDoChoi.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("Them.sp").forward(request, response);
            return;
        }

        int gia = Integer.parseInt(giaStr);

        Part filePart = request.getPart("anh");
        InputStream anhStream = filePart != null ? filePart.getInputStream() : null;

        DoChoiTreEm doChoiTreEm = new DoChoiTreEm(maDoChoi, tenDoChoi, gia, tinhTrang, loaiDoChoi, anhStream);
        themDAO.addDoChoiTreEm(doChoiTreEm);

        response.sendRedirect("TrangChuAdmin.jsp");
    }
}
