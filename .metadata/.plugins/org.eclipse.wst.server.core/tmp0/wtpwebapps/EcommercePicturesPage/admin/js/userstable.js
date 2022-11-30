/*function validateFormInput() {
	var fieldEmail = document.getElementById("emaill");
	var fieldFullname = document.getElementById("fullnamee");
	var fieldEPassword = document.getElementById("passwordd");
	if (fieldEmail.value.length == 0) {
		alert("Email is required!");
		fieldEmail.focus();
		return false;
	}
	if (fieldFullname.value.length == 0) {
		alert("User is required!");
		fieldEmail.focus();
		return false;
	}
	if (fieldPassword.value.length < 6) {
		alert("Password must be more than 5 characters!");
		fieldEmail.focus();
		return false;
	}
	return true;
}*/
function toEditModal(id, name, email, pass) {
	modal = document.getElementById('editEmployeeModal');
	/* 	modal.style.display = 'block'; */

	id = document.getElementById('id').value = id;
	viewid = document.getElementById('viewid').value = id;
	fullname = document.getElementById('fullname').value = name;
	email = document.getElementById('email').value = email;
	password = document.getElementById('password').value = pass;
	/* 	
		window.onclick = function(){
			if(event.target == editEmployeeModal){
				modal.style.display ='none'	;
			}
		} */
}
function toDeleteModal(id) {
	modal = document.getElementById('deleteEmployeeModal');
	/* modal.style.display = 'block'; */

	idd = document.getElementById('idd').value = id;
	viewidd = document.getElementById('viewidd').value = id;

	/* window.onclick = function(){
		if(event.target == editEmployeeModal){
			modal.style.display ='none'	;
		}
	} */
}