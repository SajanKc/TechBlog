<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ page
import="np.com.kcsajan.blog.entities.User"%> <% User user = (User) session.getAttribute("currentUser"); if (user ==
null) { response.sendRedirect("login.jsp"); } else { %>

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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="d-flex justify-content-center" style="height: 135px">
				<div class="circle__profile">
					<img class="profile__picture" src="image/profile/<%=user.getProfile()%>" alt="female" />
				</div>
			</div>
			<h3 class="text-center"><%=user.getUsername()%></h3>
			<div class="modal-body pt-1">
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
					<form
						id="EditProfilePicture"
						action="EditProfilePictureServlet"
						method="POST"
						enctype="multipart/form-data"
					>
						<div class="input-group">
							<div class="custom-file">
								<input
									type="file"
									class="custom-file-input"
									name="profilePicture"
									id="inputGroupProfile"
									aria-describedby="profileUpdate"
									required
								/>
								<label class="custom-file-label" for="inputGroupProfile">Choose file</label>
							</div>
							<div class="input-group-append">
								<button class="btn btn-outline-success" type="submit" id="profileUpdate">
									Update
								</button>
							</div>
						</div>
					</form>
					<h3 class="mt-2">Edit Profile</h3>
					<form id="EditProfileDetails" action="EditServlet" method="POST">
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
											name="userName"
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
										<textarea class="form-control" name="userAbout" rows="2">
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
									<th>Password:</th>
									<td class="input__icons">
										<i id="eye__icon" class="fa fa-eye icon" aria-hidden="true"></i>
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
							<button type="submit" class="btn btn-outline-success">Update</button>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id="edit__profile-btn" type="button" class="btn btn-warning">Edit</button>
			</div>
		</div>
	</div>
</div>
<% } %>
