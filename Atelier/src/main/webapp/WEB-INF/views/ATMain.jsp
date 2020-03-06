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
    <title>Atelier | Atelier</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/main/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/main/css/style.css" type="text/css">
</head>

<body>
   <jsp:include page="Main_Upper.jsp" flush="false"/>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="main"><i class="fa fa-home"></i> Home</a>
                        <span>Atelier</span>
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
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
                    <div class="blog-sidebar">
                        <div class="blog-catagory" style="margin-bottom: 80px;">
                        	<h4 style="margin-bottom: 30px;">카테고리</h4>
                        	<input type="checkbox" id = "allCheck" value="전체" style="margin-bottom:20px;">전체
                        		<form action="ATMain" method="get">
	                            	<ul>
	                            		
		                                <li><input type="checkbox" name="category" value="의류">의류</li>
		                                <li><input type="checkbox" name="category" value="가방">가방</li>
		                               	<li><input type="checkbox" name="category" value="신발">신발</li>
		                                <li><input type="checkbox" name="category" value="지갑">지갑</li>
		                            </ul>
		                            <ul style="margin: -135px 0 0 120px;">
		                                <li><input type="checkbox" name="category" value="벨트">벨트</li>
		                                <li><input type="checkbox" name="category" value="장갑">장갑</li>
		                               	<li><input type="checkbox" name="category" value="가구">가구</li>
		                                <li><input type="checkbox" name="category" value="기타 악세서리">기타 악세서리</li>
		                            </ul>
		                            <input type="submit" value="적용하기"
		                            		style="cursor: pointer; border-style: solid; border-color: #e7ab3c; background-color: #e7ab3c; color: white; margin: 25px 0 0 175px;">
                    
                            	</form>
                        </div>
                        <div class="recent-post">
                            <h4>추천 공방</h4>
                        	<div class="recent-blog">
	                                <c:forEach var = "at_recommend_list" items = "${at_recommend_list}">
	                                <div class="rb-item" style="margin-bottom: -10px;">
	                                    <div class="rb-pic">
	                                       <a href="ATDetail?at_num=${at_recommend_list.at_seq}"><img src="resources\upload\logo/${at_recommend_list.at_logo}" alt="" style="width: 120px; height: 120px;"></a>
	                                    </div>
	                                    <div class="rb-text" style="margin-top: 10px;">
	                                    	<p><span style="font-size: 13px;">#${at_recommend_list.at_cate1} #${at_recommend_list.at_cate2} #${at_recommend_list.at_cate3}</span></p>
	                                    	<a href="ATDetail?at_num=${at_recommend_list.at_seq}"><p style="font-size: 16px;">${at_recommend_list.at_name}</p></a>
	                                    </div>
	                                </div>
	                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="row">
                    <!-- 여기서부터 for문으로 돌림 -->
                        <c:forEach var="at_filter_list" items="${at_filter_list}">
                        <div class="col-lg-6 col-sm-6">
                            <div class="blog-item">
                                <div class="bi-pic">
                                    <a href="ATDetail?at_num=${at_filter_list.at_seq}"><img src="resources\upload\logo/${at_filter_list.at_logo}" alt="" style="width: 300px;"></a>
                                </div>
                                <div class="bi-text">
                                 <a href="ATDetail?at_num=${at_filter_list.at_seq}">
                                	<h4>${at_filter_list.at_name}</h4><br>
                                	<p><span>#${at_filter_list.at_cate1} #${at_filter_list.at_cate2} #${at_filter_list.at_cate3}</span></p>
                                   
                                        
                                        <br>
                                    </a>
                                   
                                </div>
                            </div>
                        </div>
                       </c:forEach>
                        <!-- 여기서까지 for문으로 돌림 -->
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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
</body>
	<script>
	$(document).ready(function(){
			if('${checkedBoxArr[0]}' == "의류"||'${checkedBoxArr[0]}' =="가방"||'${checkedBoxArr[0]}' =="신발"||'${checkedBoxArr[0]}' =="지갑"||'${checkedBoxArr[0]}' =="벨트"||'${checkedBoxArr[0]}' =="장갑"||'${checkedBoxArr[0]}' =="가구"||'${checkedBoxArr[0]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[0]}']").prop("checked", true);
			if('${checkedBoxArr[1]}' == "의류"||'${checkedBoxArr[1]}' =="가방"||'${checkedBoxArr[1]}' =="신발"||'${checkedBoxArr[1]}' =="지갑"||'${checkedBoxArr[1]}' =="벨트"||'${checkedBoxArr[1]}' =="장갑"||'${checkedBoxArr[1]}' =="가구"||'${checkedBoxArr[1]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[1]}']").prop("checked", true);
			if('${checkedBoxArr[2]}' == "의류"||'${checkedBoxArr[2]}' =="가방"||'${checkedBoxArr[2]}' =="신발"||'${checkedBoxArr[2]}' =="지갑"||'${checkedBoxArr[2]}' =="벨트"||'${checkedBoxArr[2]}' =="장갑"||'${checkedBoxArr[2]}' =="가구"||'${checkedBoxArr[2]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[2]}']").prop("checked", true);
			if('${checkedBoxArr[3]}' == "의류"||'${checkedBoxArr[3]}' =="가방"||'${checkedBoxArr[3]}' =="신발"||'${checkedBoxArr[3]}' =="지갑"||'${checkedBoxArr[3]}' =="벨트"||'${checkedBoxArr[3]}' =="장갑"||'${checkedBoxArr[3]}' =="가구"||'${checkedBoxArr[3]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[3]}']").prop("checked", true);
			if('${checkedBoxArr[4]}' == "의류"||'${checkedBoxArr[4]}' =="가방"||'${checkedBoxArr[4]}' =="신발"||'${checkedBoxArr[4]}' =="지갑"||'${checkedBoxArr[4]}' =="벨트"||'${checkedBoxArr[4]}' =="장갑"||'${checkedBoxArr[4]}' =="가구"||'${checkedBoxArr[4]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[4]}']").prop("checked", true);
			if('${checkedBoxArr[5]}' == "의류"||'${checkedBoxArr[5]}' =="가방"||'${checkedBoxArr[5]}' =="신발"||'${checkedBoxArr[5]}' =="지갑"||'${checkedBoxArr[5]}' =="벨트"||'${checkedBoxArr[5]}' =="장갑"||'${checkedBoxArr[5]}' =="가구"||'${checkedBoxArr[5]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[5]}']").prop("checked", true);
			if('${checkedBoxArr[6]}' == "의류"||'${checkedBoxArr[6]}' =="가방"||'${checkedBoxArr[6]}' =="신발"||'${checkedBoxArr[6]}' =="지갑"||'${checkedBoxArr[6]}' =="벨트"||'${checkedBoxArr[6]}' =="장갑"||'${checkedBoxArr[6]}' =="가구"||'${checkedBoxArr[6]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[6]}']").prop("checked", true);
			if('${checkedBoxArr[7]}' == "의류"||'${checkedBoxArr[7]}' =="가방"||'${checkedBoxArr[7]}' =="신발"||'${checkedBoxArr[7]}' =="지갑"||'${checkedBoxArr[7]}' =="벨트"||'${checkedBoxArr[7]}' =="장갑"||'${checkedBoxArr[7]}' =="가구"||'${checkedBoxArr[7]}' =="기타 악세서리") $("input:checkbox[value='${checkedBoxArr[7]}']").prop("checked", true);
	});

	</script>
	
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
	
</html>