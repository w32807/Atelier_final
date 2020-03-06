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
		
		<form action="prodRegist" method="post" id="prodManageFrm" name="prodManageFrm" enctype="multipart/form-data">
			<!--여기부터 각각 하나의 상품이 됩니다. 실제로 구현시에는 HTML에서 JSTL의 forEach구문과 자바 코딩부에서 페이징 처리를 하면 될 듯 합니다. -->
			<div id="colorlib-main">
			<div class="colorlib-blog">
				<div class="container-fluid" style="min-height: 500px;">
					<div class="row" style="margin-left: 80px;">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">제품 목록 관리<hr>
							</h2>
						</div>
						<select name="registSelect" id="registSelectBox" onclick="changeProdRegist();"
							style="margin-left: 1185px; border-radius: 10px; width: 120px; height: 35px;
							padding-left: 8px; font-size: 14px; border: 1px solid #A09182; color: white;
							background-color: #A09182;">
							<option value="all">선택</option>
							<option value="T">판매 등록</option>
							<option value="F">판매 미등록</option>
						</select>
					</div>
					
					<div class="row" style="margin: 20px 80px;">
						<c:forEach var="product" items="${pd}">
							<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<label for="${product.pd_code}">
										<input type="checkbox" id="${product.pd_code}" name="prodChk" value="${product.pd_code}"
												style="background-color: transparent; position: relative; top: 6px; left: 12px;">
										<c:forEach var="piList" items="${piList}">
										<c:if test = "${product.pd_code eq piList.pi_pd_code}">
										<img src="./resources/main/img/products/${piList.pi_oriname}" class="img-responsive"
												style="margin-top: -26px; width: 400px;">
										</c:if>		
										</c:forEach>		
										<div class="desc" style="font-size: 15px; font-weight: 500;">
											<span style="font-size: 16px;">
												<small>${product.pd_regdate}</small> | 
												<small> ${product.pd_cate} </small> |
												<small> <i class="icon-bubble3"></i></small>
											</span>
											<h3 style="margin-bottom: 40px; font-size: 22px; font-weight: bolder;">
												<a href="prodDetail?pd_code=${product.pd_code}">${product.pd_name}</a>
											</h3>			
											&nbsp;제품명 : <input type="hidden" name="prodName"
																	value="${product.pd_name}">${product.pd_name}<br>
											&nbsp;재고량 : <input type="hidden" name="stock"
																	value="${product.pd_numofstock}">${product.pd_numofstock}<br>
											&nbsp;단가 : <input type="hidden" name="price"
																	value="${product.pd_price}">${product.pd_price}<br>
											<input type="hidden" id="pd_regist" name="pd_regist" value="${product.pd_regist}">
											<div style="text-align: right; margin-bottom: 0px;">
											</div>
										</div>
									</label>	
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row" style="margin-left: 80px;">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<ul class="pagination" style="font-size: 1.8rem;">
								${paging}
							</ul>
						</div>
					</div>
				</div>
			</div>
			</div>
			</form>
		</div>
	<!----------------------------------------------------------------------여기까지 각각의 상품입니다.-------------------------------------------------------------------->
	
	<!----------------------------------------------------------------------여기부터 각각의 버튼들입니다------------------------------------------------------------------->
	<!-- 여러 개의 체크박스를 선택하여 삭제할 때, 각각의 상품들은 동일한 name을 가지고, value는 상품들의 기본키인 상품 코드를 부여합니다.-->
	<!-- 수정 및 등록 해제는 한 개의 체크박스만 선택 할 수 있으며, 여러 개를 선택하면 alert 경고창을 띄웁니다.-->
	<!-- 판매 등록 시에는 여러 개의 체크박스를 이용하여 판매 등록하고자 하는 제품의 상품 코드(각각의 상품의 value값)를 DB쪽에 넘겨 일괄적으로 판매 등록 가능합니다.-->
	<!-- 제품 메뉴 제작은 버튼들의 스타일을 통일 시키기 위하여 일단 form태그에 넣었습니다. 제품 메뉴 제작은 페이지 이동의 기능만 가집니다. -->
	<div id="colorlib-main-menu" style="height: 100px; padding-right: 150px; font-size: 16px; font-weight: bolder; color: #A09182;">
		<div style="float: right;">
			<button type="button" id="prodDeleteBtn"
				style="background-color: transparent; border: none; margin-right: 10px;">삭제
			</button>
		</div>
											
		<div style="float: right;">
			<button type="button" id="prodmodifyBtn"
				style="background-color: transparent; border: none; margin-right: 10px;">수정
			</button>
		</div>
						
		<div style="float: right;">
			<button type="button" id="prodRegistCancleBtn"
				style="background-color: transparent; border: none; margin-right: 10px;">등록 해제
			</button>
		</div>
			
		<div style="float: right;">
			<input type="hidden" name="">
			<button type="button" id="prodRegistBtn"
				style="background-color: transparent; border: none; margin-right: 10px;">판매 등록
			</button>
		</div>
			
		<form action="ATProdRegist" method="get" style="float: right;">
			<button type="submit"
				style="background-color: transparent; border: none; margin-right: 10px;">제품 메뉴 제작
			</button>
		</form>
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
			
			//체크박스로 다중 선택을 하여 판매 등록을 누르면 해당 상품의 상품코드와 체크박스의 데이터가 넘어감
			$("#prodRegistBtn").click(function() {
				var chkLength = $("input:checkbox[name=prodChk]:checked").length;//체크된 체크박스의 갯수를 가져옴
				console.log(chkLength);
				if(chkLength != 0){//체크한 체크박스가 있을 경우
					if(confirm(chkLength+"개의 상품을 판매등록 하시겠습니까?")){
						//var $items = $("label[name=prodChk]").find("input:checkbox:checked");//체크된 checkbox를 가지고 있는 label를 가져옴
							$("form[name=prodManageFrm]").attr("action","prodRegist");
							$("form[name=prodManageFrm]").submit();
					}
				}else {//체크한 체크박스가 없을 경우
					alert("판매등록 할 상품을 선택 해 주세요.");
				}
			});
				
			$("#prodRegistCancleBtn").click(function() {
				var chkLength = $("input:checkbox[name=prodChk]:checked").length;//체크된 체크박스의 갯수를 가져옴
				console.log(chkLength);
				if(chkLength != 0){//체크한 체크박스가 있을 경우
					if(confirm(chkLength+"개의 상품을 판매등록 해제 하시겠습니까?")){
						//var $items = $("label[name=prodChk]").find("input:checkbox:checked");//체크된 checkbox를 가지고 있는 label를 가져옴
							$("form[name=prodManageFrm]").attr("action","prodRegistCancle");
							$("form[name=prodManageFrm]").submit();
					}
				}else {//체크한 체크박스가 없을 경우
					alert("판매등록 해제 할 상품을 선택 해 주세요.");
				}
			});
			$("#prodmodifyBtn").click(function() {
				var chkLength = $("input:checkbox[name=prodChk]:checked").length;//체크된 체크박스의 갯수를 가져옴
				if(chkLength == 0){
					alert("수정 할 상품을 선택 해 주세요.");
				}else {
					if (chkLength > 1) {
						alert("수정 할 상품은 1개만 선택 해 주세요.");
					} else {
						//체크박스를 1개 선택하여 전송
						$("form[name=prodManageFrm]").attr("action","Prodmodify");
						$("form[name=prodManageFrm]").submit();
					}				

				}
			});
			$("#prodDeleteBtn").click(function() {
				var chkLength = $("input:checkbox[name=prodChk]:checked").length;//체크된 체크박스의 갯수를 가져옴
				if(chkLength == 0){
					alert("삭제 할 상품을 선택 해 주세요.");
				}else {
					if(confirm("정말 "+chkLength+"개의 상품을 삭제하시겠습니까?")){
						$("form[name=prodManageFrm]").attr("action","prodDelete");
						$("form[name=prodManageFrm]").submit();
					}				
				  }
				
			});
			
			$('#registSelectBox').change(function() {
				 var value = document.getElementById('registSelectBox').value;
				 console.log(value);
				 $("form[name=prodManageFrm]").attr("action","registSelect");
				 $("form[name=prodManageFrm]").submit();
				 
			 });
			
			window.onload = function(){
			     var chk = "${registcheck}";
			     if(chk!=''){
			     removeSelected();
			     switch (chk) {
				 	case "T":
				 		$('select[name="registSelect"]').find('option[value="T"]').attr("selected",true);
				 	break;
				 	case "F":
				 		$('select[name="registSelect"]').find('option[value="F"]').attr("selected",true);
				 	break;
				 
			 		}
			     
			    }
			 };
			 
			 function removeSelected(){
					$('select[name="registSelect"]').find('option[value="T"]').attr("selected",false);
					$('select[name="registSelect"]').find('option[value="F"]').attr("selected",false);
				 }

		</script>

</body>
</html>

