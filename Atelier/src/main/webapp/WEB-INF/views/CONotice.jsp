<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Atelier | Service</title>


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/style.css"
	type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/main/css/CONtice.css"
	rel="stylesheet">
</head>

<style>
body {
	padding-top: 20px;
}

nav>.nav.nav-tabs {
	border: none;
	color: #fff;
	background: #272e38;
	border-radius: 0;
}

nav>div a.nav-item.nav-link, nav>div a.nav-item.nav-link.active {
	border: none;
	padding: 18px 25px;
	color: #fff;
	background: #272e38;
	border-radius: 0;
}

.tab-content {
	background: #fdfdfd;
	line-height: 25px;
	border: 1px solid #ddd;
	border-top: 5px solid #e74c3c;
	border-bottom: 5px solid #e74c3c;
	padding: 30px 25px;
}

nav>div a.nav-item.nav-link:hover, nav>div a.nav-item.nav-link:focus {
	border: none;
	background: #e74c3c;
	color: #fff;
	border-radius: 0;
	transition: background 0.20s linear;
}

.red {
	color: red;
}

</style>
</head>
<body>
	<!-- 상단바 Include -->
	<jsp:include page="Main_Upper_RC.jsp" flush="false"/>

	<div class="container">
		<div class="row">
			<div class="col-md-12 " style="margin-bottom: 100px;">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#nav-home" role="tab"
							aria-controls="nav-home" aria-selected="true">공지사항
						</a>					
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#nav-profile" role="tab" aria-controls="nav-profile"
							aria-selected="false">약관
						</a>							
						<a class="nav-item nav-link" id="nav-FAQ-tab" data-toggle="tab"
							href="#nav-FAQ" role="tab" aria-controls="nav-FAQ"
							aria-selected="false">FAQ
						</a>
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
							href="#nav-contact" role="tab" aria-controls="nav-contact"
							aria-selected="false">Contact Us
						</a>
						<a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab"
							href="#nav-about" role="tab" aria-controls="nav-about"
							aria-selected="false">메세지 문의
						</a>
					</div>
				</nav>

				<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					<!-- 공지사항 -->
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<br>
						<div class="table-responsive">
							<table class="align-middle table table-borderless table-striped table-hover">
								<thead>
									<tr>
										<!-- <th>선택</th> -->
										<th class="text-center" style="width: 160px;">등록번호</th>
										<th class="text-center" style="width: 450px;">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">조회수</th>
										<th class="text-center">상세보기</th>
									</tr>
								</thead>
								<tbody id="nList" name="nList">
									<c:forEach var="bnotice" items="${noticeList}">
										<tr>
											<td class="text-center text-muted">${bnotice.nt_num}</td>
												<td>
												<div class="widget-content p-0" style="text-align: center;">
													<div class="widget-content-wrapper">
														<div class="widget-content-left flex2">
															<div class="widget-heading">${bnotice.nt_title}</div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center">${bnotice.nt_id}</td>
											<td class="text-center">${bnotice.nt_count}</td>
											<td class="text-center">
												<a href="CONoticeContents?Noticenum=${bnotice.nt_num}"
													onclick="window.open(this.href, '_blank', 'width=700px,height=600px,toolbars=no,scrollbars=yes');return false;">
													<button type="button" id="PopoverCustomT-1"
														class="btn btn-primary btn-sm"
														style="background-color:#e74c3c; border-color:#e74c3c;">
														상세보기
													</button>
												</a>
											</td>
										</tr>
									</c:forEach>								
								</tbody>
							</table>
							<p style="text-align:center; margin-top: 30px;">${paging}</p>
						</div>
					</div>

					<!-- 약관 -->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab"><br>
						<textarea class="col-md-12" style="resize: none; height: 650px;">
Google에 오신 것을 환영합니다.

Google 제품 및 서비스(‘서비스’)를 이용해 주셔서 감사합니다. 서비스는 1600 Amphitheatre Parkway, Mountain View, CA 94043, United States에 소재한 Google LLC(‘Google’)에서 제공합니다.

서비스를 이용함으로써 귀하는 본 약관에 동의하게 되므로 본 약관을 주의 깊게 읽어보시기 바랍니다.

