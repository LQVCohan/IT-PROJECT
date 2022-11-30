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

<title>Manager Product - Tables</title>

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
<!-- css of datepicker -->
<link rel="stylesheet" href="css/jquery-ui.min.css">

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
					SB Admin <sup>super</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Extension</div>


			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="list_users">
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
			<li class="nav-item active "><a class="nav-link"
				href="list_order"> <i class="fas fa-fw fa-table"></i> <span>Order
						Tables</span></a></li>

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
					<form action="update_order" method="post" id="orderForm">
						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">Edit Order ID :
							${order.orderId}</h1>

						<!-- DataTales Overview -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<div class="card-body"
									style="margin-left: 200px; margin-right: 200px">
									<div class="table-responsive">
										<table class="table table-bordered" width="100%"
											cellspacing="0">
											<thead>
												<tr>
													<th>Ordered By</th>
													<td style="width: 80%;">${order.customer.fullname}</td>
												</tr>
												<tr>
													<th>Order Date</th>
													<td style="width: 80%;">${order.orderDate}</td>
												</tr>
												<tr>
													<th>Recipient Name</th>
													<td style="width: 80%;"><input type="text"
														name="recipientName" class="form-control"
														value="${order.recipientName}" required></td>
												</tr>
												<tr>
													<th>Recipient Phone</th>
													<td style="width: 80%;"><input type="text"
														name="recipientPhone" class="form-control"
														value="${order.recipientPhone}" required></td>
												</tr>
												<tr>
													<th>Ship To</th>
													<td style="width: 80%;"><input type="text"
														name="shippingAddress" class="form-control"
														value="${order.shippingAddress}" required></td>
												</tr>
												<tr>
													<th>Payment Method</th>
													<td style="width: 80%;"><select name="paymentMethod"
														class="form-control" required>
															<option value="${order.paymentMethod}" selected="selected">${order.paymentMethod}</option>
															<option value="Cash On Delivery">Cash On
																Delivery</option>
															<option value="Paypal">Paypal</option>
													</select></td>
												</tr>
												<tr>
													<th>Order Status</th>
													<td style="width: 80%;"><select name="orderStatus"
														class="form-control" required >
															<option value="${order.status}" selected="selected">${order.status}</option>
															<option value="Processing">Processing</option>
															<option value="Shipping">Shipping</option>
															<option value="Delivered">Delivered</option>
															<option value="Completed">Completed</option>
															<option value="Cancelled">Cancelled</option>
													</select></td>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h2 class="m-0 font-weight-bold text-primary" align="center">Ordered
									Pictures</h2>
								<br />
								<div class="card-body">
									<div class="table-responsive">
										<div class="col-sm-6">
											<a href="#addPictureModal" class="btn btn-success"
												data-toggle="modal"><i class="material-icons">&#xE147;</i>
												<span>Add Picture</span></a>
										</div>
										<c:if test="${message != null}">
											<div class="modal-header">
												<i><h4>${message}</h4></i>
											</div>
										</c:if>
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<thead align="center">
												<tr>
													<th>Index</th>
													<th>Picture Title</th>
													<th>Author</th>
													<th>Price</th>
													<th>Quantity</th>
													<th>Sub Total</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody align="center">
												<c:forEach var="orderDetail" items="${order.orderDetails}"
													varStatus="status">
													<tr>
														<td style="vertical-align: middle;">${status.index + 1}</td>
														<td style="vertical-align: middle;">${orderDetail.picture.title}</td>
														<td style="vertical-align: middle;">${orderDetail.picture.author}</td>
														<td style="vertical-align: middle;">
															<input type="hidden" name="price" value="${orderDetail.picture.price}">
															<fmt:formatNumber
																value="${orderDetail.picture.price}" type="currency"
																currencySymbol="$" /></td>
														<td style="vertical-align: middle; width: 100px">
															<input type="hidden" name="pictureId" value="${orderDetail.picture.pictureId}">
															<input type="text" name="quantity${status.index + 1}"
															class="form-control text-center"
															value="${orderDetail.quantity}" required></td>
														<td style="vertical-align: middle;"><fmt:formatNumber
																value="${orderDetail.subtotal}" type="currency"
																currencySymbol="$" /></td>
														<td style="vertical-align: middle;"><a
															href="#deletePictureModal"
															onClick="toDeletePictureModal('${orderDetail.picture.pictureId}')"
															class="btn btn-danger" data-toggle="modal"> <i
																class="material-icons">&#xE15C;</i> <span>Remove</span>
														</a></td>
													</tr>
												</c:forEach>
												<tr align="center">
													<th style="vertical-align: middle;" colspan="4"
														align="right">TOTAL</th>
													<td style="vertical-align: middle;">${order.pictureCopies}</td>
													<td style="vertical-align: middle;"><fmt:formatNumber
															value="${order.total}" type="currency" currencySymbol="$" /></td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div align="center">
											<button type="submit" class="btn btn-success"><i
												class="material-icons">&#xE147;</i> <span>Save</span> </button>
											&nbsp;&nbsp;&nbsp;&nbsp; 
											<a onClick="javascript:window.location.href='list_order';"
												class="btn btn-danger"> <i
												class="material-icons">&#xE151;</i> <span>Cancel</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>



				<!-- Delete Modal HTML -->
				<div id="deletePictureModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="remove_picture_from_order">
								<div class="modal-header">
									<h4 class="modal-title">Delete Picture</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>ID</label> <input disabled type="text" id="viewidd"
											name="viewidd" class="form-control" required> <input
											type="hidden" id="idd" name="idd" class="form-control"
											required>
									</div>
									<p>Are you sure you want to delete these Picture?</p>
									<p class="text-warning">
										<small>This action cannot be undone.</small>
									</p>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel"> <input
										type="submit" class="btn btn-danger" value="Delete">
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Add Modal HTML -->
				<div id="addPictureModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="add_picture_to_order" method="post">
								<div class="modal-header">
									<h4 class="modal-title">Add picture to Order ID:
										${order.orderId}</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>Select a picture</label> <select id="pictureId"
											name="pictureId" class="form-control" required>
											<c:forEach items="${listPictures}" var="pic">
												<option value="${pic.pictureId}">${pic.title}-
													${pic.author}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label>Number of Copies</label> <select id="quantity"
											name="quantity" class="form-control" required>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel"> <input
										type="submit" class="btn btn-success" value="Add">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#orderForm").validate({
						rules : {
							<c:forEach items="${order.orderDetails}" var="item" varStatus="status">
								quantity${status.index + 1} : 
								{
									number : true,
									min : 1
								},						
							</c:forEach>
						},

						messages : {
							<c:forEach items="${order.orderDetails}" var="item" varStatus="status">
								quantity${status.index + 1} : 
								{
									number : "Quantity must be a number",
									min : "Quantity must be greater than 0"
								},						
							</c:forEach>
						}
					});
				});
		function toDeletePictureModal(id) {
			idd = document.getElementById('idd').value = id;
			viewidd = document.getElementById('viewidd').value = id;
		}
	</script>
</body>
</html>