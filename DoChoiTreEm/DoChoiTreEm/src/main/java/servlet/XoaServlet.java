package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.XoaDAO;
import entities.DoChoiTreEm;

@WebServlet("/XoaServlet")
public class XoaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private XoaDAO xoaDAO;

	@Override
	public void init() {
		xoaDAO = new XoaDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<DoChoiTreEm> doChoiTreEmList = xoaDAO.getAllDoChoiTreEm();
			request.setAttribute("doChoiTreEmList", doChoiTreEmList);
			request.getRequestDispatcher("Xoa.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maDoChoi = request.getParameter("maDoChoi");
		try {
			if (maDoChoi != null && !maDoChoi.isEmpty()) {
				xoaDAO.deleteDoChoiTreEm(maDoChoi);
			}
			response.sendRedirect("XoaServlet");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
