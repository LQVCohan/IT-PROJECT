<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="Header.jsp" />
</head>

<body>
	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between bg-primary w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px;">
					<h6 class="text-dark m-0">
						<i class="fa fa-bars mr-2"></i>Categories
					</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical"
					style="width: calc(100% - 30px); z-index: 999;">
					<div class="navbar-nav w-100">
						<div class="nav-item dropdown dropright">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">Hot <i
								class="fa fa-angle-right float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute rounded-0 border-0 m-0">
								<c:forEach var="c" items="${listCategory}">
									<a href="view_category?id=${c.categoryId}"
										class="dropdown-item">${c.name}</a>
								</c:forEach>
							</div>
						</div>
						<c:forEach var="c" items="${listCategory}">
							<a href="view_category?id=${c.categoryId}"
								class="nav-item nav-link">${c.name}</a>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="index.html" class="text-decoration-none d-block d-lg-none">
						<span class="h1 text-uppercase text-dark bg-light px-2">Pictures</span>
						<span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse" action="Header.html">
						<div class="navbar-nav mr-auto py-0">
							<a href="home" class="nav-item nav-link" id="home">Home</a> <a
								href="#" class="nav-item nav-link active" id="shop">Shop</a> <a
								href="view_picture?id=2" class="nav-item nav-link"
								id="shop_detail">Shop Detail</a>
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown" id="page">Pages <i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="view_cart" class="dropdown-item">Shopping Cart</a> <a
										href="view_checkout" class="dropdown-item">Checkout</a>
								</div>
							</div>
							<a href="contact.jsp" class="nav-item nav-link" id="contact">Contact</a>
						</div>
						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="" class="btn px-0"> <i
								class="fas fa-heart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">0</span>
							</a> <a href="view_cart" class="btn px-0 ml-3"> <i
								class="fas fa-shopping-cart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">${cart.totalQuantity}</span>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="home">Home</a> <a
						class="breadcrumb-item text-dark" href="#">Shop</a> <span
						class="breadcrumb-item active">${category.name}</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Start -->
	<div class="container-fluid pb-3">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Picture List</span>
		</h2>
		<div class="row px-xl-5">
			<!-- Shop Product Start -->
					<c:if test="${fn:length(lisPictures) ==0 }">
						<h2>No results for keyword "${keyword}"!</h2>
					</c:if>
					<c:if test="${fn:length(lisPictures) > 0 }">
						<c:forEach items="${lisPictures}" var="pic">
							<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
								<div class="product-item bg-light mb-4">
									<div class="product-img position-relative overflow-hidden">
										<a href="view_picture?id=${pic.pictureId}"> <img
											class="img-fluid w-90"
											src="data:image/jpg;base64,${pic.base64Image}"
											style="height: 325.788px; padding: 10px; display: block; margin-left: auto; margin-right: auto;"
											alt="Image">
										</a>
										<div class="product-action">
											<a class="btn btn-outline-dark btn-square" 
												href="view_picture?id=${pic.pictureId}"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="text-center py-4">
										<a class="h6 text-decoration-none text-truncate"
											href="view_picture?id=${pic.pictureId}">${pic.title} </a>
										<div
											class="d-flex align-items-center justify-content-center mt-2">
											<h5>$${pic.price}</h5>
										</div>
										<div class="text-primary mr-2">
											<c:forTokens items="${pic.ratingStars}" delims="," var="star">
												<c:if test="${star eq 'on'}">
													<small class="fas fa-star"></small>
												</c:if>
												<c:if test="${star eq 'half'}">
													<small class="fas fa-star-half-alt"></small>
												</c:if>
												<c:if test="${star eq 'off'}">
													<small class="far fa-star"></small>
												</c:if>
											</c:forTokens>
											(${pic.reviews.size()})
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<div class="col-12">
						<nav>
							<form action="view_category" method="post">
							<c:if test="${ not empty  currentId}">
							<ul class="pagination justify-content-center">
								<c:if test="${currentPage gt 1}">
									<li class="page-item"><a type="number" class="page-link"
									href="view_category?id=${currentId}&offset=${currentPage-1}">Previous</a></li>
									<input type="hidden" name="offset" value="${currentPage-1}">
								</c:if>
								<c:if test="${currentPage le 1 }">
									<li class="page-item disabled"><a type="number" class="page-link">Previous</a></li>
								</c:if>
								<c:forEach begin="1" end="${countPictures}" var="offset">
								<c:if test="${currentPage eq offset}">
									<li class="page-item active"><a class="page-link" href="view_category?id=${currentId}&offset=${offset}">${offset}</a></li>
									<input type="hidden" name="offset" value="${offset}">
								</c:if>
								<c:if test="${currentPage ne offset}">
									<li class="page-item"><a class="page-link" href="view_category?id=${currentId}&offset=${offset}">${offset}</a></li>
									<input type="hidden" name="offset" value="${offset}">
								</c:if>
								</c:forEach>
								<c:if test="${currentPage lt countPictures}">
									<li class="page-item"><a type="number" class="page-link"
									href="view_category?id=${currentId}&offset=${currentPage+1}">Next</a></li>
									<input type="hidden" name="offset" value="${currentPage+1}">
								</c:if>
								<c:if test="${currentPage ge countPictures }">
									<li class="page-item disabled"><a type="number" class="page-link">Next</a></li>
								</c:if>
							</ul>
							</c:if>
							<c:if test="${ empty currentId}">
							<ul class="pagination justify-content-center">
								<c:if test="${currentPage gt 1}">
									<li class="page-item"><a type="number" class="page-link"
									href="view_category?offset=${currentPage-1}">Previous</span></a></li>
									<input type="hidden" name="offset" value="${currentPage-1}">
								</c:if>
								<c:if test="${currentPage le 1 }">
									<li class="page-item disabled"><a type="number" class="page-link">Previous</a></li>
								</c:if>
								<c:forEach begin="1" end="${countPictures}" var="offset">
								<c:if test="${currentPage eq offset}">
									<li class="page-item active"><a class="page-link" href="view_category?offset=${offset}">${offset}</a></li>
									<input type="hidden" name="offset" value="${offset}">
								</c:if>
								<c:if test="${currentPage ne offset}">
									<li class="page-item"><a class="page-link" href="view_category?offset=${offset}">${offset}</a></li>
									<input type="hidden" name="offset" value="${offset}">
								</c:if>
								</c:forEach>
								<c:if test="${currentPage lt countPictures}">
									<li class="page-item"><a type="number" class="page-link"
									href="view_category?offset=${currentPage+1}">Next</a></li>
									<input type="hidden" name="offset" value="${currentPage+1}">
								</c:if>
								<c:if test="${currentPage ge countPictures }">
									<li class="page-item disabled"><a type="number" class="page-link">Next</a></li>
								</c:if>
							</ul>
							</c:if>
							</form>
						</nav>
					</div>
				</div>
			</div>
			<!-- Shop Product End -->
		</div>
	</div>
	<!-- Shop End -->


	<!-- Footer Start -->
	<jsp:include page="Footer.jsp" />
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>