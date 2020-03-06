<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
<title>Atelier | Products</title>

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

<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="col-lg-9">
		<div class="row">
			<div class="col-lg-6">
				<div class="product-pic-zoom">
					<img class="product-big-img"
						src="./resources/main/img/products/${pd.pi_oriname}" alt="" style="width:400px; height:600px;">
					<div class="zoom-icon">
						<i class="fa fa-search-plus"></i>
					</div>
				</div>
			</div>
		
		
			
				<div class="col-lg-6">
					<div class="product-details">
						<div class="breadcrumb-text product-more">
							<span>Atelier</span>
							<h3>
								<input type="text" value="${pd.pd_name}" style="border: none;">
							</h3>
							<div></div>
						</div>
						<div class="pd-rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-o"></i> <span>(5)</span>
						</div>
						<div class="pd-desc">
							<!--  <p>간략한 제품 소개는 여기다가</p> -->
							<h4>${pd.pd_price}
								<span>${pd.pd_price*1.5} </span>
							</h4>
						</div>


						<div class="quantity">
							<input type="hidden" name="bt_pd_code" value="${pd.pd_code}">
							<!-- <a href="basket" class="primary-btn pd-cart">장바구니에 담기</a> -->
							<button id="basketBtn" class="primary-btn pd-cart"> 수정하기 </button>
						</div>

						<ul class="pd-tags">
							<li><span>카 테 고 리</span> : ${pd.pd_cate}</li>
							<li><span>제 품 코 드</span> : ${pd.pd_code}</li>

						</ul>
					</div>
				</div>
		</div>
	</div>
		<!--  탭시작 -->
		<div class="product-tab">
			<div class="tab-item">
				<ul class="nav" role="tablist">
					<li><a class="active" data-toggle="tab" href="#tab-1"
						role="tab">제품설명</a></li>
					<li><a data-toggle="tab" href="#tab-2" role="tab">상세설명</a></li>
					<li><a data-toggle="tab" href="#tab-3" role="tab">고객후기</a></li>
				</ul>
			</div>
			<!-- 탭시작 -->
			
			<div class="tab-item-content">
				<div class="tab-content">
					<form action="ProdUpdate" method="get" id="Updating">
						<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
							<div class="specification-table" style="width: 635px;">
								<input type="hidden" name="pd_code" value="${pd.pd_code}">
									<table>
										<tr>
											<td class="p-catagory">카테고리</td>
											<td><input type="text" name="pd_cate" value="${pd.pd_cate}"
												style="text-align: center; border: none;">
											</td>
										</tr>
										<tr>
											<td class="p-catagory">상품명</td>
											<td><div class="p-name">
													<input type="text" name="pd_name" value="${pd.pd_name}"
														style="text-align: center; border: none;">
												</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">상품가격</td>
											<td>
												<div class="p-price">
													<input type="text" name="pd_price"  value="${pd.pd_price}"
														style="text-align: center; border: none;">
												</div>
											</td>
										</tr>
										<tr>
											<td class="p-catagory">재고</td>
											<td>
												<div class="p-stock">
													<input type="text" name="pd_numofstock" value=" ${pd.pd_numofstock}"
														style="text-align: center; border: none;">
												</div>
											</td>
										</tr>
		
										<tr>
											<td class="p-catagory">색상</td>
											<td><input type="text" name="pd_option" value="${pd.pd_option}"
														style="text-align: center; border: none;"></td>
										</tr>
									</table>
							</div>
						</div>
					
						<div class="tab-pane fade" id="tab-2" role="tabpanel">
							<div class="specification-table" style="width: 635px;">
								<table>
									<tr>
										<td>
											<input type="text" name="pd_detail" value="${pd.pd_detail}"
												style="text-align: center; border: none;">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form>
					
					<div class="tab-pane fade" id="tab-3" role="tabpanel">
						<div class="customer-review-option">
							<h4>고객후기</h4>
								<div class="comment-option">
									<div class="co-item">
										<div class="avatar-pic">
											<img src="./resources/main/img/product-single/avatar-1.png" alt="">
										</div>
										<div class="avatar-text">
											<div class="at-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</div>
											<h5> SSibal Rome <span>27 Aug 2019</span></h5>
											<div class="at-reply">Fucking !</div>
										</div>
									</div>
									<div class="co-item">
										<div class="avatar-pic">
											<img src="./resources/main/img/product-single/avatar-2.png" alt="">
										</div>
										<div class="avatar-text">
											<div class="at-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</div>
											<h5>Jogga sam <span>27 Aug 2019</span></h5>
											<div class="at-reply">OMG!</div>
										</div>
									</div>
								</div>
											
								<div class="leave-comment">
									<h4>후기 남기기</h4>
									<div class="row">
										<div class="col-lg-6">
											<input type="text" placeholder="성명" required>
										</div>
										<div class="col-lg-6">
											<input type="text" placeholder="Email" required>
										</div>
										<div class="col-lg-12">
											<textarea placeholder="내용" required></textarea>
											<button type="submit" class="site-btn">후기 등록</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 하단바 End -->

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

			<script src="resources/js/jquery.serializeObject.js"></script>
</body>
<script type="text/javascript">
	$('#basketBtn').click(function() {
		if (confirm("이 상품을 수정하시겠습니까?")) {
			$("#Updating").submit();
		}
		else{
			console.log(error);
		}
	});

</script>
</html>