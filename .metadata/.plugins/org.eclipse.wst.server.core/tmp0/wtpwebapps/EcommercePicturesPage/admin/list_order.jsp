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
<!-- css of datepicker -->
<link rel="stylesheet" href="css/jquery-ui.min.css">

<!-- editer text -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.richtext.min.js"></script>

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
			<li class="nav-item"><a class="nav-link"
				href="list_pictures"> <i class="fas fa-fw fa-table"></i> <span>Product</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="list_customer"> <i class="fas fa-fw fa-table"></i> <span>Customer
						Tables</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<!-- Nav Item - Tables -->
			<li class="nav-item "><a class="nav-link"
				href="list_review"> <i class="fas fa-fw fa-table"></i> <span>Review
						Tables</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<!-- Nav Item - Tables -->
			<li class="nav-item active "><a class="nav-link"
				href="#"> <i class="fas fa-fw fa-table"></i> <span>Order
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

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">OrdersDataTable</h6>
							<br />
							<c:if test="${message != null}">
								<div class="modal-header">
									<i><h4>${message}</h4></i>
								</div>
							</c:if>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead align="center">
											<tr>
												<th>Index</th>
												<th>Order ID</th>
												<th>Ordered By</th>
												<th>Picture Copies</th>
												<th>Total</th>
												<th>Payment Method</th>
												<th>Status</th>
												<th>Order Date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tfoot align="center">
											<tr>
												<th>Index</th>
												<th>Order ID</th>
												<th>Ordered By</th>
												<th>Picture Copies</th>
												<th>Total</th>
												<th>Payment Method</th>
												<th>Status</th>
												<th>Order Date</th>
												<th>Action</th>
											</tr>
										</tfoot>
										<tbody align="center">
											<c:forEach var="order" items="${listOrder}"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>${order.orderId}</td>
													<td>${order.customer.fullname}</td>
													<td>${order.pictureCopies}</td>
													<td><fmt:formatNumber value= "${order.total}" 
														type="currency" currencySymbol="$"/></td>
													<td>${order.paymentMethod}</td>
													<td>${order.status}</td>
													<td>${order.orderDate}</td>
													<td align="center">
														<a href="view_order?id=${order.orderId}"
														class="btn btn-success"><i
															class="material-icons">&#xE148;</i> <span>Detail</span>
														</a><br/><br/> 
														<a href="edit_order?id=${order.orderId}"
														class="btn btn-success"><i
															class="material-icons">&#xE147;</i> <span>Edit</span>
														</a><br/><br/> 
														<a href="#deleteOrderModal"
														onClick="toDeleteOrderModal('${order.orderId}')"
														class="btn btn-danger" data-toggle="modal"> <i
															class="material-icons">&#xE15C;</i> <span>Delete</span>
														</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Delete Modal HTML -->
				<div id="deleteOrderModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="delete_order">
								<div class="modal-header">
									<h4 class="modal-title">Delete Order</h4>
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
									<p>Are you sure you want to delete these Order?</p>
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
	
	<script type="text/javascript">
		function toDeleteOrderModal(id) {
			idd = document.getElementById('idd').value = id;
			viewidd = document.getElementById('viewidd').value = id;
		}
	</script>
	
</body>
</html>