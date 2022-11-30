<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">

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
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="home" class="nav-item nav-link active" id="home">Home</a>
							<a href="view_category" class="nav-item nav-link" id="shop">Shop</a>
							<a href="view_picture?id=2" class="nav-item nav-link"
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
							<a href="#" class="btn px-0"> <i
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

	<!-- Carousel Start -->
	<div class="container-fluid mb-3">
		<div class="row px-xl-5">
			<div class="col-lg-8">
				<div id="header-carousel"
					class="carousel slide carousel-fade mb-30 mb-lg-0"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#header-carousel" data-slide-to="0"
							class="active"></li>
						<li data-target="#header-carousel" data-slide-to="1"></li>
						<li data-target="#header-carousel" data-slide-to="2"></li>
						<li data-target="#header-carousel" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item position-relative active"
							style="height: 430px;">
							<img class="position-absolute w-100 h-100" src="img/zoro.png"
								style="object-fit: cover;">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h1
										class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Anime</h1>
									<p class="mx-md-5 px-5 animate__animated animate__bounceIn">Tam
										kiếm phái</p>
									<!-- <a
										class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
										href="#">Shop Now</a> -->
								</div>
							</div>
						</div>
						<div class="carousel-item position-relative"
							style="height: 430px;">
							<img class="position-absolute w-100 h-100" src="img/yasuo.jpg"
								style="object-fit: cover;">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h1
										class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Yasuo
										Hoa Linh</h1>
									<p class="mx-md-5 px-5 animate__animated animate__bounceIn">Ha
										sa giiiiii</p>
									<!-- <a
										class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
										href="#">Shop Now</a> -->
								</div>
							</div>
						</div>
						<div class="carousel-item position-relative"
							style="height: 430px;">
							<img class="position-absolute w-100 h-100"
								src="img/phongcanh.jpg" style="object-fit: cover;">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h1
										class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Tranh
										phong cảnh</h1>
									<p class="mx-md-5 px-5 animate__animated animate__bounceIn">Vì
										mất đi ánh mặt trời</p>
									<!-- <a
										class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
										href="#">Shop Now</a> -->
								</div>
							</div>
						</div>
						<div class="carousel-item position-relative"
							style="height: 430px;">
							<img class="position-absolute w-100 h-100" src="img/lam.jpg"
								style="object-fit: cover;">
							<div
								class="carousel-caption d-flex flex-column align-items-center justify-content-center">
								<div class="p-3" style="max-width: 700px;">
									<h1
										class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Tranh
										tả thực</h1>
									<p class="mx-md-5 px-5 animate__animated animate__bounceIn">Anh
										trai học bách khoa cơ khí bỏ ngang sang học IT</p>
									<!-- <a
										class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp"
										href="#">Shop Now</a> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="product-offer mb-30" style="height: 200px;">
					<img class="img-fluid" src="img/offer-1.jpg" alt="">
					<div class="offer-text">
						<h6 class="text-white text-uppercase">Save 20%</h6>
						<h3 class="text-white mb-3">Special Offer</h3>
						<a href="" class="btn btn-primary">Shop Now</a>
					</div>
				</div>
				<div class="product-offer mb-30" style="height: 200px;">
					<img class="img-fluid" src="img/offer-2.jpg" alt="">
					<div class="offer-text">
						<h6 class="text-white text-uppercase">Save 20%</h6>
						<h3 class="text-white mb-3">Special Offer</h3>
						<a href="" class="btn btn-primary">Shop Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Carousel End -->


	<!-- Featured Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center bg-light mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-check text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">Quality Product</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center bg-light mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
					<h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center bg-light mb-4"
					style="padding: 30px;">
					<h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center bg-light mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- Featured End -->


	<!-- Categories Start -->
	<div class="container-fluid pt-5">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Categories</span>
		</h2>
		<div class="row px-xl-5 pb-3">
			<c:forEach items="${listCategory}" var="cat">
				<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
					<a class="text-decoration-none"
						href="view_category?id=${cat.categoryId}">
						<div class="cat-item img-zoom d-flex align-items-center mb-4">
							<div class="overflow-hidden" style="width: 100px; height: 100px;">
								<img class="img-fluid" src="img/cat-2.jpg" alt="">
							</div>
							<div class="flex-fill pl-3">
								<h6>${cat.name}</h6>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Categories End -->

	<!-- Products Start -->
	<div class="container-fluid pt-5 pb-3">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">New Pictures</span>
		</h2>
		<div class="row px-xl-5">
			<c:forEach items="${listNewPictures}" var="newpic">
				<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
					<div class="product-item bg-light mb-4">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-90"
								style="height: 325.788px; padding: 10px; display: block; margin-left: auto; margin-right: auto;"
								src="data:image/jpg;base64,${newpic.base64Image}" alt="">
							<div class="product-action">
								<!-- <a class="btn btn-outline-dark btn-square" href=""><i
									class="fa fa-shopping-cart"></i></a> <a
									class="btn btn-outline-dark btn-square" href=""><i
									class="far fa-heart"></i></a> <a
									class="btn btn-outline-dark btn-square" href=""><i
									class="fa fa-sync-alt"></i></a>  -->
									<a class="btn btn-outline-dark btn-square" 
									href="view_picture?id=${newpic.pictureId}"><i
									class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate"
								href="view_picture?id=${newpic.pictureId}">${newpic.title}</a>
							<div
								class="d-flex align-items-center justify-content-center mt-2">
								<h5>$${newpic.price}</h5>
								<!-- <h6 class="text-muted ml-2">
									<del>$${newpic.price}</del>
								</h6> -->
							</div>
							<div class="text-primary mr-2">
								<c:forTokens items="${newpic.ratingStars}" delims="," var="star">
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
								(${newpic.reviews.size()})
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Products End -->

	<!-- Products Start -->
	<div class="container-fluid pt-5 pb-3">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Best Selling Pictures</span>
		</h2>
		<div class="row px-xl-5">
			<c:forEach items="${listBestSellingPictures}" var="pic">
				<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
					<div class="product-item bg-light mb-4">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-90"
								style="height: 325.788px; padding: 10px; display: block; margin-left: auto; margin-right: auto;"
								src="data:image/jpg;base64,${pic.base64Image}" alt="">
							<div class="product-action">
									<a class="btn btn-outline-dark btn-square" 
									href="view_picture?id=${pic.pictureId}"><i
									class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" 
							href="view_picture?id=${pic.pictureId}">${pic.title}</a>
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
		</div>
	</div>
	<!-- Products End -->
	

	<!-- Offer Start -->
	<div class="container-fluid pt-5 pb-3">
		<div class="row px-xl-5">
			<div class="col-md-6">
				<div class="product-offer mb-30" style="height: 300px;">
					<img class="img-fluid" src="img/offer-1.jpg" alt="">
					<div class="offer-text">
						<h6 class="text-white text-uppercase">Save 20%</h6>
						<h3 class="text-white mb-3">Special Offer</h3>
						<a href="" class="btn btn-primary">Shop Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="product-offer mb-30" style="height: 300px;">
					<img class="img-fluid" src="img/offer-2.jpg" alt="">
					<div class="offer-text">
						<h6 class="text-white text-uppercase">Save 20%</h6>
						<h3 class="text-white mb-3">Special Offer</h3>
						<a href="" class="btn btn-primary">Shop Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Offer End -->

	<!-- Products Start -->
	<div class="container-fluid pt-5 pb-3">
		<h2
			class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">Most Favored Pictures</span>
		</h2>
		<div class="row px-xl-5">
			<c:forEach items="${listMostFavoredPictures}" var="pic">
				<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
					<div class="product-item bg-light mb-4">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-90"
								style="height: 325.788px; padding: 10px; display: block; margin-left: auto; margin-right: auto;"
								src="data:image/jpg;base64,${pic.base64Image}" alt="">
							<div class="product-action">
								<!-- <a class="btn btn-outline-dark btn-square" href=""><i
									class="fa fa-shopping-cart"></i></a> <a
									class="btn btn-outline-dark btn-square" href=""><i
									class="far fa-heart"></i></a> <a
									class="btn btn-outline-dark btn-square" href=""><i
									class="fa fa-sync-alt"></i></a>  -->
									<a class="btn btn-outline-dark btn-square" 
									href="view_picture?id=${pic.pictureId}"><i
									class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" 
							href="view_picture?id=${pic.pictureId}">${pic.title}</a>
							<div
								class="d-flex align-items-center justify-content-center mt-2">
								<h5>$${pic.price}</h5>
								<!-- <h6 class="text-muted ml-2">
									<del>$${pic.price + 10}</del>
								</h6> -->
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
		</div>
	</div>
	<!-- Products End -->

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