Google 서비스는 매우 다양하므로 때로 추가약관 또는 제품 요구사항(연령 요건 포함)이 적용될 수 있습니다. 추가약관은 관련 서비스에 대하여 제공되며, 귀하가 해당 서비스를 이용하는 경우 이 추가약관은 귀하와 Google 간 계약의 일부가 됩니다.

Google 서비스 이용
귀하는 서비스 내에서 적용되는 모든 정책을 준수해야 합니다.

Google 서비스의 오용을 삼가시기 바랍니다. 예를 들어 서비스를 방해하거나 Google이 제공하는 인터페이스 및 안내사항 이외의 다른 방법을 사용하여 액세스를 시도하지 않아야 합니다. 귀하는 관련 수출 및 재수출 통제 법규 및 규정 등 오직 법률상 허용되는 범위에서만 Google 서비스를 이용할 수 있습니다. 귀하가 Google 약관이나 정책을 준수하지 않거나 Google이 부정행위 혐의를 조사하고 있는 경우, Google 서비스 제공이 일시 중지 또는 중단될 수 있습니다.

Google 서비스를 사용한다고 해서 Google 서비스 또는 액세스하는 콘텐츠의 지적재산권을 소유하게 되는 것은 아닙니다. 콘텐츠 소유자로부터 허가를 받거나 달리 법률에 따라 허용되는 경우를 제외하고, Google 서비스의 콘텐츠를 사용할 수 없습니다. 본 약관은 귀하에게 Google 서비스에 사용된 브랜드나 로고를 사용할 권리를 부여하지 않습니다. Google 서비스에 또는 Google 서비스와 함께 게재된 어떠한 법적 고지도 삭제하거나 감추거나 변경하지 마십시오.

Google 서비스는 Google이 소유하지 않은 일부 콘텐츠를 표시할 수 있습니다. 콘텐츠를 제공하는 주체는 해당 콘텐츠가 본 약관, 추가 약관 및 정책에 부합하도록 해야 하며, 그러한 콘텐츠에 대해서는 법률에 따라 Google이 책임지는 경우를 제외하고, 제공한 주체가 단독으로 책임지게 됩니다. 콘텐츠가 위법하거나(예를 들어, 저작권 침해 또는 인신매매를 유도하는 콘텐츠), 소송의 위험을 야기하거나(예를 들어, 명예훼손), 기타 본 약관이나 추가 약관을 중대하게 위반하거나 개별 서비스별로 공개된 정책을 위반한다고(예를 들어, 희롱, 괴롭힘 또는 위협적인 행동) 합리적으로 판단되는 경우, Google은 그러한 콘텐츠의 전부 또는 일부를 삭제하거나 차단할 수 있습니다. 그렇다고 반드시 콘텐츠를 검토한다는 의미는 아니므로, 콘텐츠를 검토할 것이라고 간주하지 마십시오. Google은 통지가 법적 이유로 금지되거나, 또는 이용자, 제3자, Google 및 그 계열사에 위해를 야기할 수 있다고 합리적으로 판단되는 경우(예를 들어, 통지하는 것이 법령 또는 규제당국의 명령을 위반하는 경우, 조사를 방해하는 경우, 본 서비스의 보안을 해하는 경우 등)를 제외하고, 귀하에게 해당 조치의 이유를 통지할 것입니다.

서비스 이용과 관련하여 Google은 귀하에게 서비스 고지, 관리 메시지 및 기타 정보를 발송할 수 있습니다. 귀하는 메시지 수신을 거부할 수 있습니다.

일부 Google 서비스는 휴대기기에서 사용할 수 있습니다. 트래픽 또는 보안 관련 법규 준수를 방해하거나 막는 방식으로 서비스를 사용해서는 안 됩니다.

귀하의 Google 계정
귀하가 Google 서비스를 이용하기 위해서는 Google 계정이 필요할 수 있습니다. 귀하가 Google 계정을 직접 만들 수도 있고, 고용주 또는 교육기관과 같은 관리자가 귀하에게 Google 계정을 배정할 수도 있습니다. 관리자가 배정한 Google 계정을 사용하고 있는 경우, 별도의 약관 또는 추가약관이 적용될 수 있으며 관리자가 귀하의 계정에 액세스하거나 계정을 해지할 수 있습니다.

