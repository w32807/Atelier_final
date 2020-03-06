<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier | Messenger</title>
</head>
<link href="./resources/ADATList/css/main.css" rel="stylesheet">

<body style="background-color:lightblue;">
	<!-- Modal HTML embedded directly into document -->
	<div class="container" style="text-align: center; ">
		<div>
			<br style="clear: both">
			<div class="form-group col-md-12 " style="margin-left: -50px;">
				<div>
					<input type="hidden" value="작성자">
					<input type="hidden" value="조회수">
					<input type="hidden" value="날짜">
				</div>
				<div class="col-sm-10" style="padding: 0;">
					<h4 style="float:left;">contents</h4>
					<input type="text" class="form-control" value="${mgDto.mg_sender}"
						style="padding-right: 100px; width: 750px;">
				</div>
				
				<br>
				<textarea class="form-control input-sm " type="textarea" 
					id="message" maxlength="140" rows="5" style="width: 750px;">${mgDto.mg_contents}</textarea>


			</div>
			<form id="messageFrm" action="ADmessageSendBtn" method="get">
										
			<div>
				<br style="clear: both">
				<div class="form-group col-md-12 " style="margin-left: -50px;">
					<div class="col-sm-10" style="padding: 0;">
						<h4 style="float:left;">answer</h4>
					</div>
					<br>
					<br>
					<textarea class="form-control input-sm " type="textarea" name="mg_contents" 
						id="message" maxlength="140" rows="5" style="width: 750px;"></textarea>
					<input type="hidden" name="mg_receiver" value="${mgDto.mg_sender}"><!-- 송신자의 아이디는 session에 담겨있을테니 여기서 안 보내도 됨. -->
					<input type="hidden" name="mg_sender" value="${mb.cm_id}">					
					<input type="hidden" name="mg_num" value="${mgDto.mg_num}">
				</div>

			
					<button class="btn-wide btn btn-info" type="submit" value="전송" style="float: right; font-size: 15px;" onclick="window.close()">Send</button>
				
			</div>
		</form>
	</div>


		<!-- Link to open the modal -->
</body>
<script type="text/javascript" src="resources/assets/scripts/main.js"></script>

</html>