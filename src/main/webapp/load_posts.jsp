<%@ page
	import="np.com.kcsajan.blog.dao.*,np.com.kcsajan.blog.helper.*,np.com.kcsajan.blog.entities.*,java.util.*"%>
<div class="row mx-0">
	<%
	Thread.sleep(300); // Remove this line while hosting
	PostDao postDao = new PostDao(ConnectionProvider.getCon());
	int catId = Integer.parseInt(request.getParameter("cid"));

	List<Post> posts = null;
	if (catId == 0) {
		posts = postDao.getPost();
	} else {
		posts = postDao.getPostByCategory(catId);
	}
	if (posts.size() == 0) {
		out.println("<h3 class='display-4 text-center'> No posts found in this category... </h3>");
		return;
	}
	for (Post post : posts) {
	%>
	<div class="col-md-6">
		<div class="card mb-4">
			<div class="card-body">
				<b><%=post.getpTitle()%></b>
				<hr />
				<p><%=post.getpContent()%></p>
				<!-- <pre><%=post.getpCode()%></pre> -->
			</div>
			<%
			// Getting user by id
			int uid = post.getUserId();
			UserDao udao = new UserDao(ConnectionProvider.getCon());
			User postUser = udao.getUserById(uid);
			LikeDao likeDao = new LikeDao(ConnectionProvider.getCon());
			%>
			<div class="card-footer text-right">
				<a href="show_post.jsp?pid=<%=post.getpId()%>"
					class="btn btn-outline-primary btn-sm">Read more...</a>
				<button onclick="doLike(<%=post.getpId()%>,<%=postUser.getUid()%>)"
					class="btn btn-outline-primary btn-sm">
					<i class="fa fa-thumbs-o-up"></i> <span class="like__counter"><%=likeDao.countLikeOnPost(post.getpId())%></span>
				</button>
				<button class="btn btn-outline-primary btn-sm">
					<i class="fa fa-commenting-o"></i> <span>15</span>
				</button>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>