Google 계정을 보호하려면 비밀번호를 비공개로 유지하십시오. 귀하는 Google 계정에서 또는 Google 계정을 통해 이루어지는 활동에 대한 책임이 있습니다. 타사 애플리케이션에서 Google 계정 비밀번호를 재사용하지 마십시오. 귀하의 비밀번호나 Google 계정이 무단으로 사용되고 있음을 알게 되는 경우 다음 도움말을 참조하시기 바랍니다.

개인정보 보호 및 저작권 보호
Google 개인정보처리방침은 귀하가 Google 서비스를 사용할 때 Google이 개인정보를 어떻게 취급하고 보호하는지에 대해 설명합니다.

Google은 미국 디지털 밀레니엄 저작권법(US Digital Millennium Copyright Act)에 규정된 절차에 따라 저작권침해를 주장하는 신고에 대응하고, 반복 침해자의 계정을 해지합니다.

Google은 저작권자가 온라인상에서 자신의 지적 재산을 관리할 수 있도록 정보를 제공합니다. 누군가 귀하의 저작권을 침해하고 있다고 생각되어 Google에 통지하고자 하는 경우, Google 도움말 센터에서 신고서 제출 방법 및 저작권 침해 신고에 대한 Google 대응 정책 관련 정보를 확인하실 수 있습니다.

Google 서비스에 포함된 귀하의 콘텐츠
귀하는 일부 Google 서비스에서 콘텐츠를 업로드, 제출, 저장, 전송, 수신할 수 있으며 이에 대해 귀하가 보유한 지적재산권은 귀하의 소유입니다. 즉, 귀하가 보유한 권리는 귀하에게 존속됩니다.

귀하가 콘텐츠를 Google 서비스로 또는 이를 통해 업로드, 제출, 저장, 전송 또는 수신하는 경우 귀하는 Google(및 Google의 협력사)이 이러한 콘텐츠를 사용, 저장, 복제, 수정, 이차적 저작물(귀하의 콘텐츠가 Google 서비스와 더 잘 작동하도록 Google이 생성하는 번역본, 개작본, 또는 수정본으로 인해 발생되는 것) 제작, 전달, 공개, 공개적으로 실연, 공개적으로 게시 및 배포할 수 있는 전 세계적인 라이선스를 제공하게 됩니다. 본 라이선스에서 귀하가 부여하는 권리는 Google 서비스를 운영, 홍보 및 개선하고 새로운 서비스를 개발하기 위한 제한적인 목적으로 사용됩니다. 다만, 서비스 중 일부에는 제출된 콘텐츠에 대한 Google의 사용 범위를 제한하는 약관 또는 설정이 있습니다. 따라서 귀하가 사용하는 특정 서비스 내 추가 약관 및 설정을 확인 및 활용하시기 바랍니다. Google 지도에 추가한 업체 정보와 같이 이용자가 관련 서비스의 이용을 중단한 경우에도 라이선스가 존속되는 경우가 있습니다. 그러나 관련 서비스에서는 서비스 내에 제출된 콘텐츠에 액세스하고 이를 삭제하는 방법을 제공할 수 있습니다. 귀하는 Google 서비스에 제출한 콘텐츠에 대해 Google에 라이선스를 부여하기 위해 필요한 권리를 보유해야 합니다.

Google은 사용자 콘텐츠를 분석하는 자동화된 시스템을 사용하여 맞춤 검색결과, 개인 맞춤 광고, 사용자의 서비스 이용 방식에 맞춘 그 밖의 기능 등을 제공합니다. 또한 사용자 콘텐츠를 분석하여 스팸, 멀웨어, 불법 콘텐츠 등 악용사례 감지에 이용합니다. 지메일 내용은 광고 개인맞춤화를 위해 사용되거나 검토되지 않습니다.

