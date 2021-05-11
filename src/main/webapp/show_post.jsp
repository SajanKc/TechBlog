<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="np.com.kcsajan.blog.dao.*,np.com.kcsajan.blog.helper.*,np.com.kcsajan.blog.entities.*"%>
<%@ page errorPage="error.jsp"%>
<%
User user1 = (User) session.getAttribute("currentUser");
if (user1 == null) {
	response.sendRedirect("login.jsp");
} else {
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header_inc.jsp"%>
<style>
.code {
	background-color: #c5c5c5;
	padding: 5px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar_inc.jsp"%>
	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	PostDao pdao = new PostDao(ConnectionProvider.getCon());
	Post post = pdao.getPostByPostId(pid);
	// Getting user by id
	int uid = post.getUserId();
	UserDao udao = new UserDao(ConnectionProvider.getCon());
	User postUser = udao.getUserById(uid);
	%>
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<h4><%=post.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-8">
								<p style="font-weight: bold">
									Posted by : <a href="#"><%=postUser.getUsername()%></a>
								</p>
							</div>
							<div class="col-md-4">
								<p style="font-weight: bold"><%=DateFormat.getDateTimeInstance().format(post.getpDate())%></p>
							</div>
						</div>
						<p><%=post.getpContent()%></p>
						<br />
						<pre class="code"><%=post.getpCode()%></pre>
					</div>
					<%
					LikeDao likeDao = new LikeDao(ConnectionProvider.getCon());
					%>
					<div class="card-footer text-right">
						<button
							onclick="doLike(<%=post.getpId()%>,<%=postUser.getUid()%>)"
							class="btn btn-outline-primary btn-sm">
							<i class="fa fa-thumbs-o-up"></i> <span class="like__counter"><%=likeDao.countLikeOnPost(post.getpId())%></span>
						</button>
						<button class="btn btn-outline-primary btn-sm">
							<i class="fa fa-commenting-o"></i> <span>15</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="includes/footer_inc.jsp"%>
</body>
</html>
<%
}
%>
