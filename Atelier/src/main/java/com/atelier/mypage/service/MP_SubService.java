package com.atelier.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.atelier.dao.SB_Dao;
import com.atelier.dto.SB_Dto;
import com.atelier.dto.SBS_Dto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MP_SubService {
	
	
	ModelAndView mav;
	
	@Setter(onMethod_=@Autowired)
	SB_Dao sbDao;
	
	public ModelAndView getSubscription(SB_Dto sbDto) {
		mav = new ModelAndView();

		try {
			sbDao.getSubscription(sbDto);
			log.warn("ok");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	public ModelAndView getSubList(String sc_cm_id) {
		log.warn("sub");
		mav = new ModelAndView();
		
		List<SBS_Dto> sList = sbDao.getSubList(sc_cm_id); 
		System.out.println(sc_cm_id);
		System.out.println(sList.get(0).getAt_seq());
		//System.out.println(sList.get(0));
		mav.addObject("sList",sList); 
		mav.setViewName("mySubscript");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품에서 구독추가 메소드
	 * 작성자: JWJ
	 * 작성일: 2020.02.08
	 -----------------------------------------------------------------------------------------*/
	public String SubFromProd(SB_Dto sbDto) {
		String subMassage = null;
		//구독한지 비교 
		int a = sbDao.compareSub(sbDto);
		if(a == 0) {//a==0 이면 구독 중이 아님
			sbDao.getSubscription(sbDto);
			log.warn("ok");
			subMassage = "구독 하였습니다!";
		}else if(a==1) {//a==1 이면 구독중
			subMassage = "이미 구독 중인 공방입니다.";
		}
			
		return subMassage;
	}
}//MP_SubService Class end
