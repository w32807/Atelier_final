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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
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
		
	</style>
	<script type="text/javascript">
      		window.onload = function() {//이 페이지가 실행 되면, 이 함수를 실행해라
				var chk = "${check}";
				if(chk != ""){
					alert(chk);
					location.reload(true);//화면을 다시 한번 불러오면서 check를 리셋함 
				}
			}
</script>
<script type="text/javascript">
         window.onload = function(){
            var chk = ${check};
            
            if(chk == 2){
               alert("글 등록 성공!");
               location.reload(true);
            }
         }
</script>
	</head>
	
	<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>

   <!-- 좌측바 Include -->
   <div id="colorlib-page">
      <jsp:include page="AT_LBar.jsp" flush="false"/>

      <div id="colorlib-main">
         <div class="colorlib-about">
            <div class="container-fluid" style="height: auto; min-height: 800px;">
               <div class="row">
                  <div class="col-md-6 col-md-offset-3 col-md-pull-3">
                     <h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
                        style="margin-left: 100px; font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">공지사항<hr></h2>
                  </div>
               </div>
               <div class="support-notice">
                  공지사항 게시판입니다. 공지사항을 제대로 읽지 않아 발생되는 모든 문제에 대해서는 책임지지 않습니다. 꼭 숙지 부탁드립니다.
               </div>
               <!-- 메세지 전송 -->
               <table>
                  <tr style="background-color: #A09182;">
                     <th style="width: 60px; text-align: center; color: white;">No</th>
                     <th style="width: 550px; text-align: center; padding-left: 15px; color: white;">Title</th>
                     
                     <th style="width: 130px; text-align: center; color: white;">Writer</th>
                     <th style="width: 120px; text-align: center; padding-right: 15px; color: white;">View</th>
                  </tr>
               </table>
         
               <div style="height:250px; overflow:auto; ">
                  <table>
                  <c:forEach var="nitem" items ="${ntList}">
                        <tr style="background-color: white; border-bottom: 2px solid #A09182; height:40px;">
                           <td style="width: 60px; text-align: center;">
                              ${nitem.at_nt_num}
                           </td>
                           <td style="width: 550px; text-align: center; padding-left: 15px;">
                              <a href="ATNoticeDetail?at_nt_num=${nitem.at_nt_num}" style="color: #353535;">${nitem.at_nt_title}</a>
                           </td>
                           
                           <td style="width: 100px;">
                              ${nitem.at_nt_id}
                           </td>
                           <td style="width: 140px;">
                              ${nitem.at_nt_count}
                           </td>
                        </tr>
                        </c:forEach>

                  </table>
                  <button class="NTConfig" onclick="location.href='./ATNoticeWrite'" style="font-size:15px; float: right; margin-right: 300px; margin-top: 10px;">글쓰기</button>
               </div>
                  <div>
                  </div>
                  <hr>
            </div>
         </div>
      </div>
   </div>
	<!----------------------------------------------------------여기서부터 하단바입니다.-------------------------------------------------------------------------->
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
	<script type="text/javascript">
	
	
	<!-- MAIN JS -->
	<script src="resources/AT_front/js/main.js"></script>

	</body>
</html>