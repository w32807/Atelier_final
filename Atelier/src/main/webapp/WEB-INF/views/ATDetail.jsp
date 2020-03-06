<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Atelier | Products</title>
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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	
	<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper_RC.jsp" flush="false"/>

    <!-- 좌측바 Include -->
	<div id="colorlib-page">
		<jsp:include page="AT_LBar.jsp" flush="false"/>
		
 
		<div id="colorlib-main">
			<aside id="colorlib-hero" style="height: 400px; margin-bottom: -10px;">
				<div class="flexslider" style="height: 400px;">
					<ul class="slides" style="height: 400px;">
				   	<li style="background-image: url(resources/AT_front/images/img_bg_1.jpg);">
				   		<div class="overlay"></div>
				   		<div class="container-fluid">
				   			<div class="row">
				   			<form id="subFrm" method="get">
					   			<div class="col-md-12 col-md-offset-1 col-md-pull-1 slider-text">
					   				<div class="slider-text-inner">
					   					<div class="desc" style="background: none; top: 100px;">
					   					<input type="hidden" name="sc_cm_id" id="SC_CM_ID" value="${mb.cm_id}">
					   					<input type="hidden" name="sc_at_id" id="SC_AT_ID" value="${at.at_id}">
					   					<h1 style="font-size: 18px; font-weight: 600; width:300px;">${at_dto.at_name} 공방에 오신 것을 환영합니다.</h1>
											<c:if test="${mb.cm_id ne null}">
											<button id="subBtn" type="button" class="btn btn-primary btn-learn" style="font-weight: 600;" value="구독">&nbsp;&nbsp;&nbsp;구독&nbsp;&nbsp;&nbsp;   </button>
											</c:if>
										</div>
					   				</div>
					   			</div>
					   			</form>
					   		</div>
				   		</div>
				   	</li>
				  	</ul>
			  	</div>
			</aside>
		
			<div class="colorlib-work">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3" style="text-align: center; right: 0%;">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: 400; font-size: 20px; letter-spacing: 0.5px;">판매중인 상품<hr>
							</h2>
						</div>
					</div>
					<div class="row" style="margin-left: 175px; margin-right: 175px;">
						<c:forEach var = "pdList" items = "${pdList}">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft" style="display: table;">
							<c:forEach var = "piList" items = "${piList }">
								<c:if test = "${pdList.pd_code eq  piList.pi_pd_code}">
									<div class="project" style="background-image: url(resources/main/img/products/${piList.pi_oriname}); width: 350px; height: 280px;">
								</c:if>
							</c:forEach>
								<div class="desc" style="text-align: center;">
									<div class="con" style="margin-top: 100px;">
										<span style="font-size: 17px;">CATEGORY : #${pdList.pd_cate}</span>
										<h3><a>${pdList.pd_name}</a></h3>		
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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
	
	
	<!-- MAIN JS -->
	<script src="resources/AT_front/js/main.js"></script>
	<!-- ajax -->
	<script src="resources/js/jquery.serializeObject.js"></script>

	</body>
	
<script type="text/javascript">

		$("#subBtn").click(function(){
			if(confirm("구독 하시겠습니까?")){
				var subFrm = $("#subFrm").serializeObject();
				$.ajax({
					url: "SubFromProd",
					type: "get",
					data: subFrm,
					dataType: "json",
					success: function(data) {
						console.log("ajax 실행 결과 : " + data.subMassage);
						alert(data.subMassage);
						$("subBtn").html("&nbsp;&nbsp;&nbsp;구독 취소&nbsp;&nbsp;&nbsp");
					},
					error: function(error) {
						alert("로그인을 먼저 해 주세요.");
					}
				})
			}
		})

		/* ---------------------------------------------------------------------------------------
		 * 기   능: 공방 회원 비활성 시, 판매물품 접근 제어
		 * 작성일: 2020.02.20
		 * 작성자: JWJ 
		 -----------------------------------------------------------------------------------------*/
		 $( document ).ready(function() {
			 var responseMessage = "${message}";
		        if(responseMessage != ""){
		            alert(responseMessage)
	        }
		});

</script>
</html>

