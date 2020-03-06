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
         font-size: 13px;
         text-align: center;
         color: #e24949;
         font-weight: 600;
         margin-bottom: 50px;
      }
      
      table{
         width: 950px;
         line-height: 1.5;
         margin-left: 280px;
      }
      
      table, th {
         margin-bottom: 15px;
         padding: 12px 0;
          border-bottom: 1px solid #dfdfdf;
          color: #353535;
          vertical-align: middle;
          font-size: 14px;
          font-weight: 600;
      }
      
      table, tr, td {
         text-align: center;
      }
      
      .pagination li.active a:hover {
         background-color: #F0AD46;
          border: 1px solid #F0AD46;
      }
   </style>
   </head>
   <body>
   <!-- 상단바 Include -->
   <jsp:include page="Main_Upper.jsp" flush="false"/>
    
    <!-- 좌측바 Include -->
   <div id="colorlib-page">
      <jsp:include page="AT_LBar.jsp" flush="false"/>

      <div id="colorlib-main" style="float: none; margin-left: 380px;">
         <div class="colorlib-blog">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6 col-md-offset-3 col-md-pull-3">
                     <h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
                        style="margin-left: 100px; font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">판매물품<hr></h2>
                  </div>
               </div>
               <div class="row" style="margin: 20px 80px;">
                 	<c:forEach var="pd" items="${pdList}">
							<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
								<div class="blog-entry">
									<a href="/ATProductDetail" class="blog-img"><img src="resources/main/img/products/${pd.pi_oriname}" 
										class="img-responsive" style="width:350px; height:350px;">
									</a>
									<div class="desc">
										<h3><a href="/ATProductDetail">${pd.pd_name}</a></h3>
										<p>${pd.pd_price}<br>${pd.pd_sex}</p>
										<a href="/prodDetail?pd_code=${pd.pi_pd_code}" class="lead">Read More <i class="icon-arrow-right3"></i></a>
									</div>
								</div>
							</div>
						</c:forEach>
               </div>

               <div class="row" style="margin-left: 80px;">
                  <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                     <ul class="pagination">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#" style="background-color: #F0AD46; border: 1px solid #F0AD46;">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">&raquo;</a></li>
                     </ul>
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