package np.com.kcsajan.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import np.com.kcsajan.blog.dao.UserDao;
import np.com.kcsajan.blog.entities.User;
import np.com.kcsajan.blog.helper.ConnectionProvider;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("userName");
		String email = request.getParameter("userEmail");
		String about = request.getParameter("userAbout");
		String password = request.getParameter("userPassword");
		Part part = request.getPart("profilePicture");
		String profilePicture = part.getSubmittedFileName();

		// Get user from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		user.setUsername(username);
		user.setEmail(email);
		user.setAbout(about);
		user.setPassword(password);
		user.setProfile(profilePicture);

		// Update user in database
		UserDao dao = new UserDao(ConnectionProvider.getCon());
		if (dao.updateUser(user)) {
			out.println("Updated");
		} else {
			out.println("Not_Updated");
		}

		out.close();
	}
}
