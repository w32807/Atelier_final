<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    content="Accordions represent collapsable component with extended functionality.">
<meta name="msapplication-tap-highlight" content="no">
<link href="./resources/ADATList/css/main.css" rel="stylesheet">

<script type="text/javascript">
	window.onload = function() {
	    var chk = "${check}";
	    if(chk != ""){
	        alert(chk);
	        location.reload(true); 
	    }
	}
</script>
</head>
<body>
    <div
        class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <div class="app-header header-shadow">
            <div class="app-header__logo">

                <!--로고 이름바꾸기. -->
                <div class="header__pane ml-auto">
                </div>
            </div>
            <div class="app-header__mobile-menu">
            </div>
            <div class="app-header__menu">
            </div>
            <div class="app-header__content">
                <div class="app-header-left">
                    <div class="search-wrapper">
                        <button class="close"></button>
                    </div>

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
                                	FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>
										<button class="btn-icon btn-icon-only btn btn-outline-danger"
											id="delBtn" style="margin-left: 1400px; font-weight: bolder;">
											삭제
										</button>
									</span>
                                </div>
                                <div class="table-responsive">
                                    <table
                                        class="align-middle mb-0 table table-borderless table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><input type="checkbox"
                                                    id="allCheck" ></th>
                                                <th class="text-center" style="width: 100px;">등록번호</th>
                                                <th class="text-center" style="width: 450px;">제목</th>
                                                <th class="text-center">작성자</th>
                                                <th class="text-center">작성일</th>
                                                <th class="text-center">상세보기</th>
                                            </tr>
                                        </thead>
                                    
                                        <form action="delFAQ" method="post" name="delFAQFrm">
                                        <tbody id="tbody">
                                        <c:forEach var='FAQ' items="${faqList}">
                                            <tr>
                                                <td class="text-center text-muted"><input
                                                    type="checkbox" name="FAQchk" value="${FAQ.ft_num}"></td>

                                                <td class="text-center text-muted">${FAQ.ft_num}</td>

                                                <td><div class="widget-content p-0"
                                                        style="text-align: center;">
                                                        <div class="widget-content-wrapper">
                                                            <div class="widget-content-left flex2">
                                                                <div class="widget-heading">${FAQ.ft_title}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td class="text-center">${FAQ.ft_id}</td>
                                                <td class="text-center">${FAQ.ft_date}</td>

                                                <td class="text-center">
                                                    <a href="ADFAQContents?ft_num=${FAQ.ft_num}" onclick="window.open(this.href,'_blank','width=800px,height=600px,toolbars=no,scrollbars=no');return false;">
                                                            <button type="button" id="PopoverCustomT-1" class="btn btn-primary btn-sm">Details</button>
                                                    </a>
                                                </td>

                                            </tr>

                                            </c:forEach>        
                                
                                        </tbody>
                                        </form>
                                    </table>

                                </div>

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
                            <form name="FAQFrm" id="FAQFrm">
                                <div class="form-group col-md-12 " style="margin-left: -50px;" id="inputFrm">
                                    <div class="col-sm-10" style="padding: 0;">
                                        <input type="text" class="form-control" placeholder="제목" name="ft_title" value=""
                                            style="padding-right: 100px; width: 1180px;">
                                    </div>
                                    <br>
                                    <textarea class="form-control input-sm " type="textarea" name="ft_contents" value=""
                                        id="message" placeholder="내용을 입력하세요" maxlength="500" rows="7"
                                        style="width: 1180px;"></textarea>
                                </div>
                            </form>
                            <div class="d-block text-center card-footer"
                                style="margin-left: -33px; width: 1180px;">

                                <button class="btn-wide btn btn-info" onclick="FAQInsert()">Save</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="./resources/assets/scripts/main.js"></script>
<script src="./resources/main/js/jquery-3.3.1.min.js" /></script>

<script src="./resources/js/jquery.serializeObject.js"></script>
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
      
      
      function FAQInsert() {
          
          var FAQFrm = $("#FAQFrm").serializeObject();
          console.log(FAQFrm);
          FAQFrm.ft_id = '${mb.cm_id}';
          FAQFrm.pageNum = '${pageNum}';
          
          $.ajax({
              url: "FAQInsert",
              type: "post",
              data: FAQFrm,
              dataType: "json",
              success: function(data) {
                 var faqList = '';
                 var inputFrm = '';
                 var dfaqList = data.faqList;
                 console.log(dfaqList[0].ft_regdate);
                  for(var i = 0; i < dfaqList.length; i++){
                     faqList +=     '<tr>'
                                    +'<td class="text-center text-muted">'
                                    +'<input type="checkbox" name="FAQchk" value="'+dfaqList[i].ft_num +'"></td>'
                                    +'<td class="text-center text-muted">'+ dfaqList[i].ft_num +'</td>'
                                    +'<td>'
                                    +'<div class="widget-content p-0" style="text-align: center;">'
                                            +'<div class="widget-content-wrapper">'
                                                +'<div class="widget-content-left flex2">'
                                                    +'<div class="widget-heading">'+ dfaqList[i].ft_title +'</div>'
                                                +'</div>'
                                            +'</div>'
                                        +'</div></td>'
                                    +'<td class="text-center">'+ dfaqList[i].ft_id +'</td>'
                                    +'<td class="text-center">'+ dfaqList[i].ft_regdate +'</td>'
                                    +'<td class="text-center"><a href="ADFAQContents?ft_num='+dfaqList[i].ft_num+'"'
                                        +'onclick='+'"window.open(this.href, '+"'_blank', "+"'width=800px,height=600px,toolbars=no,scrollbars=no')"+';return false;"'+'>'
                                            +'<button type="button" id="PopoverCustomT-1"'
                                                +'class="btn btn-primary btn-sm">Details</button>'
                                    +'</a></td>'
                                +'</tr>'
                 } 
                  inputFrm = '<div class="col-sm-10" style="padding: 0;">'
                                +'<input type="text" class="form-control" placeholder="제목" name="ft_title"  style="padding-right: 100px; width: 1180px;">'
                            +'</div>'
                            +'<br>'
                            +'<textarea class="form-control input-sm " type="textarea" name="ft_contents" id="message" placeholder="내용을 입력하세요"'
                            +'maxlength="140" rows="7"style="width: 1180px;"></textarea>'
                  
                  
                    $('#inputFrm').html(inputFrm);
                    $('#tbody').html(faqList);
                    console.log(faqList);
            },
            error: function(error) {
                alert("FAQ 입력 실패");
            }
          });
    }
      
       
    $("#delBtn").click(function() {//체크박스로 선택하여 삭제
            var chkLength = $("input:checkbox[name=FAQchk]:checked").length;
            console.log(chkLength);
            if(chkLength != 0){//체크한 체크박스가 있을 경우
                if(confirm(chkLength+"개의 목록을 삭제 하시겠습니까?")){
                        $("form[name=delFAQFrm]").submit();
                }
            }else {//체크한 체크박스가 없을 경우
                alert("삭제할 목록을 선택 해 주세요.");
            }
        });
      
      
   </script>
</html>

