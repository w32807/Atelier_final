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
                                <form id="FAQupdateFrm" action="FAQupdate" method="post">
                                        <input type="hidden" name="ft_num" value="${faq.ft_num}">
                                    <div class="col-sm-10" style="padding: 0;">
                                        <input id="title" type="text" class="form-control" value="${faq.ft_title}" readonly="readonly"
                                            name="ft_title" style="padding-right: 100px; width: 750px;">
                                    </div>
                                    <br>
                                    <textarea class="form-control input-sm " type="textarea" readonly="readonly"
                                        id="contents" maxlength="140" rows="15" name="ft_contents"
                                        style="width: 750px;" >${faq.ft_contents}
                                    </textarea>
                                </form>


                            </div>

                            <div class="d-block text-center card-footer"
                                style="margin-left: -33px; width: 750px;">
                                
                                <button class="btn-wide btn btn-info" id="saveBtn">Save</button>
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
        $("#title").removeAttr('readonly');
        $("#contents").removeAttr('readonly');                          
        
    });
    
    $("#saveBtn").click(function() {
        var title = $("#title").val();  
        var contents = $("#contents").val();    
        if(title == '' || contents == ''){
            alert("내용을 입력 해 주세요");
        }else {
            $("#FAQupdateFrm").submit();
            window.opener.location.reload();
            window.close();
        }
    });                 
                        
</script>
</html>