<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="np.com.kcsajan.blog.entities.User"%> <%
User user = (User) session.getAttribute("currentUser"); if (user == null) {
response.sendRedirect("login.jsp"); } else { %>

<!-- Modal -->
<div
	class="modal fade"
	id="profileModal"
	tabindex="-1"
	role="dialog"
	aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true"
>
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button
					type="button"
					class="close"
					data-dismiss="modal"
					aria-label="Close"
				>
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<img class="profile__picture rounded-circle mx-auto mt-2 d-block"
			<%if(user.getGender().equals("male")){ %>
			src="image/profile/male_<%=user.getProfile()%>" alt="male" <%}else{
			%> src="image/profile/female_<%=user.getProfile()%>" alt="female"
			<%} %> />
			<div class="modal-body pt-1">
				<div class="container text-center">
					<h3><%=user.getUsername()%></h3>
					<div id="profile__details">
						<table class="table">
							<tbody style="text-align: start">
								<tr>
									<th>ID:</th>
									<td><%=user.getUid()%></td>
								</tr>
								<tr>
									<th scope="row">Email:</th>
									<td><%=user.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Gender:</th>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<th scope="row">About:</th>
									<td><%=user.getAbout()%></td>
								</tr>
								<tr>
									<th scope="row">Registered on:</th>
									<td><%=user.getRegisteredDate()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="profile__edit" style="display: none">
						<h3 class="mt-2">Edit Profile</h3>
						<form
							action="EditServlet"
							method="post"
							enctype="multipart/form-data"
						>
							<table class="table">
								<tbody style="text-align: start">
									<tr>
										<th>ID:</th>
										<td>
											<input
												class="form-control"
												type="text"
												name="userId"
												value="<%=user.getUid()%>"
												disabled
											/>
										</td>
									</tr>
									<tr>
										<th>Name:</th>
										<td>
											<input
												class="form-control"
												type="text"
												name="username"
												value="<%=user.getUsername()%>"
											/>
										</td>
									</tr>
									<tr>
										<th>Email:</th>
										<td>
											<input
												class="form-control"
												type="email"
												name="userEmail"
												value="<%=user.getEmail()%>"
											/>
										</td>
									</tr>
									<tr>
										<th>About:</th>
										<td>
											<textarea
												class="form-control"
												name="userAbout"
												rows="2"
											>
										<%=user.getAbout()%>
										</textarea
											>
										</td>
									</tr>
									<tr>
										<th>Gender:</th>
										<td>
											<input
												class="form-control"
												type="text"
												name="userGender"
												value="<%=user.getGender()%>"
												disabled
											/>
										</td>
									</tr>
									<tr>
										<th>Picture:</th>
										<td>
											<input
												type="file"
												class="form-control"
												name="profilePicture"
											/>
										</td>
									</tr>
									<tr>
										<th>Password:</th>
										<td class="input__icons">
											<i
												id="eye__icon"
												class="fa fa-eye icon"
												aria-hidden="true"
											></i>
											<input
												id="userPassword"
												class="form-control input__field"
												type="password"
												name="userPassword"
												value="<%=user.getPassword()%>"
											/>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="container">
								<button
									type="submit"
									class="btn btn-outline-success"
								>
									Save
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button
					type="button"
					class="btn btn-secondary"
					data-dismiss="modal"
				>
					Close
				</button>
				<button
					id="edit__profile-btn"
					type="button"
					class="btn btn-primary"
				>
					Edit
				</button>
			</div>
		</div>
	</div>
</div>
<% } %>
