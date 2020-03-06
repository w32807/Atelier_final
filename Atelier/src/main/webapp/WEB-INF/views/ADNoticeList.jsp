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
<title>Atelier | Admin</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="This is an example dashboard created using build-in elements and components.">
<meta name="msapplication-tap-highlight" content="no">
<link href="./resources/ADATList/css/main.css" rel="stylesheet">


</head>
<body>
	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<div class="app-header header-shadow">
			<div class="app-header__logo">
			</div>
			<div class="app-header__mobile-menu">
			</div>
			<div class="app-header__menu">
			</div>
			<div class="app-header__content">
				<div class="app-header-left">
				</div>

			</div>
		</div>

		<div class="app-main">
			<!-- 좌측바 Include -->
			<div id="colorlib-page">
				<jsp:include page="AD_LBar.jsp" flush="false"/>
		
			<div class="app-main__outer">
				<div class="app-main__inner">

					<div class="row">
						<div class="col-md-12">
							<div class="main-card mb-3 card">
								<div class="card-header">
									공지사항
									<span>
										<button class="btn-icon btn-icon-only btn btn-outline-danger"
											id="deleteBtn" style="margin-left: 1400px; font-weight: bolder;">
											삭제
										</button>
									</span>
									<div class="btn-actions-pane-right"></div>
								</div>
								
								<div class="table-responsive">
									<!-- 공지사항 리스트는 Ajax로 처리 -->
									<form action="ADNoticeDelete" method="post" id="ADNoticeDeleteFrm" name="deleteNoticeFrm">
										<table class="align-middle mb-0 table table-borderless table-striped table-hover">
											<thead>
												<tr>
													<th class="text-center"><input type="checkbox"
														id="allCheck"></th>
													<th class="text-center" style="width: 100px;">등록번호</th>
													<th class="text-center" style="width: 450px;">제목</th>
													<th class="text-center">작성자</th>
													<th class="text-center">조회수</th>
													<th class="text-center">상세보기</th>
												</tr>
											</thead>
											<tbody id="ntTable" name="ntTable">
												<c:forEach var="notice" items="${ntlist}">
													<tr>
														<td class="text-center text-muted">
															<input type="checkbox" name="NoticeChk" value="${notice.nt_num}">
														</td>
														<td class="text-center">${notice.nt_num}</td>
														<td>
															<div class="widget-content p-0" style="text-align: center;">
																<div class="widget-content-left flex2">
																	<div class="widget-heading">${notice.nt_title}</div>
																</div>
															</div>
														</td>	
														<td class="text-center">${notice.nt_id}</td>	
														<td class="text-center">${notice.nt_count}</td>	
														<td class="text-center">
															<a href="ADNoticeContents?nt_num=${notice.nt_num}" onclick="window.open(this.href, '_blank', 'width=800px,height=600px,toolbars=no,scrollbars=yes');return false;">
																<button type="button" id="PopoverCustomT-1"
																	class="btn btn-primary btn-sm" onclick="noticeViewUpdateAjax();">Details</button>
															</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</form>
								</div>
								<!-- 여기다가 EL 넣고 자바단에서 수정 삭제 등록-->
							</div>
						</div>
					</div>
					<div class="row" style="padding-left: 650px;">
						 <div class="container">
							<ul class="pagination">
								 ${paging} 
							</ul>
						</div> 		
					</div>

					<div class="container">
						<div style="min-height: 430px;">
							<br style="clear: both">
							<form id="ADNoticeFrm" name="ADNoticeFrm">
								<div class="form-group col-md-12 " style="margin-left: -50px;" id="inputFrm">
									<div class="col-sm-10" style="padding: 0;">
										
										<input type="text" class="form-control" placeholder="제목"
											id="nt_title" name="nt_title"
											style="padding-right: 100px; width: 1180px;">
									</div>
									<br>
									<textarea class="form-control input-sm " placeholder="내용을 입력하세요"
										id="nt_contents" name="nt_contents" maxlength="500" rows="7"
										style="width: 1180px;"></textarea>
								</div>
								<div class="d-block text-center card-footer" style="margin-left: -33px; width: 1180px;">
									<button type="button" class="btn-wide btn btn-info" onclick="noticeInsertAjax();">Save</button>
								</div>
							</form>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="resources/assets/scripts/main.js"></script>
	<script src="./resources/main/js/jquery-3.3.1.min.js" /></script>
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
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="./resources/js/jquery.serializeObject.js"></script>
   <script type="text/javascript">
   window.onload = function() {
		var chk = "${check}";
		console.log(chk);
		if(chk != ""){
			alert(chk);
			location.reload(true); 
		}
	}
   
	function isNull(elem) {
		if(elem == null || elem == "") {
			return true;
		}
		return false;
	}
	
	//공지사항 등록 Ajax
	function noticeInsertAjax() {
		var noticeListFrm = $("#ADNoticeFrm").serializeObject();
		console.log(ADNoticeFrm);
		noticeListFrm.nt_title = $("#nt_title").val();
		noticeListFrm.nt_contents = $("#nt_contents").val();
		noticeListFrm.pageNum = '${pageNum}';
		
		console.log(noticeListFrm);
		
		$.ajax({
			url: "ADNoticeInsert",
			type: "post",
			data: noticeListFrm,
			dataType: "json",
			success: function(data) {
				console.log(data.ntlist);
				var ntlist = '';
				var inputFrm = '';
				for(var i = 0; i < data.ntlist.length; i++) {
					ntlist += '<tr>' + '<td class="text-center text-muted">'
					+ '<input type="checkbox">' + '</td>'
					+ '<td class="text-center">' + data.ntlist[i].nt_num + '</td>'
					+ '<td>'+'<div class="widget-content p-0" style="text-align: center;">'
					+ '<div class="widget-content-left flex2">'
					+ '<div class="widget-heading">' + data.ntlist[i].nt_title + '</div>'
					+ '</div>'+'</div>'+'</td>'	
					+ '<td class="text-center">' + data.ntlist[i].nt_id + '</td>'	
					+ '<td class="text-center">' + data.ntlist[i].nt_count + '</td>'	
					+ '<td class="text-center">'
					+ '<a href="ADNoticeContents" onclick="window.open(this.href, "_blank", "width=800px,height=600px,toolbars=no,scrollbars=yes");return false;">'
					+ '<button type="button" id="PopoverCustomT-1" class="btn btn-primary btn-sm">Details</button>'
					+ '</a>'
					+ '</td>'
					+ '</tr>'
				}
				inputFrm = '<div class="col-sm-10" style="padding: 0;">'
					+'<input type="text" class="form-control" placeholder="제목" id="nt_title" name="nt_title" style="padding-right: 100px; width: 1180px;">'
					+'</div>'
					+'<br>'
					+'<textarea class="form-control input-sm " placeholder="내용을 입력하세요" id="nt_contents" name="nt_contents" maxlength="140" rows="7" style="width: 1180px;">'
					+'</textarea>'
					
				$('#inputFrm').html(inputFrm);
				$('#ntTable').html(ntlist);
				alert("공지사항 등록 완료!");
				location.reload();
			},
			error: function(error) {
				alert("공지사항 등록 실패");
			}
		})
	}
	
	//공지사항 삭제
	$("#deleteBtn").click(function(){
		var checkedBox = $("input[name=NoticeChk]:checked").length;
		console.log(checkedBox);
		
		if(checkedBox != 0) {
			if(confirm(checkedBox+"개의 목록을 삭제 하시겠습니까?")) {
				$("#ADNoticeDeleteFrm").submit();
				//window.location.reload();
			}
		} else {
			alert("삭제할 목록을 선택 해 주세요.");
		}
	})

	</script>

</html>