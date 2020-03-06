<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Atelier | Admin</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">

<!-- Modernizr JS -->
<script src="./resources/AT_front/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
      <![endif]-->
<!-- Bootstrap CSS -->
<link href="./resources/ADATList/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<!-- 
<link href="./resources/ADATList/css/bootstrap-theme.css"
   rel="stylesheet"> -->
<!--external css-->
<!-- font icon -->
<link href="./resources/ADATList/css/elegant-icons-style.css"
	rel="stylesheet" />
<!-- <link href="./resources/ADATList/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles -->
<link href="./resources/ADATList/css/style.css" rel="stylesheet">
<link href="./resources/ADATList/css/style-responsive.css"
	rel="stylesheet" />
<link href="./resources/ADATList/css/main.css" rel="stylesheet">

</head>
<body>
	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<div class="app-header header-shadow">
			<div class="app-header__logo">
				
				<!--로고 이름바꾸기. -->
				<div class="header__pane ml-auto">
				</div>
			</div>
			<div class="app-header__menu">
			</div>
			<div class="app-header__content">
				<div class="app-header-left">

				</div>

			</div>
		</div>
		<div class="app-main">
			<div class="app-sidebar sidebar-shadow">
				<div class="app-header__logo">
					<div class="logo-src"></div>
					<div class="header__pane ml-auto">
					</div>
				</div>
				<div class="app-header__mobile-menu">
					<div>
						<button type="button"
							class="hamburger hamburger--elastic mobile-toggle-nav">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
				<div class="app-header__menu">
					<span>
						<button type="button"
							class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
							<span class="btn-icon-wrapper"> <i
								class="fa fa-ellipsis-v fa-w-6"></i>
							</span>
						</button>
					</span>
				</div>
				<div class="scrollbar-sidebar">
					<div class="app-sidebar__inner">
					  <section style="border: shadow">
							<div><a href="main"><button class="btn btn-info btn-lg" style="width:290px; margin-left:-20px; text-align:center;"><h4 style="margin-right:10px;"><i class="fa fa-home"></i> Atelier</h4></button></a></div>
						</section>
						<ul class="vertical-nav-menu">
							<li class="app-sidebar__heading">고객관리</li>
							<ul>
								<li><a href="ADNoticeList"> 공지사항 </a> <a href="ADFAQ">
										FAQ </a></li>
							</ul>
							<li>
							<li class="app-sidebar__heading">회원관리</li>
							<ul>
								<li><a href="ADMessage"> 메세지답변</a></li>
							</ul>
							</li>
							<li>
							<li class="app-sidebar__heading">공방관리</li>
								<ul>
									<li><a href="ADATMemberUp"> 공방회원 승인 / 거부 </a></li>
									<li><a href="ADATList"> <i class="metismenu-icon"></i>공방리스트</a></li>
								</ul>
							</li>

							<li class="app-sidebar__heading">업체관리</li>
							<ul>
								<li><a href="ADCompany"> 원자재 업체 리스트 </a></li>
							</ul>
							<li class="app-sidebar__heading">상품관리</li>
							<ul>

								<li><a href="ADProdManage"> 상품삭제 </a></li>
							</ul>
						</ul>
					</div>
				</div>
			</div>

			<div class="app-main__outer">

				<div class="app-main__inner">
					<div class="app-page-title">
						<h4>상품삭제</h4>
						<!--  search form start -->
						<ul class="nav top-menu">
							<li>
								<form id="Searching" action="searchProduct" class="navbar-form">
									<input id="search" class="form-control" name="search" placeholder="Search" type="text">
								</form>
							</li>
						</ul>
						<!--  search form end -->
						<div class="page-title-wrapper">
							<div class="page-title-heading"></div>
						</div>
					</div>

					<div class="cd-full-width" style="padding: 10px; margin: 30px;">
						<div class="container-fluid js-tm-page-content" data-page-no="1"
							data-page-type="gallery">
							<div class="tm-img-gallery-container">
								<div class="tm-img-gallery gallery-one">
								<form id="cancleStateFrm" action="productDelete" method="get">
									<!-- <input type="hidden"  id="index" name="index"> -->
								<c:forEach var="pdDto" items="${pd}" varStatus="status">
									<div class="grid-item" style="float: left; padding: 20px;">
										<figure class="effect-bubba">
											<c:if test='${pdDto.pi_oriname eq null}'>
                                        		<img src="./resources/main/img/products/null.jpg" alt="" style="width: 200px; height: 200px;">
                                            </c:if>
                                            <c:if test='${pdDto.pi_oriname ne null}'>
                                            	<img src="./resources/main/img/products/${pdDto.pi_oriname}" alt="" style="width: 200px; height: 200px;">
                                            </c:if>
											<figcaption>
												<input type="checkbox" name="prod" value="${pdDto.pd_code}">
												
												<div class="pi-text">
			                                        <div class="catagory-name">${pdDto.pd_cate}</div>
			                                        <a href="ADProdDetail?pd_code=${pdDto.pd_code}">
			                                            <h5>${pdDto.pd_name}</h5>
			                                        </a>
		                                        </div>
											</figcaption>
										</figure>
									</div>
								</c:forEach>
								</form>
								</div>
								</div>
							</div>
						</div>
					</div>

				<div>
					<div class="row"     style="padding-left: 430px;">W
					</div>
					<div style="position: fixed; right: 60px; bottom: 10px">
						<button id="delete" class="btn btn-info btn-sm">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

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
	<script type="text/javascript" src="resources/AT_front/js/main.js"></script>
	<script type="text/javascript" src="resources/assets/scripts/main.js"></script>
</body>
<script type="text/javascript">
	
	$("#search").keydown(function(key){
		
		if(key.keyCode == 13){
			$("#Searching").submit
		}
	});
	
	$("#delete").click(function(){
		
		var chkLength = $("input:checkbox[name=prod]:checked").length;
		console.log("선택된상품의 갯수 : " + chkLength);
		if(chkLength == 0){
			alert("취소 할 상품을 선택 해주세요.");
		}else {
			
			if(confirm(+chkLength+"개의 상품을 취소하시겠습니까?")){
				$("#cancleStateFrm").submit();
			}else {
			}
		}
	});

</script>
</html>
