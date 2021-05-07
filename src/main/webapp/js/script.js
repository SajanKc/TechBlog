$(document).ready(function () {
	let editStatus = false;
	$("#edit__profile-btn").click(function () {
		if (editStatus == false) {
			$("#profile__details").hide();
			$("#profile__edit").show();
			editStatus = true;
			$(this).text("Back");
		} else {
			$("#profile__details").show();
			$("#profile__edit").hide();
			editStatus = false;
			$(this).text("Edit");
		}
	});

	// password hide and show toggler
	let passwordStatus = false;
	let passwordBtn = document.getElementById("userPassword");
	let eyeBtn = document.getElementById("eye__icon");
	$("#eye__icon").click(function () {
		if (passwordStatus == false) {
			passwordBtn.type = "text";
			eyeBtn.classList.add("fa-eye-slash");
			passwordStatus = true;
		} else {
			passwordBtn.type = "password";
			eyeBtn.classList.remove("fa-eye-slash");
			passwordStatus = false;
		}
	});

	// Add post
	$("#addPost").on("submit", function (event) {
		event.preventDefault();
		let form = new FormData(this);

		$.ajax({
			url: "AddPostServlet",
			method: "POST",
			data: form,
			success: function (data) {
				if ($.trim(data) === "done") {
					swal(
						"Good job!",
						"Post Added Successfully !!! Redirecting to profile page.",
						"success"
					).then((value) => {
						window.location = "profile.jsp";
					});
				} else {
					swal("Post not added : " + data);
				}
			},
			error: function (error) {
				swal("Something went wrong... try again" + error);
			},
			processData: false,
			contentType: false,
		});
	});
	// Calling getPosts function
	let allPostRef = $(".c-link")[0];
	getPosts(0, allPostRef);
});

// Get post
function getPosts(catId, ref) {
	$("#loader").show();
	$("#post__container").hide();

	$(".c-link").removeClass("active");

	$.ajax({
		url: "load_posts.jsp",
		method: "GET",
		data: { cid: catId },
		success: function (data) {
			$(ref).addClass("active");

			$("#loader").hide();
			$("#post__container").show().html(data);
		},
		error: function () {
			console.log("Error...");
		},
	});
}
