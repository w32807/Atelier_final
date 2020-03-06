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
<title>Atelier | Purchase</title>

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
	.count {
		margin-right: 30px;
	}
	.prodInfo{
		width: 30px;
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
					<div class="breadcrumb-text product-more">
						<a href="main"><i class="fa fa-home"></i> Home</a> <a
							href="prodList_All">Shop</a> <span>Purchase</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="checkout-section spad">
		<div class="container">
			<form id="orderInsert" action="orderInsert" class="checkout-form" method="post">
				<div class="row">
					<div class="col-lg-6">
						<hr>
						<h4>결제하기</h4>
						<hr>
						<h4>주문자 정보</h4>
						<!-- row 시작 -->
						<div class="row">
							<div class="col-lg-12">
								<label for="zip"></label>주문자 성명 <input  type="text" id="senderName" required value="${cmDto.cm_name}" readonly="readonly">
							</div>
							<div class="col-lg-12">
								<label for="zip"></label>주문자 전화번호 <input type="text" id="senderPhone" required value="${cmDto.cm_phone}">
							</div>

							<h4>받는 사람</h4> 
							
							<div class="col-lg-12">
								<label for="zip">받는사람 성명<span style="margin-left: 8px; font-size: 13px;">주문자와 동일
								<input id="receiver" type="checkbox" style="width: 13px; margin-left: 5px; margin-top: -8px; position: absolute;"></span></label> 
								<input type="text" id="receiverName" name="receiverName" required value="">
							</div>
							
							<div class="col-lg-12">
								<label for="zip">받는사람 전화번호</label> <input type="text" id="receiverPhone" name="receiverPhone" required value="">
							</div>
							<!--  탭시작 -->
							<div class="product-tab">
								<div class="tab-item">
									<ul class="nav" role="tablist">
										<li><a id="tab1" class="active" data-toggle="tab" href="#tab-1"
											role="tab">배송지1</a></li>
										<li><a id="tab2" data-toggle="tab" href="#tab-2" role="tab">배송지2</a>
										</li>
										<li><a id="tab3" data-toggle="tab" href="#tab-3" role="tab">배송지3</a>
										</li>
									</ul>
								</div>
								
								<!-- 탭시작 -->
								<div class="tab-item-content">
									<div class="tab-content">
										<div class="tab-pane fade-in active" id="tab-1"
											role="tabpanel">
											<div class="product-content">
												<div class="row">
													<div class="col-lg-12">
														<h5>
															주소<span>*</span>
														</h5>
														<hr>
														<label for="street"></label> <input type="text"
															id="addr1" class="street-first" value="${cmDto.cm_addr}"> 
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="tab-2" role="tabpanel">
											<div class="product-content">
												<div class="row">
													<div class="col-lg-12">
														<h5>
															주소<span>*</span>
														</h5>
														<hr>
														<label for="street"></label> <input type="text"
															id="addr2" class="street-first" value="${cmDto.cm_addr2}"> 
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="tab-3" role="tabpanel">
											<div class="product-content">
												<div class="row">
													<div class="col-lg-12">
														<h5>
															주소<span>*(직접입력)</span>
														</h5>
														<hr>
														<label for="street"></label> <input type="text"
															id="addr3" class="street-first">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 탭시마이 -->
						</div>
						<!-- row 끝 -->
					</div>
					<div class="col-lg-6">
						<hr>
						<div class="place-order">
							<!-- Breadcrumb Section Begin -->
							<div class="breacrumb-section">
								<div class="container">
									<div class="row">
										<div class="col-lg-12">
											<div class="breadcrumb-text product-more">
												<a href="basket"><i class="icon_bag_alt"></i> 장바구니</a> <a
													href="prodBuy"><p style="color: red">주문결제</p></a> <span>주문완료</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Breadcrumb Section Begin -->
							<div class="order-total">
								<ul class="order-table">
									<li>Product <span style="margin-right: -5px;">Total</span><span class="count prodInfo" style="margin-right: 50px;">수량</span>
																							<span class="count prodInfo" style="margin-right: 60px;">단가</span></li>
									<li class="fw-normal">배송비 무료 <span class="prodInfo">Free</span></li>
									 <c:forEach var="pdDto" items="${orderedProdList}">
										 <table>
										 	<tr>
												<li class="fw-normal">
													<td style="width: 210px;">${pdDto.pd_name}</td>
													<td style="float: right; width: 100px;"><span class="" style="float: right; margin: 0px;">&#8361;${pdDto.pd_price*pdDto.pd_numofstock}</span></td>
													<td style="float: right; width: 54px;"><span class="count" style="float: right; margin: 0px;">${pdDto.pd_numofstock}</span></td>
													<td style="float: right; width: 120px;"><span class="count" style="float: right; margin: 0px;">&#8361;${pdDto.pd_price}</span></td>
												</li>
											</tr>
										</table>	
										<input type="hidden" name="orderProdList" value="${pdDto.pd_code}"/>
										<input type="hidden" name="orderProdCount" value="${pdDto.pd_numofstock}"/>
										<input type="hidden" name="orderProdPrice" value="${pdDto.pd_price}"/>
									</c:forEach>
									<c:forEach var="btNum" items="${orderBtNum}">
										<input type="hidden" name="orderBtNum" value="${btNum}">
									</c:forEach>
										<input type="hidden" id="orderAddr" name="orderAddr" value="${cmDto.cm_addr}"/>			
									
									<li class="total-price">Total<span class="prodInfo">&#8361;${totalPrice}</span></li>
								</ul>
								<div class="payment-check">
									<div class="pc-item">
										<label for="pc-check"> 카드결제 <input type="checkbox"
											id="pc-check"> <span class="checkmark"></span>
										</label>
									</div>
									<div class="pc-item">
										<label for="pc-paypal"> 핸드폰결제 <input type="checkbox"
											id="pc-paypal"> <span class="checkmark"></span>
										</label>
									</div>
								</div>
								<div class="order-btn">
									<button id="orderInsertBtn" type="button" class="site-btn place-btn">주문하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false"/>




	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery.zoom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery.dd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/main/js/main.js"></script>
	<script>
		function btn(){
		    alert('주문이 완료되었습니다!');
		}
    
		$("#receiver").change(function() {
			var receiverName = $("#senderName").val();
			var receiverPhone = $("#senderPhone").val();
			if ($("#receiver").is(":checked")) {
				$("#receiverName").val(receiverName);
				$("#receiverPhone").val(receiverPhone);

			} else {
				$("#receiverName").val('');
				$("#receiverPhone").val('');

			}
		});

		$("#orderInsertBtn").click(function() {
			if (confirm("결제를 진행하시겠습니까?")) {
				$("#orderInsert").submit();
			}
		})

		
		$("#tab1").click(function() {
			var addr1 = $("#addr1").val();
			console.log("배송지 1 : "+addr1);
			$("#orderAddr").val(addr1);
			console.log($("#orderAddr").val());
		})
		
		$("#tab2").click(function() {
			var addr2 = $("#addr2").val();
			console.log("배송지 2 : "+addr2);
			$("#orderAddr").val(addr2);
			console.log($("#orderAddr").val());
		})
		
		$("#tab3").click(function() {
			var addr3 = $("#addr3").val();
			console.log("배송지 3 : "+addr3);
			$("#orderAddr").val(addr3);
			console.log($("#orderAddr").val());
		})
		
		$("#addr1").focusout(function() {
			var addr1 = $("#addr1").val();
			console.log("배송지 1 : "+addr1);
			$("#orderAddr").val(addr1);
			console.log($("#orderAddr").val());
		})
		
		$("#addr2").focusout(function() {
			var addr2 = $("#addr2").val();
			console.log("배송지 2 : "+addr2);
			$("#orderAddr").val(addr2);
			console.log($("#orderAddr").val());
		})
		
		$("#addr3").focusout(function() {
			var addr3 = $("#addr3").val();
			console.log("배송지 3 : "+addr3);
			$("#orderAddr").val(addr3);
			console.log($("#orderAddr").val());
		})
	</script>
</body>

</html>