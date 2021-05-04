package np.com.kcsajan.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import np.com.kcsajan.blog.dao.UserDao;
import np.com.kcsajan.blog.entities.User;
import np.com.kcsajan.blog.helper.ConnectionProvider;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");

		if (check == null) {
			out.println("Please agree terms and conditions to register.");
		} else {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			User user = new User(username, email, password, gender, about);

			UserDao udao = new UserDao(ConnectionProvider.getCon());
			if (udao.addUser(user)) {
				// used to check condition in ajax call
				out.println("done");
			} else {
				out.println("error");
			}
		}
	}
}
