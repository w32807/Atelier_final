package com.atelier.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.dto.CM_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.mypage.service.MyPageService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyPageController {
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService mpServ;
	
	ModelAndView mav;
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 정보 수정 컨트롤러
	 * 작성자: JSH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("MyPageFix")//form의 action과 같아야 함.
	public ModelAndView myPageFix(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		//RedirectAttributes rttr - 한번 쓰고 말 데이터를 추가해주자.
		log.warn("마이페이지 수정 컨트롤러 진입");
		mav = mpServ.myPageFixServ(multi, rttr);
		//여기에서, jsp에서 들어온 form데이터를 service에 넣어줌(이 때는 위와 다른 브라우저의 요청이 들어오는 것)
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 정보 수정 컨트롤러 / 프로필 사진 등록
	 * 작성자: JSH
	 * 작성일: 2020.02.06
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("profileIMG")
	public void fileDownload(String name, HttpServletRequest req ,HttpServletResponse resp) {
		log.warn("프로필 이미지 출력 컨트롤러");
		mpServ.profileIMG(name, req, resp);
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 정보 개요 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPage")
	public ModelAndView myPage() {
		log.warn("마이페이지 홈 출력 컨트롤러 시작");
		mav = mpServ.getmyPage();
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 판매자에게 문의 / 정보 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPageMessageSend")
	public ModelAndView myPageMessageSend(String po_at_id) {//form에서 넘겨주는 name과 controller의 매개변수 명과 같아야 한다.
		log.info("판매자에게 문의 컨트롤러");
		mav = mpServ.getMyPageMessageSend(po_at_id);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 판매자에게 문의 / 메세지 전송
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("myPageMSendAction")
	public ModelAndView myPageMSendAction(MG_Dto mgDto) {
		log.info("판매자에게 메세지 전송 컨트롤러");
		mav = mpServ.getMyPageMSendAction(mgDto);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 제품 바로가기
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPageGoProd")
	public ModelAndView myPageGoProd(int po_pd_code) {
		log.info("주문 신청한 제품으로 바로가기 컨트롤러");
		mav = mpServ.getMyPageGoProd(po_pd_code);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 주문 취소
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPageOrderCancle")
	public ModelAndView myPageOrderCancle(int po_num) {
		log.warn("주문 취소 컨트롤러 실행");
		mav = mpServ.actMyPageOrderCancle(po_num);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 구독중인 공방 바로가기
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPageGoAtelier")
	public ModelAndView myPageGoAtelier(String sc_at_id) {
		log.warn("공방 바로가기 컨트롤러 실행");
		mav = mpServ.actMyPageGoAtelier(sc_at_id);
		
		return mav;
	}
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 컨트롤러 / 구독 해제
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myPageDelSubs")
	public ModelAndView myPageDelSubs(String sc_at_id) {
		log.warn("구독 해제 컨트롤러 실행");
		mav = mpServ.actMyPageDelSubs(sc_at_id);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 탈퇴 페이지로 이동
	 * 작성자: JSG
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myDropout")
	public String myDropout() {
			
		return "myDropout";
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 탈퇴 기능
	 * 작성자: JSG
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("DropoutProc")
	public ModelAndView DropoutProc(CM_Dto cm_dto, RedirectAttributes rttr) {
		mav = mpServ.myDropoutProc(cm_dto, rttr);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 관리자에게 메세지 보내기
	 * 작성자: JSH
	 * 작성일: 2020.02.20
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("AdminMessageFromMP")
	public ModelAndView AdminMessageFromMP(MG_Dto mgDto) {
		mav = mpServ.SendAdminMessageFromMP(mgDto);
		
		return mav;
	}
}//MyPageController Class end
