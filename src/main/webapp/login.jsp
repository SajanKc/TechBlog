<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="np.com.kcsajan.blog.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header_inc.jsp"%>
</head>
<body>
	<%@include file="includes/navbar_inc.jsp"%>

	<main class="banner__style bg-info d-flex align-items-center"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center">
							<b>Login Here</b>
						</div>
						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass()%> text-center"
							role="alert">
							<%=msg.getContent()%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>
						<div class="card-body">
							<form action="LoginServlet" method="POST">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter your email" required /> <small
										id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Enter your password"
										required />
								</div>
								<button type="submit" class="btn btn-outline-dark mt-2">
									<i class="fa fa-sign-in" aria-hidden="true"></i> Login
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="includes/footer_inc.jsp"%>
</body>
</html>
