<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<!-- 프로필 이미지 스타일 -->
<style type="text/css">
	.img_wrap{
		max-width: 120px;
		margin-top: 30px;
		
	}
	.img_wrap img {
		max-width: 100%;
		text-align: center;
		padding-bottom: 0px;
	}
	#CM_ID {
		color: black;
		font-weight: bold;
	}
	
</style>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/style.css"
	type="text/css">
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
						<a href="/"><i class="fa fa-home"></i> Home</a> <span>My
							Page</span>
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
                
				<!-- 빈칸시작 -->
				<div class="col-lg-9 order-1 order-lg-2">
					<!-- Register Section Begin -->
					<div class="register-login-section spad" style="padding-top:0px; padding-bottom:80px;">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 offset-lg-3">
									<div class="register-form">
									<hr>
										<div class="newslatter-item">
											<h3 style="text-align:center"><b>회원정보 변경</b></h3>
										</div>
										<hr>
										<form id="test" action="MyPageFix" method="post" enctype="multipart/form-data">
											<!-- 이미지 업로드 -->
											<div>
											<label for="CM_ID"><p><b>프로필 사진</b></p></label>
												<div class="img_wrap" style="margin: auto;">
													<img src="./resources/main/img/blog/penguin.jpg" style ="border:3px solid darkgrey; max-width: 100%;border-radius:20% ; "id="img"/ >
												</div>
											</div>
											<hr>
											<div>
												<input type="file" id= "input_img" name=input_img onchange="fileChk(this)" />
												<input type="hidden" 	id="filecheck" value="0" name="fileCheck">
											</div>
											<hr>
											<!--  이미지 업로드 끝 -->
										
											<div class="group-input">
												<label for="CM_ID"><b>회원 Email</b></label> 
												<input type="text" name="CM_ID" id=CM_ID value=${mb.cm_id} readonly/>
											</div>
											<div class="group-input">
												<label for="CM_NAME"><b>이름. *</b></label> <input type="text"
													name="CM_NAME" id="CM_NAME" value=${mb.cm_name} required>
											</div>
											<div class="group-input">
												<label for="CM_NICK"><b>닉네임. *</b></label> <input type="text"
													name="CM_NICK" id="CM_NICK" value=${mb.cm_nick} required>
											</div>
											<div class="group-input">
												<label for="CM_PHONE"><b>전화번호. *</b></label> <input type="text"
													name="CM_PHONE" id="CM_PHONE" value=${mb.cm_phone} required>
											</div>
											<div class="group-input">
												<label for="CM_ADDR"><b>배송지1. *</b></label> <input type="text"
													name="CM_ADDR" id="CM_ADDR" value=${mb.cm_addr} required>
											</div>
											<div class="group-input">
												<label for="CM_ADDR"><b>배송지2. *</b></label> <input type="text"
													name="CM_ADDR2" id="CM_ADDR" value=${mb.cm_addr2} >
											</div>
											<button type="submit" class="site-btn register-btn"
												onclick="javascript:btn()">수정하기.</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Register Form Section End -->
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
	<script
		src="<c:url value="/resources/main/js/jquery.countdown.min.js"/>"></script>
	<script
		src="<c:url value="/resources/main/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/resources/main/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/main.js"/>"></script>
	<script>
function btn(){
    alert('정보가 수정되었습니다!');
}
</script>
<script type="text/javascript">
    /* ---------------------------------------------------------------------------------------
	 * 기능: 로그인 여부에 따른 버튼 출력여부 결정
	 * 작성자: JSG
	 * 수정자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
    window.onload = function(){
    	$('.hideandshow').hide();
    	var mid = '${mb.cm_id}';
    	var mname = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid);
    	console.log(mname);
    	if(mid != ''){
    		$('.hideandshow').show();
    	}
    	
    	$('.showandhide').show();
    	var mid1 = '${mb.cm_id}';
    	var mname1 = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid1);
    	console.log(mname1);
    	if(mid1 != ''){
    		$('.showandhide').hide();
    	}
    	
    }
    </script>
    
    <script type="text/javascript">
    /* ---------------------------------------------------------------------------------------
	 * 기능: 프로필 사진 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	 
   var sel_file;
   
   $(document).ready(function(){
      $("#input_img").on("change", handleImgFileSelect);
   });
   
   function handleImgFileSelect(e) {
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);
      
      filesArr.forEach(function(f) {
         if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
         }
         
         sel_file = f;
         
         var reader = new FileReader();
         reader.onload = function(e) {
            $("#img").attr("src",e.target.result);
            
         }
         reader.readAsDataURL(f);
      });
   }
   
</script>

<script type="text/javascript">
/* ---------------------------------------------------------------------------------------
 * 기능: 프로필 이미지 업로드 체크
 * 작성자: JSH
 * 작성일: 2020.02.05
 -----------------------------------------------------------------------------------------*/
	
	//파일 입력이 되었을 때, > <input type="hidden" id="filecheck" value="0" name="fileCheck">의 value 값을 1로 바꿔주자.
	function fileChk(elem) {
		console.log(elem);
		console.dir(elem.value);
		
		if(elem.value == ""){
			console.log("empty");
			$("#filecheck").val(0); 
		}
		else{
			console.log("not empty");
			$("#filecheck").val(1);
		}
	}
</script>

<script type="text/javascript">
/* ---------------------------------------------------------------------------------------
 * 기능: 프로필 이미지 미리보기 출력
 * 작성자: JSH
 * 작성일: 2020.02.06
 -----------------------------------------------------------------------------------------*/
	var imgRoot = 'resources/upload/profile/';
	var sessionImg = '${mb.cm_pfphoto}';
	var sessionImgRP = sessionImg.replace('com','jpg');
	console.log(sessionImgRP);
	
	var sessionImgView = imgRoot+sessionImgRP;
	console.log(sessionImgView);
	
	document.getElementById('img').setAttribute('src',sessionImgView);
</script>

</body>

</html>