귀하가 Google 계정을 사용하는 경우 Google 서비스에 로그인하여 ‘Play’에서 곡을 리뷰하는 등의 상호작용을 하면 귀하의 이름과 사진이 귀하의 활동 옆에 표시됩니다. Google은 사용자의 공유 인증 설정에 따라 이 정보를 광고에 표시할 수도 있습니다.

Google이 콘텐츠를 사용 및 저장하는 방법에 대해 좀 더 자세한 정보가 필요한 경우, Google 개인정보처리방침 또는 특정 서비스에 대한 추가약관을 참조하시기 바랍니다. 귀하가 Google 서비스에 대한 의견이나 제안을 제출하는 경우 Google은 귀하에 대한 의무 없이 귀하의 의견이나 제안을 사용할 수 있습니다.

Google 서비스에 포함된 소프트웨어에 대하여
서비스에 다운로드 가능한 소프트웨어가 필요하거나 포함되는 경우, 소프트웨어에 대한 새로운 버전이나 기능이 제공되는 즉시 기기에서 소프트웨어가 자동으로 업데이트될 수 있습니다. 일부 서비스에서는 자동 업데이트 설정을 사용자가 직접 조정할 수도 있습니다.

Google은 귀하에게 서비스의 일부로 제공하는 소프트웨어를 사용할 수 있도록 개인적이고 전 세계적이며 양도불가능하고 비독점적인 무상 라이선스를 제공합니다. 이 라이선스는 본 약관에 따라 귀하가 Google이 제공한 대로 서비스를 사용하고 혜택을 누릴 수 있도록 하기 위한 목적으로만 제공됩니다. 귀하는 법률상 이와 같은 제한이 금지되거나 Google의 서면허가를 받은 경우를 제외하고, Google 서비스 또는 이에 포함된 소프트웨어의 일부를 복사, 수정, 배포, 판매 또는 대여할 수 없으며, 소프트웨어를 역설계하거나 소스 코드의 추출을 시도할 수 없습니다.

Google에서 오픈 소스 소프트웨어는 매우 중요한 의미를 가집니다. Google 서비스에서 사용되는 일부 소프트웨어는 귀하에게 제공하는 오픈 소스 라이선스에 따라 제공될 수 있습니다. 오픈 소스 라이선스에는 명시적으로 본 약관의 일부 규정에 우선하는 규정이 있을 수 있습니다.

Google 서비스의 수정 및 해지
Google은 서비스를 지속적으로 변경 및 개선하고 있습니다. Google은 기능을 추가 또는 제거할 수 있으며, 서비스를 일시 중지하거나 완전히 중단할 수 있습니다.

Google로서는 매우 안타까운 일이지만, 귀하는 언제라도 Google 서비스 이용을 중지할 수 있습니다. Google 또한 서비스 제공을 중단하거나 Google 서비스에 대해 새로운 제한을 추가하거나 만들 수 있습니다. 예를 들어, Google은 성능이나 보안을 개선하고, 기능이나 설정을 변경할 수 있습니다. 또한, 법령을 준수하거나, Google의 시스템 상의 불법적인 활동이나 악용을 방지하기 위해 변경을 할 수 있습니다.

귀하의 데이터는 귀하 소유이며, 이러한 데이터에 계속 액세스하도록 하는 것이 매우 중요하다고 Google은 믿고 있습니다. Google은 서비스를 중지하거나, 서비스 이용에 불리한 영향을 미치는 중대한 변경이 있다고 판단되면 귀하에게 합당한 사전 통지를 제공합니다. 다만, (i) 통지하는 것이 합리적으로 가능하지 않거나(예를 들어, 계정 로그인 없이 서비스를 이용하는 경우), (ii) 이용자에게 편익을 주는 서비스의 새로운 기능을 추가하는 변경 또는 (iii) 법적 이유에서 이루어지는 변경은 즉시 적용될 수 있습니다.

만약 귀하의 계정 전체가 이용불가능하게 된 경우에는 여기에 있는 불복 절차에 관한 정보를 참고하시기 바랍니다.

Google의 보증 및 부인
Google은 상업적으로 합리적인 수준의 기술을 사용하고 주의를 기울여 서비스를 제공하며, 귀하가 서비스를 누리게 되길 바랍니다. 단, 서비스에 대하여 약속할 수 없는 몇 가지 사항이 있습니다.

