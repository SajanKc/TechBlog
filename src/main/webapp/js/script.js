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
});
