<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Atelier | My Page</title>

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
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/style.css"
	type="text/css">

<!-- Modernizr JS -->
<script src="resources/AT_front/js/modernizr-2.6.2.min.js"></script>

<style type="text/css">
#profile-photo {
	height: auto;
}
</style>

</head>

<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>


	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/"><i class="fa fa-home"></i> Home</a> <span>My
							Page</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Blog Section Begin -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<!-- 마이페이지 좌측바 Include -->
                <jsp:include page="myPageLBar.jsp" flush="false"/>
                
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="row">

						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box"
								data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px; margin-left: 30px;">
								쪽지
								<hr>
							</h2>
						</div>




						<div id="messager" class="col-md-12 animate-box"
							data-animate-effect="fadeInLeft" style="margin: 0px auto;">
							<div class="about-desc"></div>
							<div class="fancy-collapse-panel">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">


									<!-- 각각의 heading숫자 ,  collapse숫자는 모두 for문으로 숫자들을 1개씩 증가시켜주세요. -->
									
									<c:forEach var="bitem" items="${bList}" >
									<c:if test="${bitem.mg_check eq 'F'}">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="heading${bitem.mg_num}" >
											<h4 class="panel-title">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#collapse${bitem.mg_num}"
													aria-expanded="false" aria-controls="collapse${bitem.mg_num}"
													style="font-weight: bold;">${bitem.mg_sender}</a>
												 <input type="hidden" name="mg_num" value="${bitem.mg_num}">
												 <input type="hidden" name="mg_num" value="${bitem.mg_num}">
													</h4>
												</div>
												<div id="collapse${bitem.mg_num}" class="panel-collapse collapse"
													role="tabpanel" aria-labelledby="heading${bitem.mg_num}">
													<div class="panel-body" style="font-size: 15px">
														${bitem.mg_contents}
														<form action="myMessageWrite" method="get">
															<%-- <input type="hidden" name="mg_sender" value="${mb.cm_id}">
															<input type="hidden" name="mg_receiver"
																value="${bitem.mg_sender}">  --%>
																<input type="hidden"
																name="mg_num" value="${bitem.mg_num}"> 
																<input type="submit" value="답장" id="submit"
																style="border: thick; float: right;">
														</form>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
									<div>${paging}</div>
									<!-- 여기까지 쪽지 1개 -->

								</div>
							</div>
						</div>

						<!-- 여기까지 쪽지입니다. -->
					</div>

				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false"/>

	<!-- Js Plugins -->
	<script src="<c:url value="/resources/main/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery-ui.min.js"/>"></script>
	<script
		src="<c:url value="/resources/main/js/jquery.countdown.min.js"/>"></script>
	<script
		src="<c:url value="/resources/main/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/resources/main/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/main.js"/>"></script>

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

	<script src="text/javascript">
		$("#submit").click(function(){
	})
	</script>

</body>

</html>