본 약관 또는 추가약관에 명시되지 않은 한 Google, 또는 Google의 공급자나 판매자는 서비스와 관련하여 어떠한 구체적인 약정도 하지 않습니다. 예를 들어, Google은 서비스에 속한 콘텐츠, 서비스의 특정 기능, 서비스의 신뢰성, 이용가능성 또는 귀하의 요구를 충족할 능력에 대하여 어떠한 약정도 하지 않습니다. Google은 서비스를 ‘있는 그대로’ 제공합니다.

일부 사법관할권 내에서는 상품성, 특정목적에의 적합성 및 비침해성에 대한 묵시적 보증과 같은 특정 보증이 인정됩니다. Google은 법률상 허용되는 한도 내에서 모든 보증을 배제합니다.

Google 서비스에 대한 책임
법률상 허용되는 경우, Google, Google의 공급자 및 판매자는 일실이익, 일실수입, 망실자료, 재무적 손실, 간접 손해, 특별 손해, 결과적 손해, 징계적 손해, 또는 징벌적 손해에 대해 책임지지 않습니다.

법률상 허용되는 한도 내에서, 묵시적 보증을 포함하여 본 약관에 따른 청구에 대한 Google, Google의 공급자 및 판매자의 총 책임은 귀하가 서비스 사용을 위해 Google에 지급한 금원(또는 Google의 선택에 따라 귀하에게 서비스를 다시 제공하는 것)으로 제한됩니다.

어떤 경우에도 Google, Google의 공급자 및 판매자는 합리적으로 예측 불가능한 손실이나 손해에 대해 책임지지 않습니다.

일부 국가에서는 귀하에게 소비자로서의 법적 권리가 부여된다는 것을 Google은 알고 있습니다. 개인적인 목적으로 서비스를 사용 중인 경우에는 본 약관이나 추가약관의 어떤 규정도 계약에 의해 철회될 수 없는 법적 소비자 권리를 제한할 수 없습니다.

업체의 Google 서비스 사용
업체를 대신하여 Google 서비스를 사용하는 경우 다음 약관이 적용됩니다. 서비스 이용 또는 해당 약관 위반으로 인해 발생하거나 이와 관련된 모든 소송, 고소 또는 조치로부터 Google과 Google의 제휴사, 임원, 대행사 및 직원을 보호하고 면책해야 하며 여기에는 각종 책임과 소송, 손실, 피해, 고소, 판결, 소송 비용 및 변호사 수임료 등으로 인한 비용도 포함됩니다.

본 약관에 대하여
Google은 서비스의 변경사항을 반영하거나 법령, 규제, 보안 등의 이유로 본 약관이나 서비스에 적용되는 추가약관을 수정할 수 있습니다. Google은 중대한 변경에 관하여 합당한 사전 통지를 제공할 것입니다. 모든 변경은 적어도 통지 후 30일 이후에 적용됩니다. 단, 이용자에게 편익을 주는 서비스의 새로운 기능 또는 설정과 관련된 변경이나 법률적인 사유로 인한 변경은 즉시 발효될 수 있습니다. 서비스에 대해 변경된 약관에 동의하지 않는 경우 해당 서비스의 사용을 중지해야 합니다.

본 약관과 추가약관이 상충하는 경우, 상충하는 사항에 대하여 추가약관이 적용됩니다.

본 약관은 Google과 귀하와의 관계를 규율하며, 어떠한 제3자의 수익권도 발생시키지 않습니다.

귀하가 본 약관을 준수하지 않은 경우, 당사가 즉시 조치를 취하지 않더라도 이는 당사가 가지고 있는 권리(향후 조치를 취하는 것 등)를 포기함을 의미하지 않습니다.

특정 조항이 집행 불가능한 것으로 판명되는 경우, 이는 다른 조항에 영향을 미치지 않습니다.

