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
    <title>Atelier | Basket</title>

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
    <!-- 상단바 Include -->
	<jsp:include page="Main_Upper.jsp" flush="false"/>


    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="prodList_All">Shop</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    
    <section class="shopping-cart spad">
        <div class="container">
                    <div class="cart-table">
                    <form id="prodBuy" action="prodBuy" name="prodBuyFrm" method="post">
                        <table>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th class="p-name">제품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 가격</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody id="listBody">
                            	<c:forEach var="b" items="${bList}">
                                <tr>
                                    <td class="cart-pic first-row"><a href="prodDetail?pd_code=${b.bt_pd_code}"><img src="./resources/main/img/products/${b.pi_oriname}" alt=""></a></td>                                    <td class="cart-title first-row">
                                        <h5><a href="prodDetail?pd_code=${b.bt_pd_code}">${b.bt_at_name}</a></h5>
                                    </td>
                                    <td class="p-price first-row" title="${b.bt_num}">&#8361;${b.bt_price}</td>
                                    <td class="qua-col first-row">
                                        <div  class="quantity">
                                            <div id="${b.bt_num}" class="pro-qty">
                                                <input class="orderCount" name="${b.bt_num}" type="text" value="${b.bt_count}" min="1"> <!-- 수량조정 -->
                                            </div>
                                        </div>
                                    </td>
                                    <td name="${b.bt_num}" class="total-price first-row">&#8361;${b.bt_price*b.bt_count}</td> <!-- 총가격 -->
                                    <td class="close-td first-row"><i class="ti-close" onclick="deleteBasket(${b.bt_num})"></i></td> <!-- 취소버튼 -->
                                	<input type="hidden" name="orderBtNum" value="${b.bt_num}">
                                </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                       </form>
                       <form id="deleteFrm" action="deleteBasket">
                            <input id="deleteInput"  type="hidden" name="bt_num" value="">
                       </form>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="prodList_All" class="primary-btn continue-shop">쇼핑 계속하기</a>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="cart-total">총 가격 <span id="orderTotalPrice"></span></li>
                                </ul>
                                <a id="order" class="proceed-btn">구매하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
<!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <ul>
                            <li>Address: 인천 미추홀구 학익동 663-1 태승빌딩 5층</li>
                            <li>Phone: 032-876-3332</li>
                            <li>Email: whdgus5841@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                            <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
                            <a href="https://www.pinterest.co.kr/"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                        	<li><a href="CONotice">고객 센터</a></li>
                            <li><a href="CONotice">약관</a></li>
                            <li><a href="CONotice">개인 정보 처리 방침</a></li>
                            <li><a href="CONotice">QNA</a></li>
                            <li><a href="CONotice">Contact US</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="myPage">myPage</a></li>
                            <li><a href="basket">Basket</a></li>
                            <li><a href="ATRegist?id=${mb.cm_id}">공방 회원 신청</a></li>
                            <li class="ADhideandshow"><a href="ADNoticeList">Admin</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                         <a href="main">
                                <img src="./resources/main/img/logo_bottom.png" alt="" style="margin-top: 25px;">
                            </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="./resources/main/img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->


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
    <script src="resources/js/jquery.serializeObject.js"></script>
</body>
<script type="text/javascript">

		$(document).ready(function() {
			totalPriceCal();
		});
	
		$(".pro-qty").on("click", function() {
			var bt_num = $(this).attr('id');//상품 코드 가져옴
			console.log("주문번호 : "+bt_num);
			var totalPrice = 0;
		
			var price = $("td[title="+bt_num+"]").html();//가격
			var price = price.replace("₩", "");
			var count = $("input[name="+bt_num +"]").val();//수량
			totalPrice = price * count;
			console.log("가격 : " +price);
			console.log("수량 : " +count);
			console.log("해당 상품 총 가격 : " +totalPrice);
			$("td[name="+bt_num+"]").html("₩"+totalPrice);//총가격
			totalPriceCal();
			
		});
		
		function totalPriceCal(){	
	        var i = 0;
	        var total = 0;
	        $('.total-price').each( function() {
	          priceStr = $( this ).html();
	          var price = priceStr.replace("₩", "");
	          var priceInt = parseInt(price);
			  total += priceInt;	       	
	        });
	        console.log( typeof(total));
	       
	        console.log("전체 총 합계 : " + total);
	    	$("#orderTotalPrice").html("₩"+total);
		}
		
		
		$("#order").click(function(){
			if(confirm("장바구니의 상품을 구매 하시겠습니까?")){
				var numOfProd = $(".orderCount").length;//상품의 갯수
				var numOfCount = 0;
				$(".orderCount").each(function(){
					  var count = $(this).val();
					  console.log("각각 상품의 수량 "+count);
					  if(count == '0'){
						  
					  }else {
						  numOfCount++;
					}
				});
				
				if(numOfProd === numOfCount){
					var totalPrice = $("#orderTotalPrice").html();
					console.log("총 가격은...!! : "+totalPrice + "원입니다.");
					if(totalPrice != '0'){
						$("#prodBuy").attr("action","prodBuy");
						$("#prodBuy").submit();
					}else {
						alert("장바구니가 비어있습니다.");
					} 
				}else {
					alert("수량이 입력 되지 않은 상품이 있습니다.");
				}
			}
		})
		
		$(document).ready(function (){
		$('.ADhideandshow').hide();
		 var ad_state = '${mb.cm_state}';
	       console.log(ad_state);
	       if(ad_state == '관리자'){
	    	   $('.ADhideandshow').show();
	       }
	});
		
		function deleteBasket(bt_num){
			$("#deleteInput").val(bt_num);
			if(confirm("정말 장바구니에서 삭제하시겠습니까?")){
			$("#deleteFrm").submit();
			}
		
		}
</script>
</html>