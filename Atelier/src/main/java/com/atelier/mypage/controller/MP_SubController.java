package com.atelier.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dto.SB_Dto;
import com.atelier.mypage.service.MP_SubService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MP_SubController {
	ModelAndView mav;
	
	@Setter(onMethod_=@Autowired)
	MP_SubService sbServ;
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 구독추가 메소드
	 * 작성자: KJH
	 * 작성일: 2020.02.08
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("Subscription")
	public ModelAndView getSubscription(SB_Dto sbDto){
		log.warn("sub");
		mav = sbServ.getSubscription(sbDto);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 구독리스트 메소드
	 * 작성자: KJH
	 * 작성일: 2020.02.08
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("mySubscript")
	public ModelAndView getSubscribeList(String sc_cm_id) {
		log.warn("sub");
		mav = sbServ.getSubList(sc_cm_id);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품에서 구독추가 메소드
	 * 작성자: JWJ
	 * 작성일: 2020.02.08
	 -----------------------------------------------------------------------------------------*/
	@GetMapping(value = "SubFromProd", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> SubFromProd(SB_Dto sbDto) {
		log.warn("구독 컨트롤러!!!");
		Map<String, String> SubFromProdMap = new HashMap<String, String>();
		String subMassage = sbServ.SubFromProd(sbDto);
		SubFromProdMap.put("subMassage", subMassage);
		
		return SubFromProdMap;
	}
}//MP_SubController Class end




