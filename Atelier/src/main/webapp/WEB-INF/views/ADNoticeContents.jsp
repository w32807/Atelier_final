<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier | Admin</title>
</head>
<link href="./resources/ADATList/css/main.css" rel="stylesheet">

<body style="background-color:lightblue;">
<!-- Modal HTML embedded directly into document -->
		<div class="container" style="text-align:center;">
						<div>
							<br style="clear: both">
							<div class="form-group col-md-12 " style="margin-left: -50px;">
								<div>
									<input type="hidden" value="작성자">
									<input type="hidden" value="조회수">
									<input type="hidden" value="날짜">
								</div>
								<form id="ADNoticeUpdateFrm" action="ADNoticeUpdate" method="post" value="${nt_num}">
									<div class="col-sm-10" style="padding: 0;">
										<input type="hidden" name="nt_num" value="${ntdto.nt_num}">
										<input type="text" class="form-control" value="${ntdto.nt_title}"
											readonly="readonly" id="nt_title" name="nt_title"
											style=" padding-right: 100px; width: 750px;">
									</div>
									<br>
									<textarea class="form-control input-sm " readonly="readonly" 
										id="nt_contents" name="nt_contents" maxlength="140" rows="15"
										style="width: 750px;">${ntdto.nt_contents}</textarea>
								</form>	
							</div>

							<div class="d-block text-center card-footer"
								style="margin-left: -33px; width: 750px;">
								<button class="btn-wide btn btn-info" id="saveBtn" style="display: none;">Save</button>
								<button class="btn-wide btn btn-info" id="closeBtn" onclick="window.close();"
									style="background-color: #d92550; border: #d92550;">Close</button>
								<button class="btn-wide btn btn-warning" id="modifyBtn">수정</button>
							</div>
						</div>
					</div>


<!-- Link to open the modal -->

</body>
<script type="text/javascript" src="resources/assets/scripts/main.js"></script>
<script src="./resources/main/js/jquery-3.3.1.min.js" /></script>
<script type="text/javascript">
	$("#modifyBtn").click(function() {
		$("#nt_title").removeAttr('readonly');	//선택한 요소의 특정 속성 제거
		$("#nt_contents").removeAttr('readonly');	//선택한 요소의 특정 속성 제거
		$("#saveBtn").show();
		$("#closeBtn").hide();
	})
	
	$("#saveBtn").click(function() {
		var nt_title = $("#nt_title").val();
		var nt_contents = $("#nt_contents").val();
		
		if(nt_title == '' || nt_title == null) {
			alert("제목을 입력해주세요");
		}
		else if(nt_contents == '' || nt_contents == null) {
			alert("내용을 입력해주세요");
		}
		else {
			$("#ADNoticeUpdateFrm").submit();
			alert("공지사항 수정 완료!");
			opener.parent.location.reload();
			window.close();
		}
	})
</script>

</html>