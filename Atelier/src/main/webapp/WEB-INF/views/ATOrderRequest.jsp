<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<meta property="og:title" content="" />
	<meta property="og:image" content="" />
	<meta property="og:url" content="" />
	<meta property="og:site_name" content="" />
	<meta property="og:description" content="" />
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	
	<link
		href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
		rel="stylesheet">

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
	<script type="text/javascript">
		window.onload = function() {//이 페이지가 실행 되면, 모든 체크박스의 체크를 해제.(뒤로가기 버튼으로 이 페이지에 접근 시 체크박스 해제를 위함)
			$("input:checkbox[name=prod]").each(function() {
				this.checked = false;
			});
		}
	</script>
	</head>
	<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>

    <!-- 좌측바 Include -->
	<div id="colorlib-page">
		<jsp:include page="ATM_LBar.jsp" flush="false"/>
		
		<div id="colorlib-main">
			<div class="colorlib-services" style="margin-left: 100px;">
				<div class="container-fluid" style="min-height: 500px;">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
									style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">거래처 및 발주신청<hr>
							</h2>
						</div>
					</div>

	<!---------------------------------------------여기서 검색처리를 합니다. (검색어의 name은 search로 잡았습니다.-------------------------------------------->
					<form action="prodSearch" id="searchFrm" class="colorlib-heading animate-box" style="margin-left: 700px;">
						<div class="advanced-search">
                        	<div class="input-group"style="margin: 0px auto; margin-bottom: 100px; margin-right: 400px;">
                           		<input id="keyword" type="text" name="keyword" placeholder="검색어를 입력 해 주세요."
                           			value="" style="width: 280px; padding-left: 8px; font-size: 14px; border: 1px solid #A09182;">
                           		<input id="searchBtn" type="button" value="검색"
                              		style="width: 60px; border: none; font-size: 16px; color: white; background-color: #A09182;">
                        	</div>
                     	</div>
                  	</form>
	<!-------------------------------------------------여기까지 검색처리를 합니다.---------------------------------------------------------------------------->
					
					<form action="ATrmOrder" method="post" name="rmOrderFrm" enctype="multipart/form-data">
						<div class="row">
							<div id="rmTable" name="rmTable">
								<div class="col-md-6" style="left: 100px">
									<!-- 여기서부터 발주 신청을 할 수 있는 하나하나의 목록들이 출력 됩니다. -->
									<!-- 여기 1열에는 넘어온 물품 리스트 배열의 홀수 번째 index의 물품만 foreach 문으로 출력합니다. -->
									<c:forEach begin="0" step="2" var="rmProd" items="${rmList}">
										<div class="colorlib-feature animate-box"
											data-animate-effect="fadeInLeft" style="margin-bottom: 30px;">
											<label for="${rmProd.rm_num}">
												<div class="colorlib-icon" style="width: 130px; height: 130px;">
													<i class="icon-tag"></i>
												</div>
												<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400; width: 350px;">
													<h3 style="display: inline-block; font-size: 18px; margin-bottom: 16px;">
														<b>${rmProd.rm_type}</b>
													</h3>
													<input id="${rmProd.rm_num}" type="checkbox" name="rmProdOrderChk" value="${rmProd.rm_num}" ><br>
													<b>단가</b><span name="prodPrice" id="${rmProd.rm_num}">&nbsp;&nbsp;&nbsp;&#8361;${rmProd.rm_price}</span><br>
													<b>수량</b>&nbsp;&nbsp;&nbsp;<input type="number" name="${rmProd.rm_num}" value="0"
																						class="numOfprod" min="0"
																						style="border: none; width: 70px;" placeholder="입력 ">
													<br> <b>색상</b><span>&nbsp;&nbsp;&nbsp;${rmProd.rm_color}</span><br>
												</div>
											</label>
										</div>			
									</c:forEach>
								</div>
	
		<!------------------------------------------여기가 물건의 2열 시작------------------------------------------------>
		<!--------- 여기 2열에는 넘어온 물품 리스트 배열의 짝수번째 index의 물품만 foreach 문으로 출력합니다. ------------>
								<div class="col-md-6" style="left: -70px;">
									<c:forEach begin="1" step="2" var="rmProd" items="${rmList}">
										<div class="colorlib-feature animate-box"
											data-animate-effect="fadeInLeft" style="margin-bottom: 30px;">
											<label for="${rmProd.rm_num}">
												<div class="colorlib-icon" style="width: 130px; height: 130px;">
													<i class="icon-tag"></i>
												</div>
												<div class="colorlib-text" style="padding: 13px 0 0 150px; font-size: 15px; font-weight: 400; width: 350px;">
													<h3 style="display: inline-block; font-size: 18px; margin-bottom: 16px;">
														<b>${rmProd.rm_type}</b>
													</h3>
													<input id="${rmProd.rm_num}" type="checkbox" name="rmProdOrderChk" value="${rmProd.rm_num}" ><br>
													<b>단가</b><span name="prodPrice" id="${rmProd.rm_num}">&nbsp;&nbsp;&nbsp;${rmProd.rm_price}&#8361;</span><br>
													<b>수량</b>&nbsp;&nbsp;&nbsp;<input type="number" name="${rmProd.rm_num}" value="0"
																						class="numOfprod" min="0"
																						style="border: none; width: 70px;" placeholder="입력 ">
													<br> <b>색상</b><span>&nbsp;&nbsp;&nbsp;${rmProd.rm_color}</span><br>
												</div>
											</label>	
										</div>
									</c:forEach>
								</div>								
							</div>
						</div>
					</div>
				</div>

				<div class="colorlib-feature animate-box"
					style="text-align: right; width: 1100px; height: 200px;">
					<span style="font-size: 20px;" id="totalPrice"></span>
						 <input class="payment" type="button" name="order" value="결제"
							style="width: 60px; height: 30px; border: none; font-size: 16px;
							color: white; background-color: #A09182; margin-right: -50px;">
				</div>
			</form>
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
	<!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/jquery.serializeObject.js"></script>
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
	
		function cal_price() {//총 가격을 바로바로 계산하기 위한 함수
			var $items = $(".colorlib-feature").find("input:checkbox:checked");//체크된 녀석들 찾기.
			var $total = $("#totalPrice");
			var cur_total = 0;// 처음 총 가격은 0 원
			console.log(cur_total);
			$items.each(function() {//각각의 item(체크된 녀석들 )
				var $this = $(this);
				var $target = $("span[id='" + $this.attr("id") + "']");//그 상품의 단가를 가져옴
				var c = $target.html().replace(/&nbsp;/g, "");	//g = 모든 패턴 체크(grobal)
				console.log("$target의 값(단가)" + c);
				var d = c.replace(/₩/g, "");//여기까지 단가의 숫자만 잘라옴.(즉 체크박스로 체크한 상품의 가격이 숫자로 저장됨.)
				var numOfprod = $("input[name='" + $this.attr("id") + "']");//수량을 가져오기 위해 해당 태그에 접근. defalut는 0개
				console.log("numOfprod 의 값 : " + numOfprod);
				var price = parseInt(d)*parseInt(numOfprod.val());//상품 1개에 대해 가격 계산
				console.log(price);
				cur_total += price;
			});
			console.log(cur_total);
			$total.html(cur_total + "₩");
		}
		
		//체크박스를 선택 할 때 자동으로 총 가격이 계산 됨.
		$(".colorlib-feature").on("click", "input:checkbox", function() {
			 cal_price();
		});
		
		//체크박스를 체크하고 수량을 변경하면 총 가격이 바로 변경됨.
		$(".numOfprod").change(function(){
			 cal_price();
		});
		
		function order() {// 결제 버튼을 눌렀을 때 분기 처리를 위한 함수
			var $items = $(".colorlib-feature").find("input:checkbox:checked");//체크된 checkbox를 가지고 있는 div를 가져옴
			var cnt = 0; //alert를 한번만 띄워주기 위한 카운트 변수
			var b = false; //분기처리를 위한 불리언 변수
			$items.each(function() {//각각의 체크된 div에 대하여
				var $this = $(this);
				//1. 각각의 수량이 0 혹은 null인지 검사.
				var numOfprod = $("input[name='" + $this.attr("id") + "']");
					if(numOfprod.val()==0 || numOfprod.val() == null){
					}
					else {
						cnt++;
					}
				})
			if(cnt == 0){
				return b;
			}else {
				b = true;
				return b;
			}
		}
		
		//체크박스를 눌러 결제 버튼을 눌렀지만, 수량이 0 혹은 null일 때 alert알람.
		$(".payment").click(function() {
			var chkLength = $("input:checkbox[name=rmProdOrderChk]:checked").length;//체크박스에 체크가 되어있는 갯수를 구함
			var a = order();
			// order함수가 실행되어, true이면 체크한 모든 품목에 대해 수량이 잘 입력되어있므로 결제 진행
			// false라면 체크는 되어있으나 수량입력이 0 혹은 null인 품목이 있으므로 결제 불가
			if(a){
				//결제를 진행 할 경우
				$("form[name=rmOrderFrm]").submit();
			}
			else {
				if (chkLength === 0 ) {
					$("input:checkbox[name=rmProdOrderChk]").each(function() {
						this.checked = false;
					});
					alert("1개 이상 선택 해 주세요.");	
				} else {
					//체크박스에 체크를 하고 결제를 진행하려 했으나 , 수량입력이 제대로 되어있지 않은 경우
					alert("수량이 입력되지 않은 품목이 있습니다.");
				}
			}
		});
			
	</script>
</body>
</html>

