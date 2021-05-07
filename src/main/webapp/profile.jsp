<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="np.com.kcsajan.blog.dao.*,np.com.kcsajan.blog.helper.*,np.com.kcsajan.blog.entities.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header_inc.jsp"%>
</head>
<body>
	<%@include file="includes/navbar_inc.jsp"%>

	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#addpostModal">Add Post</button>

	<div class="modal fade" id="addpostModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add New Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<form id="addPost" action="AddPostServlet" method="POST">
								<div class="form-group">
									<select class="form-control" name="catId">
										<option selected disabled>---Select Category---</option>
										<%
										PostDao postDao = new PostDao(ConnectionProvider.getCon());
										ArrayList<Category> catList = postDao.getAllCategories();
										for (Category cat : catList) {
										%>
										<option value="<%=cat.getCatId()%>"><%=cat.getCatName()%></option>
										<%
										}
										%>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="postTitle"
										placeholder="Enter post Title" class="form-control" />
								</div>
								<div class="form-group">
									<textarea class="form-control" name="postContent" cols="10"
										rows="5" placeholder="Enter your content"></textarea>
								</div>
								<div class="form-group">
									<textarea class="form-control" name="postCode" cols="10"
										rows="5" placeholder="Enter your program(if any)"></textarea>
								</div>
								<div class="form-group">
									<label for="picture">Select your picture : </label> <input
										type="file" class="form-control-file" name="postPicture"
										id="picture" />
								</div>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<div class="float-right">
									<button type="submit" class="btn btn-primary">Add</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<main class="mt-3">
			<div class="container">
				<div class="row">
					<!-- Categories -->
					<div class="col-md-4">
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action active">
								All Posts</button>
							<%
							for (Category cat : catList) {
							%>
							<button type="button"
								class="list-group-item list-group-item-action"><%=cat.getCatName()%></button>
							<%
							}
							%>
						</div>
					</div>
					<!-- Posts -->
					<div class="col-md-8">
						<div class="container text-center" id="loader">
							<i class="fa fa-refresh fa-3x fa-spin"></i>
							<h3>Loading.....</h3>
						</div>
						<div class="container-fluid" id="post__container"></div>
					</div>
				</div>
			</div>
		</main>

	</div>
	<!-- JavaScript -->
	<%@include file="includes/footer_inc.jsp"%>
	<script>
		$(document).ready(function() {
			$.ajax({
				url : "load_posts.jsp",
				method : 'GET',
				success : function(data) {
					$("#loader").hide();
					$("#post__container").html(data);
				},
				error : function() {
					console.log("Error...");
				}
			})
		})
	</script>
</body>
</html>