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
					<h3></h3>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Email :</th>
								<th scope="col"><%=user.getEmail()%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Gender :</th>
								<td><%=user.getGender()%></td>
							</tr>
							<tr>
								<th scope="row">About :</th>
								<td><%=user.getAbout()%></td>
							</tr>
							<tr>
								<th scope="row">Registered on :</th>
								<td><%=user.getRegisteredDate()%></td>
							</tr>
						</tbody>
					</table>
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
				<button type="button" class="btn btn-primary">Edit</button>
			</div>
		</div>
	</div>
</div>
<% } %>
