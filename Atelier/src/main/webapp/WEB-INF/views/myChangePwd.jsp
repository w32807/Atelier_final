<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<script type="text/javascript">
      		window.onload = function() {//이 페이지가 실행 되면, 이 함수를 실행해라
				var chk = "${check}";
				if(chk == "fail"){
					alert("정보 수정 실패");
					location.reload(true);//화면을 다시 한번 불러오면서 check를 리셋함 
				}
			}
</script>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Atelier | My Page</title>

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
                
				<div class="col-lg-9 order-1 order-lg-2">
					<!-- Register Section Begin -->
					<div class="register-login-section spad">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 offset-lg-3">
									<div class="login-form">
										<h2>비밀번호 변경</h2>
										<form name="myChangePwd" action="myChangePwdProc" method="get">
											<input type="hidden" name="cm_id" value="${mb.cm_id}">
											<div class="group-input">
												<label for="CM_PWD">기존 Password를 입력해주세요. *</label> <input
													type="text" name="pwd1" id="CM_PWD" required>
											</div>
											<div class="group-input">
												<label for="CM_PWD">변경할 Password를 입력해주세요. *</label> <input
													type="text" name="pwd2" id="CM_PWD" required
													onblur=checkvalue();>
											</div>
											<div class="group-input">
												<label for="CON_CM_PWD">변경할 Password를 재입력 해주세요.*</label> <input
													type="text" name="pwd3" id="COM_CM_PWD" required
													onblur=checkvalue();>
											</div>
											<input type="text" name="status"
												style="border: 0; color: highlight; font size: 12px 굴림; width: 160"
												readonly onfocus="this.blur();" value="비밀번호를 입력해 주세요">
											<div class="group-input gi-check">
												<div class="gi-more">
													<!-- 비밀번호 찾기 
                                    <a href="#" class="forget-pass">passward 찾기</a>
                                    -->
												</div>
											</div>
											<button type="submit" class="site-btn login-btn">비밀번호
												변경하기</button>
										</form>
										<div class="switch-login">
											<a href="login" class="or-login">로그인</a>
										</div>
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
<!-- 비밀번호 확인 -->


<script language='javascript'>
/*---------------------------------------------------------------------------------
 * 기능 : 비밀번호 변경시 일치여부
 * 작성인 : KJH
 * 작성날짜 : 2020.02.04     최종수정일 :2020.02.18
 ----------------------------------------------------------------------------------*/
function checkvalue() {

	if(myChangePwd.pwd2.value && myChangePwd.pwd3.value) {
		  if(myChangePwd.pwd2.value!=myChangePwd.pwd3.value){
		   myChangePwd.status.value = "[ 일치하지 않습니다 ]";
		   myChangePwd.status.style.width = 120;
		  } else {
		   myChangePwd.status.value = "[ 일치합니다 ]";
		   myChangePwd.status.style.width = 83;
		  }
		
	} else {
	  myChangePwd.status.value = "비밀번호를 입력해 주세요";
	  myChangePwd.status.style.width = 160;
	}
}

</script>
<script type="text/javascript">
    
   
    /* ---------------------------------------------------------------------------------------
	 * 기능: 로그인 여부에 따른 버튼 출력여부 결정
	 * 작성자: JSG
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
    
    $(document).ready(function() {
    	var chgMessage = "${chgMessage}";
    	if(chgMessage!=""){
    		alert(chgMessage);
    	}
    })
    </script>
</body>

</html>