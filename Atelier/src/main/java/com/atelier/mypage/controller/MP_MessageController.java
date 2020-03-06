package com.atelier.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dto.CM_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.mypage.service.MP_MessageService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MP_MessageController {

	ModelAndView mav;
	
	@Setter(onMethod_=@Autowired)
	MP_MessageService mServ;
	
	@Setter(onMethod_=@Autowired)
	HttpSession session;
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 받은 쪽지 출력 메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("messager")
	public ModelAndView Messager() {
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String mg_receiver = cmDto.getCm_id();
		mav = mServ.Messager(mg_receiver);
		
		return mav;
		
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 쪽지 답장기능 메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("myMessageWrite")
	public ModelAndView myMessageWrite(Integer mg_num) {
		mav = mServ.myMessageWrite(mg_num);
		
		return mav;
	}
	
	// 메세지 보내기 버튼 
	@GetMapping("messageSendBtn")
	public ModelAndView MessageSendBtn(MG_Dto mDto) {
		mav = mServ.MessageSendBtn(mDto);
		
		return mav;
	}
}//MP_MessageController Class end