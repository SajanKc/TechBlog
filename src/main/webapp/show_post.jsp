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
	%>
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header">
						<h4><%=post.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<p><%=post.getpContent()%></p>
						<br />
						<pre class="code"><%=post.getpCode()%></pre>
					</div>
					<div class="card-footer text-right">
						<a href="#" class="btn btn-outline-primary btn-sm"><i
							class="fa fa-thumbs-o-up"></i> <span>10</span></a> <a href="#"
							class="btn btn-outline-primary btn-sm"><i
							class="fa fa-commenting-o"></i> <span>15</span></a>
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
