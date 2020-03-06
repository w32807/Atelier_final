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

<style type="text/css">
	.material_input{
		margin: 30px;
		text-align: center;
	}
	
	.material_input label {
		font-weight: bold; 
		color: darkslategray;
	}
	
</style>

</head>
<body>
   <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
      <div class="app-header header-shadow">
         <div class="app-header__logo">
            
            <!--로고 이름바꾸기. -->
            <div class="header__pane ml-auto">
            </div>
         </div>
         <div class="app-header__mobile-menu">
         </div>
         <div class="app-header__menu">
         </div>
         <div class="app-header__content">
            <div class="app-header-left">
               <div class="search-wrapper">
                  
                  <button class="close"></button>
               </div>
            </div>
         </div>
      </div>
      <div class="app-main">
         <!-- 좌측바 Include -->
			<div id="colorlib-page">
				<jsp:include page="AD_LBar.jsp" flush="false"/>
         
         <div class="app-main__outer">
            <div class="app-main__inner">
         
         <div class="row">
          <div class="col-md-12">
            <section class="panel">
              <header class="panel-heading">
                <h2 style="text-align:center;">원자재 업체 리스트</h2>
              </header>
              <form id="Materialfix" action="MaterialFix" method="post" onsubmit="return check()">
					<div class="material_input">
						<input type="hidden" id="RM_NUM" name="RM_NUM" value=${admDto.RM_NUM}>
						<label for="CM_ID" style="margin-top: 100px;">원자재 이름 *</label> 
						<input type="text" name="RM_TYPE" id="RM_TYPE" style="margin-left: 50px;" value=${admDto.RM_TYPE} readonly/>
					</div>
                            
					<div class="material_input">
						<label for="CM_PWD">납품 업체 *</label>
						<input type="text" name ="PRM_COMPANY" id="PRM_COMPANY" style="margin-left: 63px;" value=${admDto.PRM_COMPANY} required>
					</div>
					<div class="material_input">
						<label for="CON_CM_PWD">원자재 색상 *</label>
						<input type="text" name ="RM_COLOR" id="RM_COLOR" style="margin-left: 48px;" value=${admDto.RM_COLOR} required>
					</div>
					<div class="material_input">
						<label for="CM_NICK" style="margin-bottom: 70px;">원자재 단가 *</label>
						<input type="text" name="RM_PRICE" id="RM_PRICE" style="margin-left: 47px;" value=${admDto.RM_PRICE} required>
					</div>
					<div class="button" style="text-align: center;">
						<button type="submit" class="btn btn-info btn-lg" style=" width:120px; height:60; text-align: center; font-size: 15px;">등록하기</button>
					</div>
				</form>
            </section>
        </div>
   </div>
</div>
   </div>
         </div>
         <script src="./resources/ADATList/js/jquery.js"></script>
         <script src="./resources/ADATList/js/bootstrap.min.js"></script>
         <!-- nicescroll -->
         <script src="./resources/ADATList/js/jquery.scrollTo.min.js"></script>
         <script src="./resources/ADATList/js/jquery.nicescroll.js"
            type="text/javascript"></script>
         <!--custome script for all page-->
         <script src="./resources/ADATList/js/scripts.js"></script>
         	<script type="text/javascript"
					src="resources/assets/scripts/main.js"></script>
</body>
</html>