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
    <title>Atelier | Sign In</title>

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
    
    <script type="text/javascript">
      		window.onload = function() {//이 페이지가 실행 되면, 이 함수를 실행해라
				var chk = "${check}";
				if(chk == "fail"){
					alert("회원 가입 실패");
					location.reload(true);//화면을 다시 한번 불러오면서 check를 리셋함 
				}
			}
	</script>
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
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                    <div class="newslatter-item">
                         <a href="main">
                                <img src="./resources/main/img/logo_bottom.png" alt="" style="margin-top: 25px;">
                            </a>
                    </div>
                        
                        <form id="memberJoinFrm" action="memberInsert" method="post" onsubmit="return check()">
                            <div class="group-input">
                                <label for="CM_ID">Email을 입력하세요. *</label> 
                                <input type="text" name="cm_id" id="CM_ID" placeholder="Ex) example@example.com" required>
                                <!-- 
                                <input type="button" value="중복검사" class="site-btn register-btn" id="CM_ID" >
                                 -->
                                 <div class="check_font" id="id_check"></div>
                            </div>
                            
                            <div class="group-input">
                                <label for="CM_PWD">Password를 입력하세요. *</label>
                                <input type="text" name ="cm_pwd" id="CM_PWD" placeholder="영문과 숫자를 조합한 8자리이상의 비밀번호 입력" required onblur=checkvalue();>
                            </div>
                            <div class="group-input">
                                <label for="CON_CM_PWD">Password 확인 *</label>
                                <input type="text" name ="CON_CM_PWD" id="CON_CM_PWD" required onblur=checkvalue();>
                            </div>
                            <!-- 비밀번호 일치/불일치 출력 -->
                            <input type="text" name="status" style="border:0;color:highlight;font size:12px 굴림;width:160" readonly onfocus="this.blur();" value=" 비밀번호를 입력해 주세요 ">  
                            <div class="group-input">
                                <label for="CM_NAME">성함을 입력하세요. *</label>
                                <input type="text" name="cm_name" id="CM_NAME" required>
                            </div>
                            <div class="group-input">
                                <label for="CM_NICK">닉네임을 입력하세요. *</label>
                                <input type="text" name="cm_nick" id="CM_NICK" required>
                            </div>
                            <div class="group-input">
                                <label for="CM_PHONE">전화번호를 입력하세요. *</label>
                                <input type="text" name="cm_phone" id="CM_PHONE" placeholder="Ex) 070-6749-5882" required>
                            </div>
                            <div class="group-input">
                                <label for="CM_ADDR">주소를 입력하세요. *</label>
                                <input type="text" name="cm_addr" id="CM_ADDR" required>
                            </div>
                            <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            개인정보 수집 및 이용에 대한 안내(필수)
                                            <input type="checkbox" id="pc-check" required>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>                          
                                </div>
                            <button type="submit" class="site-btn register-btn">Atelier 회원가입</button>
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
    
    <!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false"/>

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/main/js/main.js"></script>

<!-- 비밀번호 확인 -->
	<script language='javascript'>
/*---------------------------------------------------------------------------------
 * 기능 : 비밀번호 변경시 일치여부
 * 작성인 : KJH
 * 작성날짜 : 2020.02.04     최종수정일 :2020.02.18
 ----------------------------------------------------------------------------------*/
// checkvalue 기능
function checkvalue() {

	if(memberJoinFrm.cm_pwd.value && memberJoinFrm.CON_CM_PWD.value) {
		  if(memberJoinFrm.cm_pwd.value!=memberJoinFrm.CON_CM_PWD.value){
			   memberJoinFrm.status.value = "일치하지 않습니다";
			   memberJoinFrm.status.style.width = 120;
		  } else {
			   memberJoinFrm.status.value = "일치합니다";
			   memberJoinFrm.status.style.width = 83;
		  }
	} else {
		  memberJoinFrm.status.value = "비밀번호를 입력해 주세요";
		  memberJoinFrm.status.style.width = 160;
	}

}

</script>


	<script>
/* ---------------------------------------------------------------------------------------
 * 기능: 회원가입 / 아이디 유효성 검사
 * 작성자: JSH
 * 작성일: 2020.02.04
 -----------------------------------------------------------------------------------------*/
	$("#CM_ID").blur(function() {
		console.log("JSP 유효성 검사 실행")
		// id = "id_reg" / name = "userId"
		var CM_ID = $('#CM_ID').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/memJoinFrm/idCheck?CM_ID='+ CM_ID,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다!");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						//if(idJ.test(CM_ID)){
							// 0 : 아이디 길이 / 문자열 검사
							//$("#id_check").text("");
							//$("#reg_submit").attr("disabled", false);
							//}
						 if(CM_ID == ""){
							
							$('#id_check').text('아이디를 입력해주세요!');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							if (CM_ID.indexOf("@") != -1) {
							$('#id_check').text("사용 가능한 아이디 입니다!");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
							
							} else {
									$('#id_check').text("아이디를 E-mail 형식으로 입력해주세요!");
									$('#id_check').css('color', 'red');
									$("#reg_submit").attr("disabled", true);
							}
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		})
</script>
</body>
</html>