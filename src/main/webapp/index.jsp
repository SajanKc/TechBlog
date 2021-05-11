<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header_inc.jsp"%>
</head>
<body>
	<%@include file="includes/navbar_inc.jsp"%>
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron banner__style">
			<div class="container">
				<h2 class="display-3 mb-4">Welcome To Tech Blog</h2>
				<p class="text__indent">Welcome to technical blog, Lorem ipsum
					dolor sit, amet consectetur adipisicing elit. Possimus vero minima
					nesciunt aperiam rem nobis, laborum fugiat nemo velit tenetur iste
					unde ipsam? Cumque minima veniam exercitationem quidem vel
					obcaecati.</p>
				<p>Welcome to technical blog, Lorem ipsum dolor sit, amet
					consectetur adipisicing elit. Possimus vero minima nesciunt aperiam
					rem nobis, laborum fugiat nemo velit tenetur iste unde ipsam?
					Cumque minima veniam exercitationem quidem vel obcaecati.</p>
				<%
				User currentUser1 = (User) session.getAttribute("currentUser");
				if (currentUser1 == null) {
				%>
				<a href="register.jsp" class="btn btn-outline-dark btn-md"> <i
					class="fa fa-user-plus" aria-hidden="true"></i> Start ! It's Free
				</a> <a href="login.jsp" class="btn btn-outline-dark btn-md"> <i
					class="fa fa-sign-in" aria-hidden="true"></i> Login
				</a>
				<%
				} else {
				%>
				<a href="javascript:void(0)" class="btn btn-outline-dark btn-md"
					title="Not available while you logged in."> <i
					class="fa fa-user-plus" aria-hidden="true"></i> Start ! It's Free
				</a> <a href="LogoutServlet" class="btn btn-outline-dark btn-md"> <i
					class="fa fa-sign-in" aria-hidden="true"></i> Logout
				</a>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row mb-4">
			<!-- Posts -->
			<div class="col">
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-3x fa-spin"></i>
					<h3>Loading.....</h3>
				</div>
				<div class="container-fluid" id="post__container"></div>
			</div>
		</div>
	</div>
	<!-- JavaScript -->
	<%@include file="includes/footer_inc.jsp"%>
</body>
</html>
