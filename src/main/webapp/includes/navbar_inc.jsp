<%@page import="np.com.kcsajan.blog.entities.User"%>
<%@ page
	import="np.com.kcsajan.blog.dao.*,np.com.kcsajan.blog.helper.*,np.com.kcsajan.blog.entities.*,java.util.*"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="./index.jsp">TechBlog</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">Categories</a>
				<div class="dropdown-menu">
					<%
					PostDao navPostDao = new PostDao(ConnectionProvider.getCon());
					ArrayList<Category> navCatList = navPostDao.getAllCategories();
					for (Category cat : navCatList) {
					%>
					<a class="dropdown-item" href="#"><%=cat.getCatName()%></a>
					<%
					}
					%>
				</div></li>
				<li class="nav-item"><a class="nav-link" href="./post.jsp">Posts</a></li>
		</ul>
		<%
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
		%>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a
				class="nav-link login btn btn-outline-dark btn-sm" href="login.jsp">
					<i class="fa fa-sign-in" aria-hidden="true"></i> Login
			</a></li>
			<li class="nav-item ml-lg-3"><a
				class="nav-link register btn btn-outline-dark btn-sm"
				href="register.jsp"> <i class="fa fa-user-plus"
					aria-hidden="true"></i> Register
			</a></li>
		</ul>
		<%
		} else {
		%>
		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a
				class="nav-link login btn btn-outline-dark btn-sm" href="#"
				data-toggle="modal" data-target="#profileModal"> <i
					class="fa fa-user" aria-hidden="true"></i> <%=currentUser.getUsername()%>
			</a> <%@include file="profile_inc.jsp"%></li>
			<li class="nav-item ml-lg-3"><a
				class="nav-link register btn btn-outline-dark btn-sm"
				href="LogoutServlet"> <i class="fa fa-sign-out"
					aria-hidden="true"></i> Logout
			</a></li>
		</ul>
		<%
		}
		%>
	</div>
</nav>
