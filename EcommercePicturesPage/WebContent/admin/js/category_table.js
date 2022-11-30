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
function toEditModal(id, name) {
	modal = document.getElementById('editCategoryModal');
	/* 	modal.style.display = 'block'; */

	id = document.getElementById('id').value = id;
	viewid = document.getElementById('viewid').value = id;
	namee = document.getElementById('name').value = name;
	/* 	
		window.onclick = function(){
			if(event.target == editEmployeeModal){
				modal.style.display ='none'	;
			}
		} */
}
function toDeleteModal(id) {
	modal = document.getElementById('deleteCategoryModal');
	/* modal.style.display = 'block'; */

	idd = document.getElementById('idd').value = id;
	viewidd = document.getElementById('viewidd').value = id;

	/* window.onclick = function(){
		if(event.target == editEmployeeModal){
			modal.style.display ='none'	;
		}
	} */
}