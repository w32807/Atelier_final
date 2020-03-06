package com.atelier.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dao.BT_Dao;
import com.atelier.dto.BT_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PO_Dto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MP_BasketService {

	
	ModelAndView mav;

	@Setter(onMethod_=@Autowired)
	BT_Dao btDao;
	
	public ModelAndView getBasketList(String bt_cm_id) {
		mav = new ModelAndView();
		
		List<PO_Dto> bList = btDao.getBasketList(bt_cm_id);
		mav.addObject("bList" , bList);
		mav.setViewName("basket");
		return mav;
	}

	//장바구니 담기하고 팝업띄우기
	public ModelAndView goBasket(BT_Dto btDto) {
		mav = new ModelAndView();
		String view = null;
		try {
			btDao.goBasket(btDto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName(view);
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 장바구니에서 내역 삭제
	 * 작성자: JWJ
	 * 작성일 : 2019.02.13
	 * 수정일 : 2019.02.19(장바구니 삭제를 ajax처리로 하지 않도록 수정)
	  -----------------------------------------------------------------------------------*/
	public ModelAndView deleteBasket(String bt_num, String bt_cm_id) {
		mav = new ModelAndView();
		Map<String, List<PO_Dto>> basketMap = new HashMap<String, List<PO_Dto>>();
		int btNum = Integer.parseInt(bt_num);
		boolean a = btDao.deleteBasket(btNum);
		
		if(a){
			mav = getBasketList(bt_cm_id);
		}
		return mav;
	}
}//MP_BasketService Class end