일부 국가의 법원에서는 일부 분쟁 유형에 캘리포니아 법률을 적용하지 않습니다. 캘리포니아 법률의 적용이 배제된 국가에 거주하고 있는 경우, 거주 국가의 법률이 본 약관과 관련된 분쟁에 적용될 수 있습니다. 그렇지 않은 경우, 귀하는 본 약관 또는 서비스와 관련하여 발생되는 분쟁에 대해 미국 캘리포니아주 법률이 적용되며, 캘리포니아주 국제사법의 적용은 배제된다는 것에 동의합니다. 마찬가지로, 거주 국가의 법원에서 미국 캘리포니아주 산타클라라 카운티 법원의 관할 지역이나 재판지의 적용을 동의하지 않는 경우에도 본 약관과 관련된 분쟁에 현지 관할 지역이나 재판지가 적용될 수 있습니다. 그렇지 않은 경우, 본 약관 또는 서비스와 관련하여 발생되는 모든 소송은 독점적으로 미국 캘리포니아주 산타클라라 카운티의 연방 또는 주 법원에서 다루어지며 귀하와 Google은 이러한 법원이 인적 관할을 갖는 것에 동의합니다.

Google에 문의하는 방법을 보려면 문의 페이지를 참조하시기 바랍니다.
               			</textarea>
					</div>					

					<!-- FAQ -->	
						<div class="tab-pane fade" id="nav-FAQ" role="tabpanel"
							aria-labelledby="nav-FAQ-tab" align="center">
							<form id="CONoticeFAQFrm" name="CONoticeFAQFrm">
								<div class="row">
									<div class="col-md-12" style="padding-top: 1.5rem;">
										<div id="accordion" class="accordion-wrapper mb-12">
											<div class="table-responsive">
												<table class="align-middle table table-borderless table-striped table-hover">
													<thead>
														<tr>
															<th class="text-center" style="width: 160px;">등록번호</th>
															<th class="text-center" style="width: 450px;">제목</th>
															<th class="text-center">작성자</th>
															<th class="text-center">작성일</th>
															<th class="text-center">상세보기</th>
														</tr>
													</thead>
													<tbody id="faqList" name="faqList">
														<c:forEach var="FAQ" items="${faqListBoard}">
															<tr>
																<td class="text-center text-muted">${FAQ.ft_num}</td>
																	<td>
																	<div class="widget-content p-0" style="text-align: center;">
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
																	<a href="COFAQContents?ft_num=${FAQ.ft_num}"
																		onclick="window.open(this.href, '_blank', 'width=800px,height=600px,toolbars=no,scrollbars=yes');return false;">
																		<button type="button" id="PopoverCustomT-1"
																			class="btn btn-primary btn-sm"
																			style="background-color:#e74c3c; border-color:#e74c3c;">
																			상세보기
																		</button>
																	</a>
																</td>
															</tr>
														</c:forEach>								
													</tbody>
												</table>
												<p style="text-align:center; margin-top: 30px;">${FAQpaging}</p>
											</div>	
										</div>
									</div>
								</div>
							</form>
						</div>

					<!-- Contact Us -->
					<div  class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">

						<!-- Map Section Begin -->
							<!-- 지도를 표시할 div 입니다 -->
						<div id="map" style="width:100%;height:800px; display: block; "></div>

						<script>
							// Initialize and add the map

							function initMap() {
								// The location of Uluru
								var uluru = {
									lat : 37.438767,
									lng : 126.675085
								};
								// The map, centered at Uluru
								var map = new google.maps.Map(
								document.getElementById('map'), {
									zoom : 17,
									center : uluru
								});
								// The marker, positioned at Uluru
								var marker = new google.maps.Marker({
									position : uluru,
									map : map,
									info: '말풍선 안에 들어갈 내용',
									title: 'Atelier'
								});
								
								var content = "<h5><b>Atelier Building</b></h5><p>인천광역시 미추홀구 학익동 663-1 Atelier 빌딩";
								
								var infowindow = new google.maps.InfoWindow({content: content});
								
								google.maps.event.addListener(marker, "click", function() {
						            infowindow.open(map,marker);
								});

							}
						</script>
						<script async defer
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc_ZbCtkK4m_JITKv4tiuyM3XcKcgiAYo&callback=initMap">
						</script>

						<!-- Map Section Begin -->

						<!-- Contact Section Begin -->
						<section class="contact-section spad">
							<div class="container">
								<div class="row">
									<div class="col-lg-5" style="margin-left: 100px;">
										<div class="contact-title">
											<h4>Contacts Us</h4>
											<p>Atelier로의 연락은 아래로 부탁드립니다!</p>
										</div>
										<div class="contact-widget">
											<div class="cw-item">
												<div class="ci-icon">
													<i class="ti-location-pin"></i>
												</div>
												<div class="ci-text">
													<span>Address:</span>
													<p>인천광역시 미추홀구 Atelier 빌딩</p>
												</div>
											</div>
											<div class="cw-item">
												<div class="ci-icon">
													<i class="ti-mobile"></i>
												</div>
												<div class="ci-text">
													<span>Phone:</span>
													<p>+81 10.5453.1234</p>
												</div>
											</div>
											<div class="cw-item">
												<div class="ci-icon">
													<i class="ti-email"></i>
												</div>
												<div class="ci-text">
													<span>Email:</span>
													<p>AtelierAdmin@Atelier.com</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 offset-lg-1" style="margin-left: 80px;">
										<div class="contact-form">
											<div class="leave-comment">
												<h4>Sign In</h4>
												<p>Atelier의 회원이 되어 즐거운 쇼핑을 즐겨 보세요!</p>
												<form action="#" class="comment-form">
													<div class="row">
														<div class="col-lg-6">														
															<button type="button" class="site-btn" onclick="location.href='memJoinFrm'">Sign In</button>
														</div>
													</div>
														<br>
														<br>
														<h4>Log In</h4>
														<p>이미 Atelier의 회원이시라면, 로그인 후 관리자에게 문의사항을 남겨주세요!</p>
														<div class="row">
														<div class="col-lg-12">
															<button type="button" class="site-btn" onclick="location.href='login'">Log In</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>

					</div>


					<!-- message -->
					<div class="tab-pane fade" id="nav-about" role="tabpanel"
						aria-labelledby="nav-about-tab" align="center">
						<div class="container">
							<div class="row">
								<div class="col-md-12 col-md-offset-3">
									<div class="well well-sm">
										
											<fieldset>

												<!-- Message body -->
										<form class="form-horizontal" action="ADsendMessage" method="post" name="sendingForm">
												<div class="form-group">
													<label class="col-md-6 control-label" for="message" align="left">Your message</label>
													
													<input type="hidden" name="mg_receiver" value="admin@gmail.com">
													<input type="hidden" name="mg_sender" id="sender" value="${mb.cm_id}">													
													<div class="col-md-6">
														<textarea class="form-control" id="message" name="mg_contents" placeholder="Please enter your message here..." rows="7"></textarea>
													</div>
												</div>

												<!-- Form actions -->
												<div class="form-group">
													<div class="col-md-12 text-right">
														<input type="button" class="btn btn-primary btn-lg" onclick="adSendMessage()" value="Submit">
													</div>
												</div>
										</form>
											</fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- 하단바 Include -->
	<jsp:include page="Main_Footer.jsp" flush="false"/>

	<!-- Js Plugins -->
	<script src="<c:url value="/resources/main/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery-ui.min.js"/>"></script>
	<script
		src="<c:url value="/resources/main/js/jquery.countdown.min.js"/>"></script>
	<script
		src="<c:url value="/resources/main/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.dd.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="/resources/main/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="/resources/main/js/main.js"/>"></script>

	<script type="text/javascript" src="./resources/main/js/main.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   	<script src="../resources/js/jquery.serializeObject.js"></script>
	<script type="text/javascript">

		$(".nav-item").click(function() {
			var activeTab = $(this).attr('href');
			console.log(activeTab);
			//var CONoticeFAQFrm = $("#CONoticeFAQFrm").serializeObject();
			//console.log(CONoticeFAQFrm);
			
			$.ajax({
				url: "CONotice",
				type: "get",
				data: CONoticeFAQFrm,
				dataType: "json",
				success: function(data) {				
					var faqListBoard = '';
					for(var i = 0; i < data.faqListBoard.length; i++) {
						console.log(data.faqListBoard[i].FAQpaging);
						console.log(data.faqListBoard);
						faqListBoard += '<div class="table-responsive">'
						+ '<table class="align-middle table table-borderless table-striped table-hover">'
						+ '<thead>'
						+ '<tr>'
						+ '<th class="text-center" style="width: 160px;">' + '등록번호' + '</th>'
						+ '<th class="text-center" style="width: 450px;">' + '제목' + '</th>'
						+ '<th class="text-center">작성자</th>'
						+ '<th class="text-center">작성일</th>'
						+ '<th class="text-center">상세보기</th>'
						+ '</tr>'
						+ '</thead>'
						+ '<tbody id="faqList" name="faqList">'
						+ '<c:forEach var="FAQ" items="${faqListBoard}">'
						+ '<tr>'
						+'<td class="text-center text-muted">'
						+ data.faqListBoard[i].ft_num
						+'</td>'
						+'<td>'
						+'<div class="widget-content p-0" style="text-align: center;">'
						+'<div class="widget-content-wrapper">'
						+'<div class="widget-content-left flex2">'
						+'<div class="widget-heading">'
						+ data.faqListBoard[i].ft_title
						+'</div>'
						+'</div>'
						+'</div>'
						+'</div>'
						+'</td>'
						+'<td class="text-center">'
						+ data.faqListBoard[i].ft_id
						+'</td>'
						+'<td class="text-center">'
						+ data.faqListBoard[i].ft_date
						+'</td>'
						+'<td class="text-center">'
						+'<a href="CONoticeContents?Noticenum=${FAQ.ft_num}" onclick="window.open(this.href, "_blank", "width=800px,height=600px,toolbars=no,scrollbars=yes");return false;">'
						+'<button type="button" id="PopoverCustomT-1" class="btn btn-primary btn-sm" style="background-color:#e74c3c; border-color:#e74c3c;">'
						+'상세보기'+'</button>'
						+'</a>'
						+'</td>'
						+'</tr>'
						+ '</tr>'
						+ '</c:forEach>'								
						+ '</tbody>'
						+ '</table>'
						+ '<p style="text-align:center">' + data.faqListBoard[i].FAQpaging + '</p>'
						+ '</div>'
					}
					$('#faqList').html(faqListBoard);
				},
				error: function(error) {
					alert("로드 실패");
				}
			});
		}) 

		
		/* ---------------------------------------------------------------------------------------
		 * 기   능: FAQ 페이징 시, 탭 고정
		 * 작성일: 2020.02.20
		 * 작성자: JWJ / KYH 
		 -----------------------------------------------------------------------------------------*/	
		$(document).ready(function(){
			var tabCheck = "${check}";
			console.log("현재 보고있는 페이지 : " +tabCheck);
			if(tabCheck === "FAQ보는중"){
				$("#nav-FAQ-tab").get(0).click();
				$(this).addClass("class_name");

				$(this).removeClass("class_name");


			}else {
				$("#nav-tab").get(0).click();
			}
		 });



	</script>
	<script type="text/javascript">
	/* ---------------------------------------------------------------------------------
	 * 기능: 관리자 문의 유효성 검사
	 * 작성자: JSH
	 * 작성일 : 2019.02.19
	  -----------------------------------------------------------------------------------*/
		function adSendMessage(){
			/* var sendingForm = document.sendingForm;
			var mgContents = sendingForm.mgContents.value;
			var mgSender = sendingForm.mgSender.value; */
			
			var mgContents = document.getElementById("message").value;
			var mgSender = document.getElementById("sender").value;
			/* console.log(mgContents);
			console.log(mgSender); */
			console.log("입력한 문장은 : " + mgContents);
			console.log("작성자의 아이디: "+ mgSender);
			
		
			if(mgSender == '' || mgSender == null){
				alert("로그인 후, 메세지를 전송해주세요.")
				} else if(mgContents == '' || mgContents == null){
					alert("메세지 내용을 입력해주세요.")
				} else{
					sendingForm.submit();
					alert("관리자에게 메세지를 전송하였습니다.")
					window.close();
				} 
			
			}
			
		</script>
</body>


</html>

