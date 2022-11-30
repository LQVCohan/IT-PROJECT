function toDeleteModal(id) {

	idd = document.getElementById('idd').value = id;
	viewidd = document.getElementById('viewidd').value = id;

}
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