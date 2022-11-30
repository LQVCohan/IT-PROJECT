<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ECOPIC-Register</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<c:if test="${message != null}">
									<div class="h4 text-gray-900 mb-4">
										<i><h4>${message}</h4></i>
									</div>
								</c:if>
								<br />
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form action="register_customer" method="post" class="user"
								id="CustomerForm">
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="fullName" name="fullName" placeholder="Full Name" required>
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="email" name="email" placeholder="Email Address" required>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="phone" name="phone" placeholder="Phone Number" required>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="address" name="address" placeholder="Address" required>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="city" name="city" placeholder="City" required>
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user"
											id="country" name="country" placeholder="Country" required>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="password" name="password" placeholder="Password" required>
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="confirmPassword" name="confirmPassword"
											placeholder="Repeat Password" required>
									</div>
								</div>
								<input type="submit" class="btn btn-primary btn-user btn-block"
									id="RegisterBtn" value="Register Account">
								<hr>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Valid -->
	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="js/customer.js"></script>

</body>

</html>