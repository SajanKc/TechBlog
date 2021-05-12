package np.com.kcsajan.blog.servlets;

import java.io.File;
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
import np.com.kcsajan.blog.helper.Helper;

@WebServlet("/EditProfilePictureServlet")
@MultipartConfig
public class EditProfilePictureServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Part part = request.getPart("profilePicture");
		String profilePicture = part.getSubmittedFileName();

		// Get user from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		user.setProfile(profilePicture);

		// Update user in database
		UserDao dao = new UserDao(ConnectionProvider.getCon());
		if (dao.updateUserProfile(user)) {
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/") + "image/profile" + File.separator + user.getProfile();
			Helper.deleteFile(path);

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("Profile_Updated");
			}
		} else {
			out.println("Profile_Not_Updated");
		}
		out.close();
	}
}
