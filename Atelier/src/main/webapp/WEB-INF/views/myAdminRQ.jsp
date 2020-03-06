<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier | Atelier</title>
</head>
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
		#profile-photo {
			height: auto;
		}
		.info_btn {
			margin-left: 150px;
    		margin-bottom: -20px;
			background: #A09182;
		    color: #fff;
		    border: 2px solid #A09182;
		    font-size: 13px;
		    font-weight: bolder;
		}
	</style> 
</head>

<body>
			<div class="colorlib-contact" style="padding-bottom: 7.5em;">
				<div class="container-fluid" style="margin-left: 50px;">
					<div class="row">
						<div class="col-md-12">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
								style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">쪽지<hr>
							</h2>
						</div>
					</div>
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
						<div class="about-desc"></div>
						<div class="fancy-collapse-panel">
							<div style="border: solid 3px #A09182; border-radius:15px; width: 500px;">
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin: 60px;">
									<!-- 각각의 heading숫자 ,  collapse숫자는 모두 for문으로 숫자들을 1개씩 증가시켜주세요. -->
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="heading1">
											<h4 class="panel-title">
										    	<a class="collapsed"  href="#collapse1" aria-expanded="false" aria-controls="collapse1"
										    			style="font-weight: bold;">
										        	<i class="icon_mail_alt"></i> 보내는 사람 : ${mb.cm_id}
										        </a>
										    </h4>
										</div>
										<form id="messageFrm" action="AdminMessageFromMP" method="post">
											<textarea id="messageContents" rows="10" cols="45" name="mg_contents"
													style="margin-top: 5px; font-size: 15px; resize: none; width: 375px;" placeholder="여기에 내용을 작성 해주세요." ></textarea>
											<input type="hidden" name="mg_receiver" value="admin@gmail.com">
											<input type="hidden" name="mg_sender" value="${mb.cm_id}">	
										</form>								
									</div>
									<div class="panel panel-default">
									<!-- 여기까지 쪽지 1개 -->
									
									<div style="margin-top: 10px;">
										<input id="messageSendBtn" type="button" class="btn info_btn btn-send-message" 
											value="전송" onclick="self.close();">
									</div>
								</div>
							</div>
						</div>
					</div>
   					<!-- 여기까지 쪽지입니다. -->                        
                </div>
              </div>
            </div>
    


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
						alert("관리자에게 문의 메세지 전송 완료.")
						window.close();
					}
				});
						
	</script>
</body>

</html>