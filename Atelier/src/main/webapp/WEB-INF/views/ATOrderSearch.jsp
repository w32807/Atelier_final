<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Atelier | Atelier</title>
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
			<div class="colorlib-services" style="margin-left: 100px;">
				<div class="container-fluid" style="min-height: 450px;">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">발주 조회<hr>
							</h2>
						</div>
					</div>
                  	<form action="ATOrderSearch" method="get" id="rawCancleFrm">
						<div class="row">
							<div class="col-md-6">
								<c:forEach begin="0" step="2" var="atoList" items ="${atoList}">
									<div class="colorlib-feature animate-box" data-animate-effect="fadeInLeft"
										style="margin-bottom: 30px;">
										<label>
											<div class="colorlib-icon" style="width: 130px; height: 130px;">
												<i class="icon-tag"></i>
											</div>
											<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400;">
												<h3 style="display: inline-block; font-size: 18px;">
													<b>${atoList.ro_type}</b>
												</h3>	
												<input type="checkbox" name="rmProdCancleChk" value="${atoList.ro_num}"><br>
												<b>날짜</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_dateSimple}</span><br>
												<b>수량</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_count}</span><br>
												<b>단가</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_rm_price}원</span><br>											
											</div>
										</label>
									</div>
								</c:forEach>
							</div>
							
							<div class="col-md-6"><!--여기가 물건의 2열 시작-->
								<c:forEach begin="1" step="2" var="atoList" items ="${atoList}">
									<div class="colorlib-feature animate-box" data-animate-effect="fadeInLeft" style="margin-bottom: 30px;">
										<label>
											<div class="colorlib-icon" style="width: 130px; height: 130px;">
												<i class="icon-tag"></i>
											</div>
											<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400;">
												<h3 style="display: inline-block; font-size: 18px;">
													<b>${atoList.ro_type}</b>
												</h3>	
												<input type="checkbox" name="rmProdCancleChk" value="${atoList.ro_num}"><br>
												<b>날짜</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_dateSimple}</span><br>
												<b>수량</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_count}</span><br>
												<b>단가</b><span>&nbsp;&nbsp;&nbsp;${atoList.ro_rm_price}원</span><br>
											</div>
										</label>	
									</div>
								</c:forEach>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

				  <div class="colorlib-feature animate-box" style="text-align: right; width: 1100px; height: 200px;" >
					
					 <input id="cancleBtn" type="button" name="serch" value="취소하기"
					 	style="width: 100px; height: 35px; border: none; font-size: 16px; color: white; background-color: #A09182;">
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
	
	<script type="text/javascript">
	//1. 아무것도 체크하지 않고 취소를 눌렀을 때.
	//2. n개의 상품을 취소하시겠습니까?
	//3. 체크박스에 해당 상품의 상품코드를 value로 넘김		
	$("#cancleBtn").click(function() {
		var chkLength = $("input:checkbox[name=rmProdCancleChk]:checked").length;//체크박스에 체크가 되어있는 갯수를 구함
		if(chkLength == 0){
			alert("취소할 상품을 선택 해주세요.");
		}else {
			if(confirm("정말 "+chkLength+"개의 발주를 취소하시겠습니까?")){
				$("#rawCancleFrm").submit();
			}else {
				location.reload();
			}
		}
	});
	</script>
</body>
</html>

