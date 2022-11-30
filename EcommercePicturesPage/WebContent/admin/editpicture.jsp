<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- editer text -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/richtext.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.richtext.min.js"></script>
<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!--  Custom styles for this page-->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<!-- Favicon-->
<link href="img/favicon.png" rel="icon">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<!-- css of datepicker -->
<link rel="stylesheet" href="css/jquery-ui.min.css">

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
			<li class="nav-item active"><a class="nav-link"
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
			<li class="nav-item"><a class="nav-link"
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
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Edit Picture Form</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<div id="editPictureModal">
								<form action="update_picture" method="post"
									enctype="multipart/form-data">
									<div class="modal-header">
										<h4 class="modal-title" align="center">Edit Picture</h4>
									</div>
									<div class="modal-body"
										style="margin-left: 200px; margin-right: 200px">
										<div class="form-group">
											<label>Category</label> <select id="category" name="category"
												class="form-control" required>
												<c:forEach items="${listCategories}" var="cat">
													<c:if
														test="${cat.categoryId eq picture.category.categoryId}">
														<option value="${cat.categoryId}" selected>
													</c:if>
													<c:if
														test="${cat.categoryId ne picture.category.categoryId}">
														<option value="${cat.categoryId}">
													</c:if>
													${cat.name}
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<input type="hidden" id="id" value="${picture.pictureId}"
												name="id" class="form-control">
										</div>
										<div class="form-group">
											<label>Title</label> <input type="text" id="title"
												value="${picture.title}" name="title" class="form-control"
												required>
										</div>
										<div class="form-group">
											<label>Author</label> <input type="text" id="author"
												value="${picture.author}" name="author" class="form-control"
												required>
										</div>
										<div class="form-group">
											<label>Publish Date</label> <input type="date"
												id="publishDate" name="publishDate" class="form-control"
												required
												value="<fmt:formatDate pattern='yyyy-MM-dd' value='${picture.publishDate}'/>" />
										</div>
										<div class="form-group">
											<label>Picture Image</label>
											<c:if test="${picture == null}">
												<input type="file" id="image" name="eimage"
													class="form-control" required>
											</c:if>
											<c:if test="${picture != null}">
												<input type="file" id="image" name="image"
													class="form-control">
											</c:if>
											<img class="image" id="thumbnail" alt="Image Preview"
												style="width: 20%; margin-top: 10px"
												src="data:image/jpg;base64,${picture.base64Image}" />
										</div>
										<div class="form-group">
											<label>Price</label> <input type="text" id="price"
												value="${picture.price}" name="price" class="form-control"
												required>
										</div>
										<div class="form-group" class="page-wrapper box-content">
											<label>Description</label>
											<textarea rows="7" id="description" name="description"
												class="form-control" required>${picture.description}</textarea>
										</div>
										<script>
											$(document).ready(function() {
												$('#description').richText();
											});
										</script>
									</div>
									<div align="center">
										<input type="button" class="btn btn-default"
											onClick="javascript:history.go(-1)" data-dismiss="modal"
											value="Cancel"> <input type="submit"
											class="btn btn-success" value="Save">
									</div>
								</form>
							</div>
						</div>
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

	<script src="js/picture-table.js"></script>

	<!-- datepicker -->
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>

</body>

</html>