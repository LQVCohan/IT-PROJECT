<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form id="CreateCustomer">
		<div class="form-group">
			<label>Password</label> <input type="password" id="password"
				name="password" class="form-control" required>
		</div>
		<div class="form-group">
			<label>Confirm password</label> <input type="password"
				id="confirmPassword" name="confirmPassword" class="form-control"
				required>
		</div>
	</form>
	<!-- Valid -->
	<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#CreateCustomer").validate({
			rules: {
				email: {
					required: true,
					email: true
				},
				fullName: required,
				password: required,
				phone: required,
				address: required,
				city: required,
				country: required,
				password: required,
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
			},

			messages: {
				email: {
					required: "",
					email: ""
				},
				fullName: "",
				password: "",
				phone: "",
				address: "",
				city: "",
				country: "",
				password: "",
				confirmPassword: {
					required: "",
					equalTo: "aaa"
				},
			}
		});
	});
	</script>
</body>
</html>