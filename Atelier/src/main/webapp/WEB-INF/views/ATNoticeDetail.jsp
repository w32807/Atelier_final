<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
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
	function confirmDelete(at_nt_num) {
		theForm=document.delNotice;
		//document.객체의 이름으로 저장 하나의 태그를 변수로 저장
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			$("#delNotice").submit();
		}
	}	
</script>
	</script>
	<style type="text/css">
		.support-notice {
			letter-spacing: 1px;
			font-size: 14px;
			text-align: center;
			color: #3C6056;
			font-weight: 600;
			margin-bottom: 50px;
		}
		
		table{
			width: 950px;
			line-height: 1.5;
			margin-left: 260px;
		}
		
		table, th {
			margin-bottom: 15px;
			padding: 12px 0;
		    color: #353535;
		    vertical-align: middle;
		    font-size: 14px;
		    font-weight: 600;
		}
		
		table, tr, td {
			text-align: center;
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
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>

    <!-- 좌측바 Include -->
	<div id="colorlib-page">
		<jsp:include page="AT_LBar.jsp" flush="false"/>

		<div id="colorlib-main">
			<div class="colorlib-about">
				<div class="container-fluid"
					style="height: auto; min-height: 800px;">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box"
								data-animate-effect="fadeInLeft"
								style="margin-left: 100px; font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">
								공지사항
								<hr>
							</h2>
						</div>
					</div>
					<div class="support-notice" style="border: 2px solid; padding: 10px 0px;; margin-left: 200px; margin-right: 200px;">공지사항 게시판입니다. 공지사항을 제대로 읽지 않아 발생되는
                  모든 문제에 대해서는 책임지지 않습니다. 꼭 숙지 부탁드립니다.</div>
                  <div style="border: 2px solid; padding: 50px; margin: 10px 200px;">
               
                  <table style="margin-left: 50px;">
                     <tr>
                        <th style="width: 50px; text-align: center; color: #353535;">제목</th>
                        <th
                           style="width: 550px; text-align: left; padding-left: 15px; color: #353535;">${board.at_nt_title}</th>
                     </tr>
                     <tr style="border-bottom: 1px solid #A09182;">
                        <th style="width: 50px; text-align: center; color: #353535;">작성자</th>
                        <th
                           style="width: 550px; text-align: left; padding-left: 15px; color: #353535;">${board.at_nt_id}</th>
                        <th style="width: 235px; text-align: right; color: #353535;">조회수</th>
                        <th style="text-align: right; color: grey; padding-right: 30px;">${board.at_nt_count}</th>
                     </tr>
                     <tr>
                        <th style="height: 350px; display: block;">내용</th>
                        <th style="width: 550px; text-align: left; padding-left: 15px; color: #353535;">${board.at_nt_contents}</th>
                     </tr>
                  </table>
                  <hr style="border-color: #353535; margin-bottom: 15px;">
                  <center>
                     <input type="button" value="목록" onclick="location.href='ATNotice'" style="font-size:15px;" >
               </center>
                  <form action="delNotice" name="delNotice" method="get">
                     <input type="hidden" value="${board.at_nt_num}" name="at_nt_num">
                     <input id="deleteButton" type="button" value="글삭제" onclick="confirmDelete(${board.at_nt_num})" style="font-size:15px; float: right; margin-right: 20px;">
                  </form>
                  </div>
               
               </div>

            </div>
         </div>
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

	</body>
</html>