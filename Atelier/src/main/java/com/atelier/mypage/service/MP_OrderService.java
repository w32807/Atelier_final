package com.atelier.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dao.PO_Dao;
import com.atelier.dto.PO_Dto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MP_OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	ModelAndView mav;
	
	@Setter(onMethod_=@Autowired)
	PO_Dao poDao;

	
	/* 기능: 주문내역 조회메소드 */
	public ModelAndView getMyOrder(String po_cm_id) {
		mav = new ModelAndView();
		List<PO_Dto> poList = poDao.getMyOrder(po_cm_id);

		mav.addObject("poList" , poList);	
		mav.setViewName("myOrder");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 주문내역 조회메소드 / 페이징 메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	private Object getPaging(int num) {
		//전체 글 개수 구하기(from DB)
		int maxNum = poDao.getBoardCount();
		int listCount = 10;//페이지 당 글 개수
		int pageCount = 2;	//그룹 당 페이지 개수
		String listName = "messager";
		com.atelier.util.Paging paging = new com.atelier.util.Paging(maxNum, num, 
				listCount, pageCount, listName);
		String pagingHtml = 
				paging.makeHtmlPaging();
		return pagingHtml;
	}

	// 주문내역 조회메소드 기능 ajax
	public Map<String, List<PO_Dto>> getOrder(PO_Dto poDto) {
		 log.warn("bb");
		Map<String, List<PO_Dto>> poMap = null;
		
		try {
			List<PO_Dto> poList = poDao.getOrderList(poDto);
			poMap = new HashMap<String, List<PO_Dto>>();
			poMap.put("poList", poList);
			
		}catch(Exception e) {
			e.printStackTrace();
			poMap = null;
		}
		
		return poMap;
	}

	 /* ---------------------------------------------------------------------------------------
		 * 기능: 주문내역 취소 메소드 
		 * 작성자: KBH
		 * 작성일: 2020.02.07
		 -----------------------------------------------------------------------------------------*/
		public ModelAndView orderCancle(String[] prod) {
			mav = new ModelAndView();
			
			try {
				for(int i=0; i<prod.length; i++ ) {
					poDao.orderCancle(prod[i]);
				}
				mav.setViewName("myOrder");
			}catch(Exception e) {
				e.printStackTrace();
				log.warn("error");
			}
			return mav;
		}
}//MP_OrderService Class end
