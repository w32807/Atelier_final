package com.atelier.co.service;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dao.AD_Dao;
import com.atelier.dao.CO_Dao;
import com.atelier.dto.CO_NoticeDto;
import com.atelier.dto.FT_FAQDto;
import com.atelier.dto.MG_Dto;
import com.atelier.util.CO_FAQPaging;
import com.atelier.util.CO_NoticePaging;

import lombok.Setter;



@Service
public class CO_Service {

	ModelAndView mav;
	@Setter(onMethod_ = @Autowired)
	CO_Dao coDao;
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 공지사항 리스트를 DB에서 불러옴
	 * 작성자: JSG
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getNoticeList(Integer noticePageNum, Integer FAQPageNum) {
		//공지사항 리스트(작성자:JSG)
		mav = new ModelAndView();
		String chk = null;
		if(FAQPageNum == null) {
			chk = "공지사항보는중";
		}else if(noticePageNum == null) {
			chk = "FAQ보는중";
		}
			
		
		int num1 = (noticePageNum == null)? 1 : noticePageNum;
		List<CO_NoticeDto> noticeList = coDao.getNoticeList(num1);		
		mav.addObject("noticeList", noticeList);
		mav.addObject("paging",getPaging(num1));
		//session.setAttribute("pageNum", num1);	
		
		mav.setViewName("CONotice");
		
		//FAQ 리스트(작성자:KYH)
		int num2 = (FAQPageNum == null)? 1 : FAQPageNum;
		List<FT_FAQDto> faqListBoard = coDao.getFAQList(num2);
		//날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<faqListBoard.size();i++) {
			String convertDate = dataFm.format(faqListBoard.get(i).getFt_regdate());
			faqListBoard.get(i).setFt_date(convertDate);
		}
		mav.addObject("faqListBoard", faqListBoard);
		mav.addObject("FAQpaging", getFAQPaging(num2));
		mav.addObject("check",chk);
		session.setAttribute("FAQpaging", num2);
		
		mav.setViewName("CONotice");
		return mav;
	}
	
	private Object getPaging(int noticePageNum) {
		//전체 글 개수 구하기(from DB)
		int maxNum = coDao.getBoardCount();
		int listCount = 10;//페이지 당 글 갯수
		int pageCount = 2; //한 그룹당 페이지 갯수
		String listName = "CONotice";//BoardController의 RequestMapping 과 똑같아야 함.
		CO_NoticePaging paging = new CO_NoticePaging(maxNum, noticePageNum, listCount, pageCount, listName);
		String pagingHtml1 = paging.makeHtmlPaging();
		
		return pagingHtml1;
	}
	
	private Object getFAQPaging(int FAQPageNum) {
		//전체 글 개수 구하기(from DB)
		int maxNum = coDao.getFAQBoardCount();
		int listCount = 10;	//페이지 당 글 개수
		int pageCount = 5;	//그룹 당 페이지 개수
		String listName = "CONotice";
		CO_FAQPaging FAQpaging = new CO_FAQPaging(maxNum, FAQPageNum, listCount, pageCount, listName);
		String pagingHtml2 = FAQpaging.makeHtmlPaging();
	
		return pagingHtml2;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 공지사항 상세정보를 DB에서 불러와 출력
	 * 작성자: JSG
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getNoticeContents(Integer Noticenum) {
		// TODO Auto-generated method stub
		mav = new ModelAndView();
		coDao.noticeCountUpdate(Noticenum);
		CO_NoticeDto noticeContents = coDao.getNoticeContents(Noticenum);
		
		mav.addObject("noticeContents", noticeContents);
		mav.setViewName("CONoticeContents");
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 FAQ 리스트 처리
	 * 작성자: KYH
	 * 작성일: 2020.02.09
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getFAQList(Integer pageNum) {
		mav = new ModelAndView();
		int num = (pageNum == null)? 1 : pageNum;

		List<FT_FAQDto> faqListBoard = coDao.getFAQList(num);
		
		mav.addObject("faqListBoard", faqListBoard);
		mav.addObject("FAQpaging", getFAQPaging(num));
		session.setAttribute("pageNum", num);
		
		mav.setViewName("CONotice");
		
		return mav;
	}

	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 고객센터 FAQ 상세정보를 DB에서 불러와 출력
	 * 작성자: KYH
	 * 작성일: 2020.02.09
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView viewFAQContents(FT_FAQDto faq) {
		mav = new ModelAndView();
		faq = coDao.viewFAQContents(faq.getFt_num());
		mav.addObject("faq",faq);
		mav.setViewName("COFAQContents");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 메세지 문의
	 * 작성자: KBH
	 * 작성일: 2020.02.11
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView ADSendMessage(MG_Dto mgDto) {
		mav = new ModelAndView();
		
		try {
			
			coDao.ADSendMessage(mgDto);
		
			mav.setViewName("redirect:CONotice");
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		
		return mav;
	}
}
