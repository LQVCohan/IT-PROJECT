<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="stylesheet" href="css/jquery.rateyo.min.css" />

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
								href="view_category" class="nav-item nav-link" id="shop">Shop</a>
							<a href="#" class="nav-item nav-link active" id="shop_detail">Shop
								Detail</a>
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
						class="breadcrumb-item text-dark" href="view_category">Shop</a> <span
						class="breadcrumb-item active">Shop Detail</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner bg-light">
						<div class="carousel-item active">
							<img class="w-100 h-100" style="padding: 30px;"
								src="data:image/jpg;base64,${picture.base64Image}" alt="Image">
						</div>
						<div class="carousel-item">
							<img class="w-100 h-100" style="padding: 30px;"
								src="data:image/jpg;base64,${picture.base64Image}" alt="Image">
						</div>

					</div>
					<a class="carousel-control-prev" href="#product-carousel"
						data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel"
						data-slide="next"> <i
						class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<h3>${picture.title}</h3>
					<div class="text-primary mr-2">
						<c:forTokens items="${picture.ratingStars}" delims="," var="star">
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
						(${picture.reviews.size()})
					</div>
					<h3 class="font-weight-semi-bold mb-4">$${picture.price}</h3>
					<!-- <p class="mb-4">Volup erat ipsum diam elitr rebum et dolor. Est
						nonumy elitr erat diam stet sit clita ea. Sanc ipsum et, labore
						clita lorem magna duo dolor no sea Nonumy</p> -->
					<!-- <div class="d-flex mb-3">
						<strong class="text-dark mr-3">Sizes:</strong>
						<form>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="size-1"
									name="size"> <label class="custom-control-label"
									for="size-1">XS</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="size-2"
									name="size"> <label class="custom-control-label"
									for="size-2">S</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="size-3"
									name="size"> <label class="custom-control-label"
									for="size-3">M</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="size-4"
									name="size"> <label class="custom-control-label"
									for="size-4">L</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="size-5"
									name="size"> <label class="custom-control-label"
									for="size-5">XL</label>
							</div>
						</form>
					</div> -->
					<!-- <div class="d-flex mb-4">
						<strong class="text-dark mr-3">Colors:</strong>
						<form>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="color-1"
									name="color"> <label class="custom-control-label"
									for="color-1">Black</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="color-2"
									name="color"> <label class="custom-control-label"
									for="color-2">White</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="color-3"
									name="color"> <label class="custom-control-label"
									for="color-3">Red</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="color-4"
									name="color"> <label class="custom-control-label"
									for="color-4">Blue</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" class="custom-control-input" id="color-5"
									name="color"> <label class="custom-control-label"
									for="color-5">Green</label>
							</div>
						</form>
					</div> -->
					<div class="d-flex align-items-center mb-4 pt-2">
						<button class="btn btn-primary px-3" id="buttonAddToCart">
							<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="bg-light p-30">
					<div class="nav nav-tabs mb-4">
						<a class="nav-item nav-link text-dark active" data-toggle="tab"
							href="#tab-pane-1">Description</a>
						<a class="nav-item nav-link text-dark" data-toggle="tab"
							href="#tab-pane-3">Reviews (${picture.reviews.size()})</a>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="tab-pane-1">
							<h4 class="mb-3">Product Description</h4>
							<p>${picture.description}</p>
						</div>
						<div class="tab-pane fade" id="tab-pane-2">
							<h4 class="mb-3">Additional Information</h4>
							<p>The product created by ${picture.author}</p>
							<div class="row">
								<!-- <div class="col-md-6">
									<ul class="list-group list-group-flush">
										<li class="list-group-item px-0">Sit erat duo lorem duo
											ea consetetur, et eirmod takimata.</li>
										<li class="list-group-item px-0">Amet kasd gubergren sit
											sanctus et lorem eos sadipscing at.</li>
										<li class="list-group-item px-0">Duo amet accusam eirmod
											nonumy stet et et stet eirmod.</li>
										<li class="list-group-item px-0">Takimata ea clita labore
											amet ipsum erat justo voluptua. Nonumy.</li>
									</ul>
								</div> -->
							</div>
						</div>
						<div class="tab-pane fade" id="tab-pane-3">
							<div class="row">
								<div class="col-md-6">
									<h4 class="mb-4">${picture.reviews.size()} review for
										"${picture.title}"</h4>
									<c:forEach items="${picture.reviews}" var="review">
										<div class="media mb-4">
											<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
												alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
											<div class="media-body">
												<h6>
													${review.customer.fullname}<small> - <i>${review.reviewTime}</i></small>
												</h6>
												<div class="text-primary mr-2">
													<c:forTokens items="${review.stars}" delims="," var="star">
														<c:if test="${star eq 'on'}">
															<small class="fas fa-star"></small>
														</c:if>
														<c:if test="${star eq 'off'}">
															<small class="far fa-star"></small>
														</c:if>
													</c:forTokens>
												</div>
												<p>${review.headline}</p>
												<i>${review.comment}</i>
											</div>
										</div>
									</c:forEach>
								</div>
								<c:if test="${empty loggedCustomer}">
									<div class="form-group mb-0">
										<a href="login" class="btn btn-primary px-3">Please login
											before reviewing</a>
									</div>
								</c:if>
								<c:if test="${not empty loggedCustomer}">
									<c:if test="${empty existReview}">
										<!-- Review -->
										<div class="col-md-6">
											<h4 class="mb-4">Leave a review</h4>
											<form id="reviewForm" action="submit_review" method="post">
												<div class="media mb-4">
													<img
														src="https://bootdey.com/img/Content/avatar/avatar7.png"
														alt="Image" class="img-fluid mr-3 mt-1"
														style="width: 45px;">
													<div class="media-body">
														<h6>
															${loggedCustomer.fullname} <br /> <small>${loggedCustomer.email}</small>
														</h6>
													</div>
												</div>
												<div class="d-flex my-3">
													<p class="mb-0 mr-2">Your Rating * :</p>
													<div id="rateYo"></div>
													<input type="hidden" id="rating" name="rating" value="5">
													<input type="hidden" id="pictureId" name="pictureId"
														value="${picture.pictureId}">
												</div>
												<div class="form-group">
													<label>Your Title *</label> <input id="headline"
														class="form-control" name="headline"
														placeholder="Headline or summary for your review" required>
												</div>
												<div class="form-group">
													<label>Your Review *</label>
													<textarea id="comment" name="comment" cols="30" rows="5"
														class="form-control"
														placeholder="Write your review details..." required></textarea>
												</div>
												<div class="form-group mb-0">
													<input type="submit" value="Leave Your Review"
														class="btn btn-primary px-3">
												</div>
											</form>
										</div>
									</c:if>
									<c:if test="${not empty existReview}">
										<!-- Review -->
										<div class="col-md-6 readonly">
											<h4 class="mb-4">Your review</h4>
											<form id="reviewForm" action="submit_review" method="post">
												<div class="media mb-4">
													<img
														src="https://bootdey.com/img/Content/avatar/avatar7.png"
														alt="Image" class="img-fluid mr-3 mt-1"
														style="width: 45px;">
													<div class="media-body">
														<h6>
															${loggedCustomer.fullname} <br /> <small>${loggedCustomer.email}</small>
														</h6>
													</div>
												</div>
												<div class="d-flex my-3">
													<p class="mb-0 mr-2">Your Rating * :</p>
													<div class="text-primary mr-2">
														<c:forTokens items="${existReview.stars}" delims=","
															var="star">
															<c:if test="${star eq 'on'}">
																<small class="fas fa-star"></small>
															</c:if>
															<c:if test="${star eq 'off'}">
																<small class="far fa-star"></small>
															</c:if>
														</c:forTokens>
													</div>
												</div>
												<div class="form-group">
													<label>Your Title *</label> <input id="headline"
														class="form-control" name="headline"
														value="${existReview.headline}">
												</div>
												<div class="form-group">
													<label>Your Review *</label>
													<textarea id="comment" name="comment" cols="30" rows="5"
														class="form-control">${existReview.comment}</textarea>
												</div>
											</form>
										</div>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->

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
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="js/jquery.rateyo.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
	$(document).ready(
			function() {
				
				$("#buttonAddToCart").click(function(){
					window.location = 'add_to_cart?picture_id='+ ${picture.pictureId};
				});
				
				$("#rateYo").rateYo({
					starWidth: "20px",
					fullStar: true,
					rating: 5.0,
					onSet: function(rating, rateYoInstance) {
						$("#rating").val(rating);
					},
				});

				$('.readonly').find('input, textarea, select').attr(
					'readonly', 'readonly');
					
			});
	</script>
</body>

</html>