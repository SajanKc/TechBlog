<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="np.com.kcsajan.blog.entities.User"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header_inc.jsp"%>
</head>
<body>
	<%@include file="includes/navbar_inc.jsp"%>
	<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container">
		<h3><%=user.getUsername()%></h3>
		<h3><%=user.getEmail()%></h3>
		<h3><%=user.getGender()%></h3>
	</div>
</body>
</html>
