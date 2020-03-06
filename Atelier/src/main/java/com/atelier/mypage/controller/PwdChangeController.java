package com.atelier.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import com.atelier.mypage.service.PwdChangeService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PwdChangeController {

	@Setter(onMethod_=@Autowired)
	private HttpSession session;

	@Setter(onMethod_=@Autowired)
	private PwdChangeService pcServ;

	ModelAndView mav;

	/*---------------------------------------------------------------------------------
	 * 기능 : 비밀번호 변경
	 * 작성인 : 김병현,김종현
	 * 작성날짜 : 2020.02.04     최종수정일 :2020.02.04
	 ----------------------------------------------------------------------------------*/
	@GetMapping("myChangePwdProc")
	public ModelAndView changeProc(String cm_id, String pwd1,String pwd2, String pwd3) {
		log.warn("changeProc");
		mav = pcServ.changeProc(cm_id,pwd1,pwd2,pwd3);
		log.warn("changeProc");
		
		return mav;
	}
}//PwdChangeController Class end
