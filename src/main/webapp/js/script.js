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
					swal("Good job!", "Post Added Successfully !!! Redirecting to profile page.", "success").then(
						(value) => {
							window.location = "profile.jsp";
						}
					);
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

	// Profile Picture Update
	$("#EditProfilePicture").on("submit", function (event) {
		event.preventDefault();

		let form = new FormData(this);

		$.ajax({
			url: "EditProfilePictureServlet",
			method: "POST",
			data: form,
			success: function (data) {
				if ($.trim(data) === "Profile_Updated") {
					swal(
						"Good job!",
						"Profile Picture Updated Successfully !!! Redirecting to home page.",
						"success"
					).then((value) => {
						window.location = "index.jsp";
					});
				} else {
					swal("Something went wrong : " + data);
				}
			},
			error: function (error) {
				swal("Something went wrong... try again");
			},
			processData: false,
			contentType: false,
		});
	});

	// Profile Details Update Script
	$("#EditProfileDetails").on("submit", function (event) {
		event.preventDefault();

		let form = new FormData(this);

		$.ajax({
			url: "EditServlet",
			method: "POST",
			data: form,
			success: function (data) {
				if ($.trim(data) === "Profile_Updated") {
					swal(
						"Good job!",
						"Profile Data Updated Successfully !!! Redirecting to home page.",
						"success"
					).then((value) => {
						window.location = "index.jsp";
					});
				} else {
					swal("Something went wrong : " + data);
				}
			},
			error: function (error) {
				swal("Something went wrong... try again");
			},
			processData: false,
			contentType: false,
		});
	});
}

// like dislike
function doLike(pid, uid) {
	console.log(pid, uid);
	const data = {
		uid: uid,
		pid: pid,
		operation: "like",
	};

	$.ajax({
		url: "LikeServlet",
		data: data,
		success: function (data) {
			if (data.trim() == "true") {
				let count = $(".like__counter").html();
				count++;
				$(".like__counter").html(count);
			}
		},
		erro: function (err) {
			console.log(err);
		},
	});
}
