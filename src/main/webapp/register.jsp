<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="np.com.kcsajan.blog.servlets.*"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/header_inc.jsp"%>
	</head>
	<body>
		<%@include file="includes/navbar_inc.jsp"%>

		<main
			class="banner__style bg-info d-flex align-items-center"
			style="height: 90vh"
		>
			<div class="container">
				<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card">
							<div class="card-header text-center">
								<b>Register Here</b>
							</div>
							<div class="card-body">
								<form
									id="register"
									action="register"
									method="POST"
								>
									<div class="form-group">
										<label for="username">Username</label>
										<input
											type="text"
											class="form-control"
											id="username"
											name="username"
											placeholder="Enter username"
											required
										/>
									</div>
									<div class="form-group">
										<label for="email">Email address</label>
										<input
											type="email"
											class="form-control"
											id="email"
											name="email"
											placeholder="Enter email"
											required
										/>
									</div>
									<div class="form-group">
										<label for="password">Password</label>
										<input
											type="password"
											class="form-control"
											id="password"
											name="password"
											placeholder="Password"
											required
										/>
									</div>
									<div class="form-group">
										<label for="gender"
											>Select Gender</label
										>
										<br />
										<input
											type="radio"
											name="gender"
											value="male"
											required
										/>
										Male
										<input
											type="radio"
											name="gender"
											value="female"
											required
										/>
										Female
									</div>

									<div class="form-group">
										<textarea
											class="form-control"
											name="about"
											rows="2"
											placeholder="Enter something about yourself..."
											required
										></textarea>
									</div>
									<div class="form-check">
										<input
											type="checkbox"
											class="form-check-input"
											id="condition"
											name="check"
										/>
										<label
											class="form-check-label"
											for="condition"
											>agree terms & conditions</label
										>
									</div>
									<button
										type="submit"
										class="btn btn-outline-dark mt-3"
									>
										<i
											class="fa fa-user-plus"
											aria-hidden="true"
										></i>
										Register
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@include file="includes/footer_inc.jsp"%>
		<script>
			$(document).ready(function () {
				$("#register").on("submit", function (event) {
					event.preventDefault();

					let form = new FormData(this);

					$.ajax({
						url: "register",
						method: "POST",
						data: form,
						success: function (data) {
							if ($.trim(data) === "done") {
								swal(
									"Good job!",
									"Registered Successfully !!! Redirecting to login page.",
									"success"
								).then((value) => {
									window.location = "login.jsp";
								});
							} else {
								swal("Registration not done : " + data);
							}
						},
						error: function (error) {
							swal("Something went wrong... try again");
						},
						processData: false,
						contentType: false,
					});
				});
			});
		</script>
	</body>
</html>
