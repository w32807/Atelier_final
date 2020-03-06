
package com.atelier.co.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.co.service.CO_Service;
import com.atelier.dto.FT_FAQDto;
import com.atelier.dto.MG_Dto;
import com.atelier.main.controller.MainController;
import com.atelier.main.service.CM_Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CO_Controller {

	ModelAndView mav;
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;

	@Setter(onMethod_ = @Autowired)
	CO_Service mServ;
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터의 공지사항, FAQ리스트 처리
	 * 작성자: JSG, KYH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	@GetMapping(value = "CONotice", produces="application/json; charset=utf-8")
	@ResponseBody
	public ModelAndView noticeList(Integer noticePageNum, Integer FAQPageNum) {
		mav = mServ.getNoticeList(noticePageNum, FAQPageNum);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 공지사항 상세정보 처리 / 조회수 증가
	 * 작성자: JSG / KYH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("CONoticeContents")//get방식으로 전송되는 method. 
	public ModelAndView noticeContents(Integer Noticenum) {
		//log.info("boardList()");
		mav = mServ.getNoticeContents(Noticenum);

		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 FAQ 상세정보 처리
	 * 작성자: KYH
	 * 작성일: 2020.02.09
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("COFAQContents")
	public ModelAndView viewFAQContents(FT_FAQDto faq) {
		mav = mServ.viewFAQContents(faq);

		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 메세지 문의
	 * 작성자: KBH
	 * 작성일: 2020.02.11
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("ADsendMessage")
	public ModelAndView ADsendMessage(MG_Dto mgDto){
		mav = mServ.ADSendMessage(mgDto);
		
		return mav;
	}
	
	
}//CO_Controller class end
