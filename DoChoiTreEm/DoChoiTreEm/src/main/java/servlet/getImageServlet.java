package servlet;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet("/getImageServlet")
public class getImageServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maDoChoi = request.getParameter("maDoChoi");
        String imagePath = "/images" + maDoChoi + ".jpg";
        
        response.setContentType("image/jpeg");
        try (OutputStream out = response.getOutputStream()) {
            Files.copy(Paths.get(imagePath), out);
        } catch (IOException e) {
            // Xử lý lỗi nếu không tìm thấy hoặc không thể đọc file
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
