<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pictures Shop - Online Shop Website</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.png" rel="icon">


<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<style>
html, body {
	cursor:
		url("https://1.bp.blogspot.com/-qbWo9mPKO2Y/YL9utYdQBdI/AAAAAAAAFs4/mtjGu6u2uGwtJsT4gZG4lbhLV1a5lG6OQCLcBGAsYHQ/s0/mouse-f1.png"),
		auto;
}

a:hover {
	cursor:
		url("https://1.bp.blogspot.com/-nYv2dLl3oXY/YL9utYBCh8I/AAAAAAAAFtA/wII4lVw5w4k-4isGMY41heTqk8U4TJujgCLcBGAsYHQ/s0/mouse-f2.png"),
		auto;
}
</style>
	
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row bg-secondary py-1 px-xl-5">
			<div class="col-lg-6 d-none d-lg-block">
				<div class="d-inline-flex align-items-center h-100">
					<a class="text-body mr-3"
						href="https://homepagelvlshop.herokuapp.com/">About</a>
					<a class="text-body mr-3" href="${pageContext.request.contextPath}/admin/">Admin Page</a>
					<a class="text-body mr-3" href="contact.jsp">Help</a> <a
						class="text-body mr-3" href="faq.jsp">FAQs</a>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<c:if test="${loggedCustomer == null }">
						<div class="btn-group">
							<button type="button"
								class="btn btn-sm btn-light dropdown-toggle"
								data-toggle="dropdown">My Account</button>
							<div class="dropdown-menu dropdown-menu-right">
								<button class="dropdown-item" type="button"
									onclick="location.href='login'">Sign in</button>
								<button class="dropdown-item" type="button"
									onclick="location.href='register'">Sign up</button>
							</div>
						</div>
					</c:if>
					<c:if test="${loggedCustomer != null }">
						<div class="btn-group">
							<button type="button"
								class="btn btn-sm btn-light dropdown-toggle"
								data-toggle="dropdown">Hello ${loggedCustomer.fullname}</button>
							<div class="dropdown-menu dropdown-menu-right">
								<button class="dropdown-item" type="button"
									onclick="location.href='view_profile'">My profile</button>
								<button class="dropdown-item" type="button"
									onclick="location.href='view_orders'">My orders</button>
								<button class="dropdown-item" type="button"
									onclick="location.href='logout'">Sign out</button>
							</div>
						</div>
					</c:if>
					<!--  <div class="btn-group mx-2">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">USD</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">EUR</button>
                            <button class="dropdown-item" type="button">GBP</button>
                            <button class="dropdown-item" type="button">CAD</button>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">EN</button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button">FR</button>
                            <button class="dropdown-item" type="button">AR</button>
                            <button class="dropdown-item" type="button">RU</button>
                        </div>
                    </div> -->
				</div>
				<div class="d-inline-flex align-items-center d-block d-lg-none">
					<a href="" class="btn px-0 ml-2"> <i
						class="fas fa-heart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a> <a href="" class="btn px-0 ml-2"> <i
						class="fas fa-shopping-cart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a>
				</div>
			</div>
		</div>
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
			<div class="col-lg-4">
				<a href="${pageContext.request.contextPath}/home"
					class="text-decoration-none"> <span
					class="h1 text-uppercase text-primary bg-dark px-2">Pictures</span>
					<span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
				</a>
			</div>
			<div class="col-lg-4 col-6 text-left">
				<form action="search_picture" method="get">
					<div class="input-group">
						<input type="text" class="form-control" id="keyword"
							name="keyword" placeholder="Search for products">
						<div class="input-group-append">
							<input type="submit" value="Search"
								class="input-group-text bg-transparent text-primary">
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-6 text-right">
				<p class="m-0">Customer Service</p>
				<h5 class="m-0">+84 943 602 574</h5>
			</div>
		</div>
	</div>
	<!-- Topbar End -->
</body>
</html>