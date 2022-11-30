$(document).ready(function() {
	$("#CustomerForm").validate({
		rules: {
			confirmPassword: {
				equalTo: "#password"
			},
		},

		messages: {
			confirmPassword: {
				equalTo: "Confirm password does not match password!"
			},
		}
	});
});