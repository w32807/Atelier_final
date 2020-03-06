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
	
	  <style type="text/css">
	  #profile-photo{
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
  
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">					
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px; margin-left: 30px;">답장하기<hr>
							</h2>							
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft" style="margin: 0px auto;">
						<div class="about-desc"></div>
						<div class="fancy-collapse-panel">
						<div style="border: solid 1px; border-radius:15px;  border-color: darkgray; background-color: #f6f8f9;">
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin: 60px;">
									
									<!-- 각각의 heading숫자 ,  collapse숫자는 모두 for문으로 숫자들을 1개씩 증가시켜주세요. -->
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="heading1">
									        <h4 class="panel-title">
									            <a class="collapsed"  href="#collapse1" aria-expanded="false" aria-controls="collapse1" style="font-weight: bold;">
									           <i class="icon_mail_alt"></i>${mDto.mg_sender}</a>
									        </h4>
									    </div>
									         	<textarea rows="10" cols="45" style="margin-top: 5px; font-size: 15px;resize: none;">${mDto.mg_contents}</textarea>
									</div>
											<!-- 여기까지 쪽지 1개 -->
						
								
										<form id="messageFrm" action="messageSendBtn" method="get">
													
										<div class="panel panel-default" style="margin-top: 100px;">
									    <div class="panel-heading" role="tab" id="heading1">
									        <h4 class="panel-title">
									            <a class="collapsed"  href="#collapse1" aria-expanded="false" aria-controls="collapse1" style="font-weight: bold;">
									            ${mb.cm_id}
									            </a>
									           	<input type="hidden" name="mg_sender" value="${mb.cm_id}">
									           	<input type="hidden" name="mg_num" value="${mDto.mg_num}">
									        </h4>
									    </div>
									    	
									     	<textarea id="messageContents" rows="10" cols="45" name="mg_contents" style="margin-top: 5px; font-size: 15px;resize: none;" placeholder="여기에 내용을 작성 해주세요." ></textarea>
											<input type="hidden" name="mg_receiver" value="${mDto.mg_sender}"><!-- 송신자의 아이디는 session에 담겨있을테니 여기서 안 보내도 됨. -->
																	
									</div>
									
										<div style="margin-top: 10px;"></div>
										
										<button><input id="messageSendBtn" type="submit" value="전송" style="float: right; font-size: 15px;"></button>
										</form>	
										</div>
										</div>
										 </div>	
								</div>
							</div>
	
   <!-- 여기까지 쪽지입니다. -->                        
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
	
	
	
	<script type="text/javascript">
				$("#messageSendBtn").click(function() {
					var content = $("#messageContents").val();
					console.log(content);
					if(content==''){
						alert("보낼 내용을 작성해주세요!");
						console.log(content);
					} else {
						$("#messageFrm").submit();
						alert("메세지 전송 완료.")
						window.close();
					}
								
				});
				
	</script>
				
</body>

</html>