<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/header_inc.jsp"%>
	</head>
	<body>
		<div
			class="container text-center d-flex flex-column justify-content-center align-items-center"
			style="height: 100vh"
		>
			<img
				src="./image/error.svg"
				alt="error icon"
				style="max-width: 400px"
			/>
			<h2>Sorry !!! Something went wrong...</h2>
			<p style="color: red"><%= exception %></p>
			<a href="index.jsp" class="btn btn-outline-dark btn-lg mt-3"
				>Home</a
			>
		</div>
	</body>
</html>
