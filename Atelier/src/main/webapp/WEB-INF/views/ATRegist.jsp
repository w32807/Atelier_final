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
    <title>Atelier | Regist</title>

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
</head>

<body>
    <jsp:include page="Main_Upper.jsp" flush="false"/>


    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>공방회원등록</span>
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
                         <a href="/">
                                <img src="./resources/main/img/logo_bottom.png" alt="" style="margin-top: 25px;">
                            </a>
                    </div>
                        
                        <form id="test" action="ATRegistProc" method="post">
                            <div class="group-input">
                                <label for="AT_NAME "><b>공방명을 입력하세요 *</b></label> 
                                <input type="text" id=AT_NAME name="ag_at_name" required >
                            </div>
                            <div class="group-input">
                                <label for="AT_PHONE "><b>공방 연락처를 입력하세요. *</b></label>
                                <input type="text" id="AT_PHONE" name="ag_phone" placeholder="Ex) 070-6749-5882" required>
                            </div>               
                            <div class="group-input">
                                <label for="AT_ID "> <b>Email*</b></label> 
                                <input type="text" id=AT_ID  name="ag_id" value="${mb.cm_id}" readonly>
                            </div>
                            <div class="group-input">
                                <label for="AT_SNSADDR "><b>공방Site or SNS. *</b></label>
                                <input type="url" id="AT_SNSADDR" name="ag_snsaddr" required>
                            </div>
                            <div class="group-input">
                                <label for="AT_CATE1 "><b>카테고리1 *</b></label>
                                <select id="AT_CATE1 " name="ag_cate1">
                                   <option value="없음">없음</option>
                                   <option value="의류">의류</option>
                                   <option value="가방">가방</option>
                                   <option value="신발">신발</option>
                                   <option value="지갑">지갑</option>
                                   <option value="벨트">벨트</option>
                                   <option value="장갑">장갑</option>
                                   <option value="가구">가구</option>
                                   <option value="기타 악세서리">기타 악세서리</option>
                                </select>
                            </div>
                            <div class="group-input">
                                <label for="AT_CATE2 "><b>카테고리2 *</b></label>
                                <select id="AT_CATE2 " name="ag_cate2">
                                   <option value="없음">없음</option>
                                   <option value="의류">의류</option>
                                   <option value="가방">가방</option>
                                   <option value="신발">신발</option>
                                   <option value="지갑">지갑</option>
                                   <option value="벨트">벨트</option>
                                   <option value="장갑">장갑</option>
                                   <option value="가구">가구</option>
                                   <option value="기타 악세서리">기타 악세서리</option>
                                </select>
                            </div>
                            <div class="group-input">
                                <label for="AT_CATE3 "><b>카테고리3 *</b></label>
                                <select id="AT_CATE3 " name="ag_cate3">
                                   <option value="없음">없음</option>
                                   <option value="의류">의류</option>
                                   <option value="가방">가방</option>
                                   <option value="신발">신발</option>
                                   <option value="지갑">지갑</option>
                                   <option value="벨트">벨트</option>
                                   <option value="장갑">장갑</option>
                                   <option value="가구">가구</option>
                                   <option value="기타 악세서리">기타 악세서리</option>
                                </select>
                            </div>
                            <div class="payment-check">
                                    <div class="pc-item">
                                        <label for="pc-check">
                                            <span>약관동의(필수)</span>
                                            <input type="checkbox" id="pc-check" required>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>                          
                                </div>
                            <button type="submit" class="site-btn register-btn" onclick="javascript:btn()">Atelier 공방신청</button>
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
    <!-- 공방신청 알림 -->

   <!-- 비밀번호 확인 -->
<script language='javascript'>

	// checkvalue 기능
	function checkvalue() {

		// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
		if (test.a.value && test.b.value) {

			// 두 필드의 값이 서로 다를 때
			if (test.a.value != test.b.value) {

				// status 필드에 일치하지 않는다는 문장 출력
				test.status.value = "[ 일치하지 않습니다 ]";

				// 그에 맞게 길이 수정
				test.status.style.width = 120;

				// 두 필드의 값이 동일 할 때
			} else {

				// status 필드에 일치한다는 문장 출력
				test.status.value = "[ 일치합니다 ]";

				// 역시 그에 맞게 길이 수정
				test.status.style.width = 83;
			}

			// a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
		} else {
			// 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
			test.status.value = "[ 비밀번호를 입력해 주세요 ]";
			// 그에 맞게 길이 수정
			test.status.style.width = 160;
		}

	}
</script>
<script type="text/javascript">
	/*	ATRegist가 준비가 되면 함수 실행 후 페이지 출력*/
	$(document).ready(function (){
		 var mid = '${mb.cm_id}';
	       console.log(mid);
	       if(mid == ''){
	          document.location.href = "login";
	       }
	});
</script>

</body>

</html>