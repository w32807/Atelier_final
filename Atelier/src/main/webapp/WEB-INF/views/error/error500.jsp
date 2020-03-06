<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% response.setStatus(200);  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 오류</title>
</head>
<body>
<center>
	<div class="newslatter-item">
    	<a href="main">
    		<img src="./resources/main/img/logo_bottom.png" alt="" style="margin-top: 80px; height: 250px; width: 700px;">
   	 	</a>
    </div>
    <div>
    	<img src="./resources/main/img/error_ryan.png" alt="" style="height: 200px; width: 150px; float: right; padding-right: 500px; padding-top: 15px;">
    	<div style="padding-left: 700px; padding-top: 50px;">
			<h2>서버에서 다음의 오류가 발생했습니다.</h2>
			<p>오류 : ${exception.getMessage() }</p>
			<p>관리자에게 문의하세요 ㅋㅋ</p>
		</div>
	</div>
</center>
</body>
</html>



