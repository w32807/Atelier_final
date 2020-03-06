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

<style type="text/css">
.pagination>li>a {
   border-radius: 50% !important;
   margin: 0 5px;
}

#custom-search-form {
   margin: 0;
   margin-top: 5px;
   padding: 0;
}

#custom-search-form .search-query {
   padding-right: 3px;
   padding-right: 4px \9;
   padding-left: 3px;
   padding-left: 4px \9;
   /* IE7-8 doesn't have border-radius, so don't indent the padding */
   margin-bottom: 0;
   -webkit-border-radius: 3px;
   -moz-border-radius: 3px;
   border-radius: 3px;
}

#custom-search-form button {
   border: 0;
   background: none;
   /** belows styles are working good */
   padding: 2px 5px;
   margin-top: 2px;
   position: relative;
   left: -28px;
   /* IE7-8 doesn't have border-radius, so don't indent the padding */
   margin-bottom: 0;
   -webkit-border-radius: 3px;
   -moz-border-radius: 3px;
   border-radius: 3px;
}

.search-query:focus+button {
   z-index: 3;
}
</style>





<title>Atelier | Admin</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
   content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">

<!-- <link rel="shortcut icon" href="./resources/ADATList/img/favicon.png"> -->

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
   <div
      class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
      <div class="app-header header-shadow">
         <div class="app-header__logo">
            
            <!--로고 이름바꾸기. -->
            <div class="header__pane ml-auto">
             
            </div>
         </div>
         <div class="app-header__mobile-menu">
            
         </div>
         <div class="app-header__menu">
            <span>
               <button type="button"
                  class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                  <span class="btn-icon-wrapper"> <i
                     class="fa fa-ellipsis-v fa-w-6"></i>
                  </span>
               </button>
            </span>
         </div>
         <div class="app-header__content">
            <div class="app-header-left">

               <div class="container">
                  <div class="row"></div>

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
                     <header class="panel-heading no-border">
                           <b>공방회원 승인 / 거부 </b>
                          </header>
                        <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><input type="checkbox" id="allCheck"></th>
                                 
                                 <th><i class="icon_mail_alt"></i> Email</th>
                                 <th><i class="icon_calendar"></i> 공방명</th>
                                 <th><i class="icon_calendar"></i> 전화번호</th>
                                 <th><i class="icon_pin_alt"></i> 공방 SNS</th>
                                 <th><i class="icon_pin_alt"></i> 카테고리1</th>
                                 <th><i class="icon_pin_alt"></i> 카테고리2</th>
                                 <th><i class="icon_pin_alt"></i> 카테고리3</th>
                                 <th><i class="icon_pin_alt"></i> 승인</th>
                                 <th><i class="icon_pin_alt"></i> 불가</th>
                              </tr>
                              <c:forEach var="AGList" items="${AGList}">
                              <tr>
                                 <th><input type="checkbox"></th>
                                 
                                 <td>${AGList.ag_id}</td>
                                 <td>${AGList.ag_at_name}</td>
                                 <td>${AGList.ag_phone}</td>
                                 <td>${AGList.ag_snsaddr}</td>
                                 <td>${AGList.ag_cate1}</td>
                                 <td>${AGList.ag_cate2}</td>
                                 <td>${AGList.ag_cate3}</td>
                                 <div class="btn-group">
                                    <td style="text-align: center;"><a
                                       class="btn btn-primary" onclick="alert('등록되었습니다.!')" href="ATMemberUpCheck?check=true&&id=${AGList.ag_id}"><i
                                          class="icon_check_alt2"></i></a></td>
                                     

                                    <td style="text-align: center;"><a
                                       class="btn btn-danger" onclick="alert('취소되었습니다.!')" href="ATMemberUpCheck?check=false&&id=${AGList.ag_id}"><i
                                          class="icon_close_alt2"></i></a></td>
								
                                 </div>
                              </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                     </section>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script src="./resources/main/js/jquery-3.3.1.min.js" /></script>
   <script src="./resources/ADATList/js/bootstrap.min.js"></script>
   <!-- nicescroll -->
   <script src="./resources/ADATList/js/jquery.scrollTo.min.js"></script>
   <script src="./resources/ADATList/js/jquery.nicescroll.js"
      type="text/javascript"></script>
   <!--custome script for all page-->
   <script src="./resources/ADATList/js/scripts.js"></script>
   	<script type="text/javascript"
					src="resources/assets/scripts/main.js"></script>


   <script type="text/javascript">
      $(function() { //전체선택 체크박스 클릭 
         $("#allCheck").click(function() { //만약 전체 선택 체크박스가 체크된상태일경우 
            if ($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
               $("input[type=checkbox]").prop("checked", true);
            }
            // 전체선택 체크박스가 해제된 경우 
            else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
               $("input[type=checkbox]").prop("checked", false);
            }
         })
      })
   </script>

</body>
</html>