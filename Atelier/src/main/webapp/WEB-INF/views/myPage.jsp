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

<style type="text/css">
.btn-warning {
	color: #fff;
	font-size: .945rem;
}
</style>
</head>

<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false" />


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
                    <div class="row" style="margin-left: 50px;">
                            <div class="myPage_main">
                            <!-- 
                            	마이페이지 메인
                             -->
							<div>
								<h4>My Informations</h4>
								<ul style="margin-left: 50px;">
									<li style="font-weight: bold; float: left; display: inline-block; margin-right: 100px;">
										<img src="./resources/main/img/mypage-1.png" alt="delivery" width="120px">
										<p style="font-size: 18px; font-weight: bolder; margin-left: -10px;">배송중인 상품&nbsp;
										<a href="myOrder?po_cm_id=${mb.cm_id}">${sendingProd}</a></p>
									</li>
									<li style="font-weight: bold; float: left; display: inline-block; margin-right: 100px;">
										<img src="./resources/main/img/mypage-2.png" alt="subscribe" width="120px">
										<p style="font-size: 18px; font-weight: bolder; margin-left: -10px;">구독 중인 공방&nbsp;
										<a href="mySubscript?sc_cm_id=${mb.cm_id}">${subscribedNum}</a></p>
									</li>
									<li style="font-weight: bold; float: left; display: inline-block; margin-right: 100px;">
										<img src="./resources/main/img/mypage-3.png" alt="message" width="120px">
										<p style="font-size: 18px; font-weight: bolder; margin-left: -10px;">읽지 않은 쪽지&nbsp;
										<a href="messager?mg_receiver=${mb.cm_id}">${uncheckedMessageNum}</a></p>
									</li>
								</ul>
							</div>

							<div class="myInfo_middle" style="padding-top: 50px;">
								<h4>주문 / 배송 중인 상품</h4>
								<div class="row">
									<div class="col-lg-12">
										<section class="panel">
											<header class="panel-heading"> </header>

											<table class="table table-striped table-advance table-hover">
												<tbody>
													<tr>
														<th style="padding: 10px 40px;"><i class="icon_profile"></i> 제품명</th>
														<th style="padding: 10px 30px;"><i class="icon_calendar"></i> 구매한 날짜</th>
														<th style="padding: 10px 45px;"><i class="icon_pin_alt"></i> 배송상태</th>
														<th style="padding: 10px 25px;"><i class="icon_mail_alt"></i> 판매자에게 문의</th>
														<th style="padding: 10px 25px;"><i class="icon_cogs"></i> 제품 바로가기</th>
														<th style="padding: 10px 25px;"><i class="icon_cogs"></i> 주문 취소</th>
													</tr>
													<!-- 주문/배송중인 상품 -->
													<c:forEach var="poList" items="${poList}">
														<tr>
															<td style="text-align: center;">${poList.po_pd_name}</td>
															<td style="text-align: center;">${poList.po_date_simple}</td>
															<td style="text-align: center;">${poList.po_state}</td>
															<td style="text-align: center;">
																<div class="btn-group">
																	<a class="btn btn-primary"
																		href="myPageMessageSend?po_at_id=${poList.po_at_id}"
																		onclick="window.open(this.href, '_blank', 'width=655px,height=650px,toolbars=no,scrollbars=no');return false;"><i
																		class="icon_plus_alt2"></i></a>
																</div>
															</td>
															<td style="text-align: center;">
																<div class="btn-group">
																	<a class="btn btn-success"
																		href="myPageGoProd?po_pd_code=${poList.po_pd_code}"><i
																		class="icon_check_alt2"></i></a>
																</div>
															</td>
															<td style="text-align: center;">
																<div class="btn-group">
																	<a class="btn btn-danger"
																		href="myPageOrderCancle?po_num=${poList.po_num}"
																		onclick="return confirm('정말 주문취소 하시겠습니까?');">
																		<i class="icon_close_alt2"></i></a>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</section>
									</div>
								</div>
							</div>
							<div>
								<div class="col-lg-12" style="padding-top: 50px;">
									<section class="panel">
										<header class="panel-heading">
											<h4>구독 정보</h4>
										</header>
										<table class="table">
											<thead>
												<tr>
													<th>#</th>
													<th>공방명</th>
													<th>공방 바로가기</th>
													<th>구독 해제</th>
												</tr>
											</thead>
											<tbody>
												<!-- 구독 정보 출력 -->
												<c:forEach var="mpsList" items="${mpsList}"
													varStatus="status">
													<tr class="active">
														<td>${status.count}</td>
														<td>${mpsList.sc_at_name}</td>
														<td><a class="btn btn-warning btn-sm"
															href="myPageGoAtelier?sc_at_id=${mpsList.sc_at_id}"
															title="Bootstrap 3 themes generator"><span
																class="icon_house_alt"></span> 바로가기</a></td>
														<td><a class="btn btn-danger btn-sm"
															href="myPageDelSubs?sc_at_id=${mpsList.sc_at_id}"
															title="Bootstrap 3 themes generator"
															onclick="return confirm('정말 구독취소 하시겠습니까?');">
															<span class="icon_target" ></span> 구독 해제</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false" />

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

	<script type="text/javascript">
    /* ---------------------------------------------------------------------------------------
	 * 기능: 로그인 여부에 따른 버튼 출력여부 결정
	 * 작성자: JSG
	 * 수정자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
    window.onload = function(){
    	$('.hideandshow').hide();
    	var mid = '${mb.cm_id}';
    	var mname = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid);
    	console.log(mname);
    	if(mid != ''){
    		$('.hideandshow').show();
    	}
    	
    	$('.showandhide').show();
    	var mid1 = '${mb.cm_id}';
    	var mname1 = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid1);
    	console.log(mname1);
    	if(mid1 != ''){
    		$('.showandhide').hide();
    	}
    	
    }
    
    $(document).ready(function() {
    	var chgMessage = "${orderCancleMsg}";
    	if(chgMessage!=""){
    		alert(chgMessage);
    	}
    })
    
    $(document).ready(function() {
    	var chgMessage = "${subCancleMsg}";
    	if(chgMessage!=""){
    		alert(chgMessage);
    	}
    })
    
    </script>
</body>
</html>