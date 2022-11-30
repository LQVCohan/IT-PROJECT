<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FAQs-Pictures Shop</title>

	<!-- Favicon -->
	<link href="img/favicon.png" rel="icon">

	<!-- Customized Bootstrap Stylesheet -->
	<link rel="stylesheet" type="text/css" href="css/faqstyle.css">

</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<!-- Topbar End -->
	<div class="container">
		<h2>Frequently Asked Questions</h2>
		<div class="accordion">
			<div class="accordion-item">
				<button id="accordion-button-1" aria-expanded="false">
					<span class="accordion-title">Chính sách hoàn trả là gì?</span><span
						class="icon" aria-hidden="true"></span>
				</button>
				<div class="accordion-content">
					<p>
						Với những sản phẩm bạn đã mua tại PIPG, 30 ngày kể từ khi bạn nhận
						sản phẩm thì bạn sẽ được đổi hàng và trả hàng với bất kỳ lý do gì.
						<br>Lưu ý: <br>(1) PIPG sẽ không áp dụng đổi trả với
						những sản phẩm bị hỏng hóc vì các lí do chủ quan của khách hàng. <br>(2)
						Khách hàng có thể chọn hình thức hoàn tiền: tiền mặt, tính dụng
						lưu trữ. <br>(3) Để được tư vấn trực tiếp về vấn đề hoàn trả,
						xin vui lòng liên hệ dịch vụ CSKH +84 943 602 574.
					</p>
				</div>
			</div>
			<div class="accordion-item">
				<button id="accordion-button-2" aria-expanded="false">
					<span class="accordion-title">​Các tùy chọn vận chuyển?</span><span
						class="icon" aria-hidden="true"></span>
				</button>
				<div class="accordion-content">
					<p>Sau khi đơn hàng của bạn được PIPG xác nhận và hoàn thành
						đóng gói, kiện hàng sẽ được giao cho đơn vị vận chuyển
						ViettelPost. Ngoài ra, khách hàng có thể tự vận chuyển bằng phương
						tiện cá nhân.</p>
				</div>
			</div>
			<div class="accordion-item">
				<button id="accordion-button-3" aria-expanded="false">
					<span class="accordion-title">​Khi nào tôi sẽ nhận được đơn
						đặt hàng của mình?</span><span class="icon" aria-hidden="true"></span>
				</button>
				<div class="accordion-content">
					<p>Tùy theo vị trí của bạn mà đơn hàng có thể giao thành công
						sớm hay muộn. Trung bình thời gian giao đến khu vực TPHCM là 3
						ngày và từ ngày 5 đến ngày 7 đối với các tỉnh thành còn lại.</p>
				</div>
			</div>
			<div class="accordion-item">
				<button id="accordion-button-4" aria-expanded="false">
					<span class="accordion-title">​Tôi phải làm gì nếu tôi chưa
						nhận được đơn đặt hàng của mình?</span><span class="icon"
						aria-hidden="true"></span>
				</button>
				<div class="accordion-content">
					<p>Bạn có thể kiểm tra tình trạng đơn hàng thông qua......."để
						từ từ thầy xem xem nhóm mình làm cái tra cứu đơn hàng như nào"</p>
				</div>
			</div>
			<div class="accordion-item">
				<button id="accordion-button-5" aria-expanded="false">
					<span class="accordion-title">​Tôi phải làm gì nếu tôi nhận
						được một đơn hàng bị lỗi?</span><span class="icon" aria-hidden="true"></span>
				</button>
				<div class="accordion-content">
					<p>Trong quá trình đóng gói, PIPG luôn cam kết 100% về chất
						lượng sản phẩm. Trường hợp hàng lỗi rất có thể là do gặp trục trặc
						trong quá trình vận chuyển. Trong trường hợp này, bạn vui lòng
						liên hệ ngay CSKH để được hướng dẫn đổi trả đơn hàng.</p>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp" />
	<script language="javascript" src="js/faqscript.js"></script>
</html>
