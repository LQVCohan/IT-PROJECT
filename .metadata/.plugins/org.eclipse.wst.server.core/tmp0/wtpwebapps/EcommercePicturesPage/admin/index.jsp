<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Dashboard</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<!-- Favicon -->
<link href="img/favicon.png" rel="icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- script hỗ trợ phân trang -->
<script src="js/jquery-3.6.1.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${pageContext.request.contextPath}/admin/">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					SB Admin <sup>2</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Extension</div>


			<!-- Nav Item - Tables -->
			<li class="nav-item "><a class="nav-link" href="list_users">
					<i class="fas fa-fw fa-table"></i> <span>User Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="list_category">
					<i class="fas fa-fw fa-table"></i> <span>Category</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="list_pictures">
					<i class="fas fa-fw fa-table"></i> <span>Product</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="list_customer">
					<i class="fas fa-fw fa-table"></i> <span>Customer Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Nav Item - Tables -->
			<li class="nav-item "><a class="nav-link" href="list_review">
					<i class="fas fa-fw fa-table"></i> <span>Review Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="list_order">
					<i class="fas fa-fw fa-table"></i> <span>Order Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="header.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h2 class="m-0 font-weight-bold text-primary" align="center">Recent Ordered
								Pictures</h2>
							<br />
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead align="center">
											<tr>
												<th>Order ID</th>
												<th>Ordered By</th>
												<th>Picture Copies</th>
												<th>Total</th>
												<th>Payment Method</th>
												<th>Status</th>
												<th>Order Date</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:forEach var="order" items="${listMostRecentSales}"
												varStatus="status">
												<tr>
													<td style="vertical-align: middle;"><a
														href="view_order?id=${order.orderId}">${order.orderId}</a></td>
													<td style="vertical-align: middle;">${order.customer.fullname}</td>
													<td style="vertical-align: middle;">${order.pictureCopies}</td>
													<td style="vertical-align: middle;"><fmt:formatNumber
															value="${order.total}" type="currency" currencySymbol="$" /></td>
													<td style="vertical-align: middle;">${order.paymentMethod}</td>
													<td style="vertical-align: middle;">${order.status}</td>
													<td style="vertical-align: middle;">${order.orderDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Middle Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h2 class="m-0 font-weight-bold text-primary" align="center">Recent
								Reviews</h2>
							<br />
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead align="center">
											<tr>
												<th>Picture</th>
												<th>Rating</th>
												<th>Headline</th>
												<th>Customer</th>
												<th>Review On</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:forEach var="review" items="${listMostRecentReviews}">
												<tr>
													<td style="vertical-align: middle;">${review.picture.title}</td>
													<td style="vertical-align: middle;">${review.rating}</td>
													<td style="vertical-align: middle;"><a
														href="edit_review?id=${review.reviewId}">${review.headline}</a></td>
													<td style="vertical-align: middle;">${review.customer.fullname}</td>
													<td style="vertical-align: middle;">${review.reviewTime}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Last Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h2 class="m-0 font-weight-bold text-primary" align="center">Statistics</h2>
							<br />
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead align="center">
											<tr>
												<th>Total Users</th>
												<th>Total Pictures</th>
												<th>Total Customers</th>
												<th>Total Reviews</th>
												<th>Total Orders</th>
											</tr>
										</thead>
										<tbody align="center">
											<tr>
												<td><a href="list_users">${totalUsers}</a></td>
												<td><a href="list_pictures">${totalPictures}</a></td>
												<td><a href="list_customer">${totalCustomers}</a></td>
												<td><a href="list_review">${totalReviews}</a></td>
												<td><a href="list_order">${totalOrders}</a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>