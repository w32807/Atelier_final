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
    <title>Atelier</title>

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

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="./resources/main/img/hero-1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <h1 style="margin-bottom: 30px;">Atelier</h1>
                            <p style="color: white;">아틀리에<br>품질 좋은 가죽 제품을 저렴한 가격에 만나 보실 수 있습니다</p>
                            <!-- <a href="#" class="primary-btn">Shop Now</a> -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="./resources/main/img/hero-2.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <h1 style="margin-bottom: 30px;">Atelier</h1>
                            <p style="color: white;">아틀리에<br>품질 좋은 가죽 제품을 저렴한 가격에 만나 보실 수 있습니다</p>
                            <!-- <a href="#" class="primary-btn">Shop Now</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner" >
                        <img src="./resources/main/img/banner-1.png">
                        <div id="first_bgi" class="inner-text">
                            <h4 style="background: none; margin-top: -25px; font-size: 30px; letter-spacing: 1px; color: #fff;">WALLET</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img  src="./resources/main/img/banner-2.png">
                        <div id="second_bgi" class="inner-text">
                            <h4 style="background: none; margin-top: -25px; font-size: 30px; letter-spacing: 1px; color: #fff;">BELT</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="./resources/main/img/banner-3.png">
                        <div id="third_bgi" class="inner-text">
                            <h4 style="background: none; margin-top: -25px; font-size: 30px; letter-spacing: 1px; color: #fff;">BAG</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Section End -->

    <!-- Women Banner Section Begin -->

    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div id="large_banner" class="product-large set-bg" data-setbg="./resources/main/img/product-img.png" onclick="location.href='prodList_All'">
                    	<h3 style="color: white; margin-top: -60px; margin-bottom: 30px;">Atelier</h3>
                        <h2>Products</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <!-- <div class="filter-control">
                        <ul>
                            <li class="active">All Products</li>
                            <li>Clothing</li>
                            <li>Bags</li>
                            <li>Shoes</li>
                            <li>wallet</li>
                            <li>belt</li>
                            <li>globe</li>
                            <li>furniture</li>
                            <li>accesary</li>
                        </ul>
                    </div> -->
                
                    <div class="product-slider owl-carousel" id="prodAJax">
                       <c:forEach var="pdDto" items="${pdList}">
                         <div class="product-item">
                            <div class="pi-pic">
                                <img src="./resources/main/img/products/${pdDto.imgOriName}" alt="">
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
									<li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
									<li class="quick-view"><a href="prodDetail?pd_code=${pdDto.pd_code}">+ Quick View</a></li>
									<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
								</ul>
                            </div>
                              <div class="pi-text">
                                        <div class="catagory-name">${pdDto.pd_cate}</div>
                                        <a href="prodDetail?pd_code=${pdDto.pd_code}">
                                            <h5>${pdDto.pd_name}</h5>
                                        </a>
                                        <div class="product-price">
                                           &#8361;${pdDto.pd_price}
                                            <span>&#8361;${pdDto.pd_price* 1.5}</span>
                                        </div>
                               </div>
                        </div>
                      </c:forEach>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Women Banner Section End -->

    <!-- 큰가방 카운트다운
    <section class="deal-of-week set-bg spad" data-setbg="./resources/main/img/time-bg.jpg">
        <div class="container">
            <div class="col-lg-6 text-center">
                <div class="section-title">
                    <h2>Deal Of The Week</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed<br /> do ipsum dolor sit amet,
                        consectetur adipisicing elit </p>
                    <div class="product-price">
                        $35.00
                        <span>/ HanBag</span>
                    </div>
                </div>
                <div class="countdown-timer" id="countdown">
                    <div class="cd-item">
                        <span>56</span>
                        <p>Days</p>
                    </div>
                    <div class="cd-item">
                        <span>12</span>
                        <p>Hrs</p>
                    </div>
                    <div class="cd-item">
                        <span>40</span>
                        <p>Mins</p>
                    </div>
                    <div class="cd-item">
                        <span>52</span>
                        <p>Secs</p>
                    </div>
                </div>
                <a href="#" class="primary-btn">Shop Now</a>
            </div>
        </div>
    </section>
    -->

    <!-- Man Banner Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>오늘의 공방</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var = "main_at_recommend_list" items = "${main_at_recommend_list}">
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-blog">
                    <a href="ATDetail?at_num=${main_at_recommend_list.at_seq}">
                        <img src="resources\upload\logo/${main_at_recommend_list.at_logo}" style="width:300px; height:450px;" alt="">
                        <div class="latest-text">
                            
                                <h4>이 집 가죽 잘하네 - ${main_at_recommend_list.at_name}</h4>
                            </a>
                            <p>#${main_at_recommend_list.at_cate1}, #${main_at_recommend_list.at_cate2}, #${main_at_recommend_list.at_cate3}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="benefit-items">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="./resources/main/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>무료 배송</h6>
                                <p>상품가격 상관없이!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="./resources/main/img/icon-2.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>신속한 배송</h6>
                                <p>하루빨리 보내드려요!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="./resources/main/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>안전한 결제</h6>
                                <p>100% 안전한 보안시스템!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->

    <jsp:include page="Main_Footer.jsp" flush="false"/>
