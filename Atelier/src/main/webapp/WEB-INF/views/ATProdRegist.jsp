<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<!-- CkEditor -->
	<script type="text/javascript" src="resources/AT_front/ckeditor/ckeditor.js"></script>
	
	<style type="text/css">
		.title{
			width: 100px;
			height: 40px;
		
		}
	</style>
	
	</head>
	<body>
    <!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>

     <!-- 좌측바 Include -->
  <div id="colorlib-page">
		<jsp:include page="ATM_LBar.jsp" flush="false"/>
	
		
		<div id="colorlib-main">
			<div class="colorlib-about">
				<div class="container-fluid" style="margin-left: 100px;">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3">
							<h2 class="colorlib-heading animate-box" data-animate-effect="fadeInLeft"
									style="font-weight: bolder; font-size: 23px; letter-spacing: 0.5px;">제품 메뉴 제작<hr>
							</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div id="preview" class="about-img animate-box" data-animate-effect="fadeInLeft"
								style="margin-left: 90px; background-image: url(resources/main/img/products/null.jpg);">
							</div>
						</div>
						<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft" style="margin-top: 20px;">
							<div class="about-desc">
								<!-- 각각의 항목에 같은 class명을 부여하여, 등록 시 유효성 검사를 함  -->
							<form action="ATProdInsert" id="ATProdRegist" method="post" enctype="multipart/form-data">
								<table style="font-size: 15px; margin-top: 100px; margin-bottom: 140px;">
									<tr>
										<td class="title"><b>제 품 명</b></td>
										<td><input type="text" name="pd_name" class="content" placeholder="제품명" title="제품명" value="${modifyProdDto.pd_name}"></td>
									</tr>
									<tr>
                                        <td class="title"><b>공 방 명</b></td>
                                        <td><input type="text" name="pd_at_name" class="content" title="제품명" value='${myAt.at_name}' readonly="readonly"></td>
                                    </tr>
									<tr>
										<td class="title"><b>수&nbsp;&nbsp;량</b></td>
										<td><input name="pd_numofstock" class="content"
												type="number" min="0"
												style="border: none; width: 70px;" placeholder="수 량 "title="수량" value='${modifyProdDto.pd_numofstock}'></td>
									</tr>
									<tr>
										<td class="title"><b>단&nbsp;&nbsp;가</b></td>
										<td><input type="number" class="content" name="pd_price"  min="0"
                                                style="border: none; width: 70px;" placeholder="단 가"title="단가" value='${modifyProdDto.pd_price}'></td>
									</tr>
									<tr>
										<td class="title"><b>이미지 첨부</b></td>
										<td><input type="file" id="image" class="content" name="pi_oriname" title="이미지" accept=".gif, .jpg, .png" ></td>
										    
									</tr>
									<tr>
										<td class="title"><b>색&nbsp;&nbsp;상</b></td>
										<td><input type="text" class="content" name="pd_option" placeholder="색 상"title="색상" value='${modifyProdDto.pd_option}'></td>
									</tr>
									
									<tr>
										<td class="title"><b>타&nbsp;&nbsp;겟</b></td>
										<td>
										<select id="sex_select" class="content" name="pd_sex" placeholder="타겟" title="타겟" >
													<option >남성용</option>
													<option>여성용</option>
													<option>남녀공용</option>
										</select></td>
									</tr>
									<tr>
										<td class="title"><b>가죽 종류</b></td>
										<td><select id="type_select" class="content" name="pd_type" placeholder="가죽 종류" title="가죽 종류" value='${modifyProdDto.pd_sex}'>
												<c:forEach var="rmDto" items="${rmList}">
													<option>${rmDto.rm_type}</option>
												</c:forEach>
										</select>
									</tr>
									<tr>
										<td class="title"><b>카테고리</b></td>
										<td><select id="cate_select" class="content" name="pd_cate"title="카테고리" value='${modifyProdDto.pd_cate}'>
												<c:forEach var="ctDto" items="${ctList}">
													<option>${ctDto.ct_name}</option>
												</c:forEach>
											</select></td>
									</tr>
									
								</table>
								
								<table style="margin-left: -747px; width: 1150px;">
									<tr>
										<td style="display: inline; font-size: 16px; margin-left: 100px;"><b>상세내역</b></td>
									</tr>
									<tr>
										<td style="margin-left: 75px; margin-top: 10px; float: left; width: 1110px;">
											<textarea class="form-control content" id="p_content" name="pd_detail" title="상세내역" >
											</textarea>
										</td>
									</tr>
								</table>
								</form>
							</div>
							</div>
							<div style="float: right; margin-right: 50px">
								<input id="registBtn" type="button" name="order" value="등록"
									style="width: 60px; height: 30px; border: none; font-size: 16px; color: white; background-color: #A09182; margin: 80px 0 120px 640px;">
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
	<!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/jquery.serializeObject.js"></script>
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
		//클릭 시 모두 입력 하지 않았을 시 경고.
		function vaildChk() {
			var inputContent = $(".content");//content클래스로, 입력할 태그들을 배열로써 가져옴
			var inputLength = inputContent.length;//등록해야할 정보는 총 7개이다.
			var a = false;
			//var editor1 = CKEDITOR.replace( 'contents' );
			 CKEDITOR.instances.p_content.updateElement(); 
			 var data = CKEDITOR.instances.p_content.getData();
			inputContent.each(function() {//jquery에서의 for문은 이렇게 사용!
				a = false;//루프문 같이 돌리기 위해 지역변수로 선언
				//each메소드안에서 return false는 for문의 break 역할을, return true는 for문의 continue역할을 한다. 
				if($(this).val()==""||$(this).val()==null||$(this).val()==0){
					console.log($(this).attr('title'));
					alert($(this).attr('title')+"을 입력하세요!" );
					$(this).focus();
					console.log($(this).val());
					return a;
				}else {
					a = true;
				}
			})
			return a;
		}
		
		$("#registBtn").click(function() {
			//등록 버튼을 눌렀을 때 입력하지 않은 내용이 있다면 등록 되지 않게 처리
			var a = vaildChk();
			console.log(a);
			if(a){
				if(confirm("정말 제품 등록 하시겠습니까?")){
					console.log("제출합니다.");
					$("#ATProdRegist").submit();//ATProdManage(제품관리 페이지)로 이동!
				}
			 }else {
				
			}
		});
		
		//제품상세 입력의 ckEditor
		 CKEDITOR.replace('p_content', {height: 500});

			//이미지 업로드 시 미리보기
			$(function() {
	            $("#image").on('change', function(){
	                readURL(this);
	            });
	        });
			
			function readURL(input) {
				console.log(input.files);
	            if (input.files && input.files[0]) {
	            	
	            var reader = new FileReader();

	            reader.onload = function (e) {
	            	//console.log(e.target.result);
	            	console.log( $('#preview').css("background-image"));
	                    $('#preview').css({'background-image':'url('+e.target.result+')'});
	                }

	              reader.readAsDataURL(input.files[0]);
	            }
	        };
			      
	        $(document).ready(function() { 
		    	 var chk = "${check}";
	                if(chk == "수정하기"){
						$("#ATProdRegist").attr('action','prodModifyUpdate');
	                }
		    	 
		        $('#sex_select option').each(function(){
	
		            if($(this).val()=="${modifyProdDto.pd_sex}"){
	
		              $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	
		        	}
		        });
		        $('#type_select option').each(function(){
	
			        if($(this).val()=="${modifyProdDto.pd_type}"){
	
			           $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	
			  	    }
		        });
			    $('#cate_select option').each(function(){
	
				    if($(this).val()=="${modifyProdDto.pd_cate}"){
	
				       $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	
			    	}
			    });
		   			  
			    if('${oriName}'!=''){
			    	//$('#preview').attr('background-image','url(resources/prodImg/${oriName})');
			    	$("#preview").css({"background-image":"url(resources/main/img/products/${oriName})"}); 
			    }
			    
		        

		    }); 
	    
	     
	</script>
	</body>
</html>

