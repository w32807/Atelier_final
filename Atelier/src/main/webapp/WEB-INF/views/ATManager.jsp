<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Atelier | My Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/AT_front/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/AT_front/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/AT_front/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="resources/AT_front/css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="resources/AT_front/css/style.css">
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/style.css" type="text/css">
    
	<!-- Modernizr JS -->
	<script src="resources/AT_front/js/modernizr-2.6.2.min.js"></script>

	</head>
	<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>

    <!-- 좌측바 Include -->
	<div id="colorlib-page">
		<jsp:include page="ATM_LBar.jsp" flush="false"/>
	
		<div id="colorlib-main">
			<div class="colorlib-contact" style="padding-bottom: 7.5em;">
				<div class="container-fluid" style="margin-left: 100px;">
					<div class="row">
						<div class="col-md-12">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">공방 정보<hr>
							</h2>
						</div>
					</div>
					<div class="row" style="padding-left: 200px;">
						<div class="col-md-5 col-md-push-6" style="left: 50px;">
							<div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
								<div class="colorlib-icon" style="background-color: white;">
									<img src="resources/AT_front/images/subscribe.png" style="width: 100px; padding-bottom: 0px;">
								</div>
								<div class="colorlib-icon" style="margin: 0 230px; background-color: white;">
									<img src="resources/AT_front/images/product.png" style="width: 100px; padding-bottom: 0px;">
								</div>
								<div class="colorlib-icon" style="margin: 0 460px; background-color: white;">
									<img src="resources/AT_front/images/machine.png" style="width: 100px; padding-bottom: 0px;">
								</div>
							</div>
							<div class="colorlib-text" style="margin-top: 120px; width: 900px; font-size: 18px;">
								<span><a href="#" style="margin-left: 2px; color: #A09182; font-weight: bolder;">구독자 수</a></span>
								<span style="font-weight: bolder;">${subNum}</span>
								<span><a href="#" style="margin-left: 125px; color: #A09182; font-weight: bolder;">등록된 상품</a></span>
								<span style="font-weight: bolder;">${prodNum}</span>
								<span><a href="#" style="margin-left: 130px; color: #A09182; font-weight: bolder;">제품 오더</a></span>
								<span style="font-weight: bolder;">${orderNum}</span>
							</div>
						</div>
						<div class="col-md-7 col-md-pull-5">
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="colorlib-services" style="margin-left: 100px; min-height: 400px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
						
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">발주 정보<hr></h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6"   style="left: 50px">
							<c:forEach begin="0" step="2" var="atmList" items ="${atmList}">
							<div class="colorlib-feature animate-box"
								data-animate-effect="fadeInLeft" style="margin-bottom: 30px;">
								<div class="colorlib-icon" style="width: 130px; height: 130px;">
									<i class="icon-tag"></i>
								</div>
								<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400;">
									<h3 style="display: inline-block; font-size: 18px; margin-bottom: 16px;">
										<b>${atmList.ro_type}</b>
									</h3><br>
										<b>날짜</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_dateSimple}</span><br>
										<b>수량</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_count}</span><br>
										<b>단가</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_rm_price}원</span><br>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="col-md-6" style="left: -70px;">
						<c:forEach begin="1" step="2" var="atmList" items ="${atmList}">
							<div class="colorlib-feature animate-box"
								data-animate-effect="fadeInLeft" style="margin-bottom: 30px;">
								<div class="colorlib-icon" style="width: 130px; height: 130px;">
									<i class="icon-paperplane"></i>
								</div>
								<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400;">
									<h3 style="display: inline-block; font-size: 18px; margin-bottom: 16px;">
										<b>${atmList.ro_type}</b>
									</h3><br>
										<b>날짜</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_dateSimple}</span><br>
										<b>수량</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_count}</span><br>
										<b>단가</b><span>&nbsp;&nbsp;&nbsp;${atmList.ro_rm_price}원</span><br>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false"/>

    <!-- Js Plugins -->
    <script src="resources/main/js/jquery-3.3.1.min.js"></script>
    <script src="resources/main/js/bootstrap.min.js"></script>
    <script src="resources/main/js/jquery-ui.min.js"></script>
    <script src="resources/main/js/jquery.countdown.min.js"></script>
    <script src="resources/main/js/jquery.nice-select.min.js"></script>
    <script src="resources/main/js/jquery.zoom.min.js"></script>
    <script src="resources/main/js/jquery.dd.min.js"></script>
    <script src="resources/main/js/jquery.slicknav.js"></script>
    <script src="resources/main/js/owl.carousel.min.js"></script>
    <script src="resources/main/js/main.js"></script>
    
	<!-- jQuery -->
	<script src="resources/AT_front/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/AT_front/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/AT_front/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/AT_front/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/AT_front/js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="resources/AT_front/js/sticky-kit.min.js"></script>
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="resources/AT_front/js/google_map.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="resources/AT_front/js/main.js"></script>

	</body>
</html>

