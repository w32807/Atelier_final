<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<link href="./resources/ADATList/css/main.css" rel="stylesheet">


</head>
<body>
	<div class="app-sidebar sidebar-shadow">
		<div class="scrollbar-sidebar">
			<div class="app-sidebar__inner">
				<section style="border: shadow">
					<div>
						<a href="main"><button class="btn btn-info btn-lg"
								style="width: 290px; margin-left: -20px; text-align: center;">
								<h4 style="margin-right: 10px;">
									<i class="fa fa-home"></i> Atelier
								</h4>
							</button></a>
					</div>
				</section>
				<ul class="vertical-nav-menu">
					<li class="app-sidebar__heading">고객관리</li>
					<ul>
						<li><a href="ADNoticeList"> 공지사항 </a> <a href="ADFAQ">
								FAQ </a></li>
					</ul>
					<li>
					<li class="app-sidebar__heading">회원관리</li>
					<ul>
						<li><a href="ADMessage"> <!--여기에 메--> 메세지답변
						</a></li>
					</ul>
					</li>
					<li>
					<li class="app-sidebar__heading">공방관리</li>
					<ul>
						<li><a href="ADATMemberUp"> 공방회원 승인 / 거부 </a></li>
						<li><a href="ADATList"> <i class="metismenu-icon"> </i>공방리스트
						</a></li>
					</ul>
					</li>

					<li class="app-sidebar__heading">업체관리</li>
					<ul>
						<li><a href="ADCompany"> 원자재 업체 리스트 </a></li>
					</ul>
					<li class="app-sidebar__heading">상품관리</li>
					<ul>

						<li><a href="ADProdManage"> 상품삭제 </a></li>
					</ul>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="resources/assets/scripts/main.js"></script>
<script src="./resources/main/js/jquery-3.3.1.min.js" /></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../resources/js/jquery.serializeObject.js"></script>
</html>