package np.com.kcsajan.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import np.com.kcsajan.blog.dao.UserDao;
import np.com.kcsajan.blog.entities.User;
import np.com.kcsajan.blog.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDao dao = new UserDao(ConnectionProvider.getCon());
		User user = new User();
		user = dao.getUserByEmailAndPassword(email, password);

		if (user != null) {
			out.println("success");
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		} else {
			out.println("failed");
			response.sendRedirect("login.jsp");
		}

	}

}
