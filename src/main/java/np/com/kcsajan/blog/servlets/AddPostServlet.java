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
import np.com.kcsajan.blog.dao.PostDao;
import np.com.kcsajan.blog.entities.Post;
import np.com.kcsajan.blog.entities.User;
import np.com.kcsajan.blog.helper.ConnectionProvider;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int cat_id = Integer.parseInt(request.getParameter("catId"));
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String postCode = request.getParameter("postCode");
		Part part = request.getPart("postPicture");
		String postPicture = part.getSubmittedFileName();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int uid = user.getUid();

		Post post = new Post(postTitle, postContent, postCode, postPicture, null, cat_id, uid);
		PostDao dao = new PostDao(ConnectionProvider.getCon());
		if (dao.addPost(post)) {
			out.println("done");
		} else {
			out.println("error");
		}

	}
}
