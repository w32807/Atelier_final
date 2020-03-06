<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<body>
    <!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>


    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>My Page</span>
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
   <!-- 여기부터 컨텐츠입니다. -->
   
		<div id="colorlib-main" style="width: auto;">
			<div class="colorlib-services" >
				<div class="container-fluid" >
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">					
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px; margin: 0 0 30px 30px;">주문 상태 조회<hr>
							</h2>							
						</div>
						<form id="seletor">
							<select id="selectBox" 
							style="margin-left: 900px; border-radius: 10px; width: 100px; height: 35px;  padding-left: 8px; font-size: 14px; border: 1px solid #A09182; color: white; background-color: #A09182;">
								<option value="">선택</option>
								<option value="before">배송전</option>
								<option value="being">배송중</option>
								<option value="after">배송 완료</option>
							</select>
						</form>
					</div>
					
                  	<form action="orderCancle" method="get" id="cancleStateFrm">
						<div class="row" style="margin-top: 50px;">
							<div class="col-md-8">
								<div class="colorlib-feature animate-box" data-animate-effect="fadeInLeft">
									<div id="orderAjax">
									<br>
										<c:forEach var="pl" items="${poList}">
											<div class="${pl.po_state}" style="margin-left: 80px;margin-bottom: 30px;">
												<img src="./resources/main/img/products/${pl.pi_oriname}" style="width:330px;" >
												<div class="colorlib-text" style="position: absolute; display: inline-block; padding: 50px 0 0 80px; font-size: 18px; font-weight: 400;">
													<div style="display: inline-block; line-height: 35px;">
														<input type="hidden" value="${pl.po_num}">
														<input type="checkbox" name="prod" value="${pl.po_num}">
														<h3 style="display: inline-block; font-size: 25px; letter-spacing: 1px; margin-bottom: 35px;"><b>${pl.po_at_name}</b></h3>
														<br><!-- 체크박스의 상품코드로 주문취소 처리 할 것임! -->
														<b style="margin-right: 40px;">배송상태</b><span>${pl.po_state}</span><br>
														<b style="margin-right: 80px;">가격</b><span>&#8361;${pl.po_price}</span><br>
														<b style="margin-right: 80px;">수량</b><span>${pl.po_count}</span><br>
														<b style="margin-right: 60px;">배송지</b><span>${pl.po_addr}</span><br>
														<br>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
							
					
						<div class="colorlib-feature animate-box" style="text-align: right; width: 900px; height: 200px;" >
							<input id="cancleBtn" type="button" name="search"  value="주문취소"
									style="width: 100px; height: 35px; border: none; font-size: 16px; color: white; background-color: #A09182; margin: 80px -85px 0 0;">
						</div>
					</form>
   <!-- 여기까지 컨텐츠입니다. -->                        
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
    <script src="<c:url value="/resources/main/js/jquery.countdown.min.js"/>"></script>
    <script src="<c:url value="/resources/main/js/jquery.nice-select.min.js"/>"></script>
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
	<script src="./resources/js/jquery.serializeObject.js"></script>
	<script type="text/javascript">
	//1. 아무것도 체크하지 않고 상태변경를 눌렀을 때.
	//2. n개의 상품을 취소하시겠습니까?
	//3. 체크박스에 해당 상품의 상품코드를 value로 넘김		
	$("#cancleBtn").click(function() {
		var chkLength = $("input:checkbox[name=prod]:checked").length;//체크박스에 체크가 되어있는 갯수를 구함
		if(chkLength == 0){
			alert("주문취소 할 상품을 선택 해주세요.");
		}else {
			if(confirm(+chkLength+"개의 상품을 취소하시겠습니까?")){
				$("#cancleStateFrm").submit();
				location.reload();
			}else {
				location.reload();
			}
		}
	});
	
	$("#seletor").change(function() {
		
		var select = $("#seletor").serializeObject();
		
		select.po_cm_id = "${mb.cm_id}";
		select.po_state = $("#selectBox").val();
		console.log(select);
		
			$.ajax({
					url:"orderAjax",
					type:"post",
					data:select,
					dataType:"json",
					success: function(data){
						console.log(data);
						var poList = "";
						var dlist = data.poList;
						
						for(var i=0; i<dlist.length; i++){
							
							poList +=				
							 '<br>'+
							 '<div class="'+ dlist[i].po_state + '"style="margin-left: 80px;">'+
							 '<img src="'+'./resources/main/img/products/'+dlist[i].pi_oriname+'"'+ 'style="width:330px;">'+
							 '<div class="colorlib-text" style="position: absolute; display: inline-block; padding: 50px 0 0 80px; font-size: 18px; font-weight: 400;">'+
							 '<div style="display: inline-block; line-height: 35px;">'+
							 '<input type="hidden" value="'+dlist[i].po_num+'">'+
							 '<input type="checkbox" name="prod"' + 'value='+'"'+dlist[i].po_num+'">'+
							 '<h3 style="display: inline-block; font-size: 25px; letter-spacing: 1px; margin-bottom: 35px;"><b>상품명</b></h3>'+
							 '<br>'+
							 '<b style="margin-right: 40px;">배송상태</b><span>'+dlist[i].po_state+'</span><br>'+
							 '<b style="margin-right: 40px;">가격</b><span>'+dlist[i].po_price+'&#8361;</span><br>'+
							 '<b style="margin-right: 40px;">수량</b><span>'+dlist[i].po_count+'</span><br>'+
							 '<b style="margin-right: 40px;">배송지</b><span>'+dlist[i].po_addr+'</span><br>'+
							 '<br>'+
							 '</div>'+
							 '</div>'+
							 '</div>'
						}
						$('#orderAjax').html(poList);
					},
					error: function(error){
						alert("hhhhhh");
				},
			});
	});
	</script>
</body>
</html>