</body>
    <!-- 사진 변환 스크립트 -->
    <script type="text/javascript">
    /* ---------------------------------------------------------------------------------------
	 * 기능: 메인 하단 이미지 전환
	 * 작성자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	 
    	$(function(){
    		$('#first_bgi').click(function(){
    			$("#large_banner").css('background-image', 'url(./resources/main/img/products/man-large.jpg)');
    		});
    		$('#second_bgi').click(function(){
  		    	$("#large_banner").css('background-image', 'url(./resources/main/img/products/mw-large.jpg)');
  		  	});
    		$('#third_bgi').click(function(){
  		    	$("#large_banner").css('background-image', 'url(./resources/main/img/products/couple-large.jpg)');
 			});
    	});
    </script>
	<!-- 메뉴태그 클래스 변경	 -->
	<script type="text/javascript">
    $('.filter-control ul li').on('click', function(){
		$('.filter-control ul li').removeClass('active');
		$(this).addClass('active');
	});
    </script>
    
    <script type="text/javascript">
    
   
    /* ---------------------------------------------------------------------------------------
	 * 기능: 로그인 여부에 따른 버튼 출력여부 결정
	 * 작성자: JSG
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
    window.onload = function(){
    	$('.hideandshow').hide();
    	var mid = '${mb.cm_id}';
    	var mname = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid);
    	console.log(mname);
    	if(mid != ''){
    		$('.hideandshow').show();
    	}
    	
    	$('.showandhide').show();
    	var mid1 = '${mb.cm_id}';
    	var mname1 = '${mb.cm_name}';
    	console.log('세션값'+'${mb}');
    	console.log(mid1);
    	console.log(mname1);
    	if(mid1 != ''){
    		$('.showandhide').hide();
    	}
    	
    	
    	/* ---------------------------------------------------------------------------------------
    	 * 기능: 로그인 여부 수정
    	 * 작성자: JSG
    	 * 작성일: 2020.02.13
    	 -----------------------------------------------------------------------------------------*/
    	var chk = "${check}";
		if(chk != ""){
			alert(chk);
			location.reload(true);//화면을 다시 한번 불러오면서 check를 리셋함 
		}
		
		/* ---------------------------------------------------------------------------------------
	     * 기   능: 이미 신청한 경우 main으로 이동.
	     * 작성일: 2020.02.07
	     * 작성자: JSG 
	     -----------------------------------------------------------------------------------------*/
	       var chk = '${checkRegist}';
	       if(chk == 1){
	          alert("이미 신청을 하였습니다.");
	          document.location.href = "main";
	       }
    }
    
	    $(document).ready(function() {
	    	var chgMessage = "${chgMessage}";
	    	if(chgMessage!=""){
	    		alert(chgMessage);
	    	}
	    });
    </script>
 
</html>