function toDeleteModal(id) {

	idd = document.getElementById('idd').value = id;
	viewidd = document.getElementById('viewidd').value = id;

}

$(document).ready(function() {

	$("#image").change(function() {
		showImageThumbnail(this);
	});
	
});

function showImageThumbnail(fileInput) {
	var file = fileInput.files[0];

	var reader = new FileReader();

	reader.onload = function(e) {
		$('#thumbnail').attr('src', e.target.result)
	};

	reader.readAsDataURL(file);
}
