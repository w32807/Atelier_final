<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atelier | Admin</title>
</head>
<link href="./resources/ADATList/css/main.css" rel="stylesheet">

<body style="background-color:white;">
<!-- Modal HTML embedded directly into document -->
		<div class="container" style="text-align:center;">
						<div>
							<br style="clear: both">
							<div class="form-group col-md-13 " style="margin-top: 10px; margin-left: -30px;">
								<div>
									<input type="hidden" name="ft_num" value="${faq.ft_num}" readonly>
									<input type="hidden" value="날짜">
								</div>
								<h5 style="font-size: 15px; margin: 0 -10px 20px 25px;font-weight: 700; color: #e74c3c; float: right;">WRITER : ${faq.ft_id}</h5>
								<h5 style="font-size: 15px; margin: 0 -10px 20px 25px;font-weight: 700; color: #e74c3c; float: right;">DATE : ${faq.ft_regdate}</h5>
								
								<div class="col-sm-10" style="padding: 0;">
									<input type="text" class="form-control" value="${faq.ft_title}" readonly
										style="padding-right: 100px; width: 750px; border: none;">
								</div>
								<br>
								<textarea class="form-control input-sm " type="textarea"
									id="message" maxlength="140" rows="15" readonly
									style="width: 750px;">${faq.ft_contents}</textarea>


							</div>

							<div class="d-block text-center card-footer"
								style="margin-left: -33px; width: 750px; border: none;">
							
								<button type="hidden" onclick="self.close()" class="btn-wide btn btn-warning"
									style="background-color: #e74c3c; border-color: #e74c3c; color: white;">확인</button>
							</div>
						</div>
					</div>

<!-- Link to open the modal -->

</body>
<script type="text/javascript" src="resources/assets/scripts/main.js"></script>
</html>