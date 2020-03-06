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

              <table class="table table-striped table-advance table-hover" >
                <tbody style="text-align:center;">
                  <tr>
                    <th style="width:110px;"><i class="icon_menu"></i>&nbsp;원재료코드</th>
                    <th><i class="icon_cart_alt"></i>&nbsp;원재료</th>
                    <th><i class="icon_toolbox_alt"></i>&nbsp;제조업체명</th>
                    <th><i class="icon_cloud"></i>&nbsp;색상</th>
                    <th><i class="icon_zoom-in"></i>&nbsp;원가</th>
                   <th>&nbsp;수정</th>
                    <th>&nbsp;삭제</th>
                  </tr>
                  <c:forEach var="adcList" items ="${adcList}">
	                  <tr style="font-size:14px">
		                    <td>${adcList.RM_NUM}</td>
		                    <td>${adcList.RM_TYPE}</td>
		                    <td>${adcList.PRM_COMPANY}</td>
		                    <td>${adcList.RM_COLOR}</td>
		                    <td>${adcList.RM_PRICE}</td>
		                    <td class="text-center"><button type="button" id="PopoverCustomT-1" class="btn btn-info btn-sm" onclick="location.href='ADCompanyFix?RM_NUM=${adcList.RM_NUM}'">Update</button></td> 
		                    <td class="text-center"><button type="button" id="PopoverCustomT-1" class="btn btn-info btn-sm delCompany" onclick="location.href='ADCompanyDel?RM_NUM=${adcList.RM_NUM}'">Delete</button></td>                         
	                   </tr>
                    </c:forEach>
                </tbody>
              </table>
            </section>
            <br>
            
            <div class="row"     style="padding-left: 650px;">
						<div class="container">
							<div>
								<ul class="pagination">
									${ADCPaging}
								</ul>
							</div>
								<div>
								<button class="btn btn-info btn-lg" onclick="location.href='ADCompanyInsert'" style="float:right; width:100px; height:45px;"><h5>Insert</h5></button>
	          					</div>
						</div>
						
					</div>
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
	<script type="text/javascript">
		$(".delCompany").click(function(){
				alert("삭제되었습니다.");
			});
		
	</script>


</html>