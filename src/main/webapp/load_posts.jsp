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
	if(posts.size() == 0){
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
				<pre><%=post.getpCode()%></pre>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>