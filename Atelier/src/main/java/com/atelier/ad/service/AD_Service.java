package com.atelier.ad.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.dao.AD_Dao;
import com.atelier.dao.AM_Dao;
import com.atelier.dao.AT_Dao;
import com.atelier.dao.CM_Dao;
import com.atelier.dao.MG_Dao;
import com.atelier.dao.NT_Dao;
import com.atelier.dao.PD_Dao;
import com.atelier.dto.AD_MaterialDto;
import com.atelier.dto.AG_Dto;
import com.atelier.dto.AM_Dto;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.CO_NoticeDto;
import com.atelier.dto.FT_FAQDto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.util.AD_MaterialPaging;
import com.atelier.util.FAQPaging;
import com.atelier.util.NT_Paging;
import com.atelier.util.PD_Paging;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class AD_Service {

	ModelAndView mav;
	@Setter(onMethod_ = @Autowired)
	AD_Dao aDao;
	
	@Setter(onMethod_ = @Autowired)
	NT_Dao ntDao;
	
	@Setter(onMethod_ = @Autowired) 
	private HttpSession session;
	
	@Setter(onMethod_ = @Autowired)
	AT_Dao atDao;
	
	@Setter(onMethod_ = @Autowired)
	CM_Dao cmDao;
	
	@Setter(onMethod_ = @Autowired)
	AM_Dao amDao;
	
	@Setter(onMethod_ = @Autowired)
	PD_Dao pdDao;
	
	@Setter(onMethod_ = @Autowired)
	MG_Dao mDao;
	
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 전체 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.01
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getADNoticeList(Integer pageNum, Integer maxNum) {
		log.info("getADNoticeList() - pageNum" + pageNum);
		mav = new ModelAndView();
		
		int num = (pageNum == null) ? 1: pageNum;
		maxNum = ntDao.getADNoticeCount();
		Map<String, Integer> pageInt = new HashMap<String, Integer>();
		pageInt.put("pageNum", num);
		pageInt.put("maxNum", maxNum);
		List<CO_NoticeDto> ntlist = ntDao.getADNoticeList(pageInt);
		
		mav.addObject("ntlist", ntlist);
		mav.addObject("paging", getNoticePaging(num));
		session.setAttribute("pageNum", num);
		
		mav.setViewName("ADNoticeList");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 Paging 처리
	  * 작성자: KYH
	  * 작성일 : 2019.02.03
	  -----------------------------------------------------------------------------------*/
	private Object getNoticePaging(int num) {
		//전체 글 개수 구하기(from DB)
		int maxNum = ntDao.getADNoticeCount();
		int listCount = 10;	//페이지 당 글 개수
		int pageCount = 5;	//그룹 당 페이지 개수
		String listName = "ADNoticeList";
		NT_Paging paging = new NT_Paging(maxNum, num, listCount, pageCount, listName);
		String pagingHtml = paging.makeHtmlPaging();

		return pagingHtml;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 상세내용 보기
	  * 작성자: KYH
	  * 작성일 : 2019.02.04
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getADNoticeDetail(Integer nt_num) {
		mav = new ModelAndView();
		
		CO_NoticeDto ntdto = ntDao.getADNoticeDetail(nt_num);
		
		mav.addObject("ntdto", ntdto);
		mav.setViewName("ADNoticeContents");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 입력 및 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.04
	  -----------------------------------------------------------------------------------*/
	public Map<String, List<CO_NoticeDto>> ADNoticeInsert(CO_NoticeDto ntdto, Integer pageNum, Integer maxNum) {
		Map<String, List<CO_NoticeDto>> ntMap = null;
		
		try {
			
			//임시 아이디로 문자열 지정
			ntdto.setNt_id("admin");
			ntDao.ADNoticeInsert(ntdto);
			maxNum = ntDao.getADNoticeCount();
			Map<String, Integer> pageInt = new HashMap<String, Integer>();
			pageInt.put("pageNum", pageNum);
			pageInt.put("maxNum", maxNum);
			List<CO_NoticeDto> ntlist = ntDao.getADNoticeList(pageInt);
			ntMap = new HashMap<String, List<CO_NoticeDto>>();
			ntMap.put("ntlist", ntlist);

		} catch (Exception e) {
			e.printStackTrace();
			ntMap = null;
		}
		
		return ntMap;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 수정
	  * 작성자: KYH
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	public String goADNoticeUpdate(CO_NoticeDto ntdto) {
		String view = null;
		ntdto.setNt_id("admin");
		if(ntDao.ADNoticeUpdate(ntdto)) {
			view = "redirect:ADNoticeList";
		}
		return view;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 삭제
	  * 작성자: KYH
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	public ModelAndView ADNoticeDelete(CO_NoticeDto ntdto, String[] checkedBoxArr, RedirectAttributes rttr) {
		Integer maxNum = null;
		Integer pageNum = null;
		for(String nt_num : checkedBoxArr) {
			ntDao.ADNoticeDelete(nt_num);
		}
		
		mav = new ModelAndView();
		mav.setViewName("redirect:ADNoticeList");
		rttr.addFlashAttribute("check", "공지사항 삭제 완료!");
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 전체 출력
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getFAQList(Integer pageNum,Integer maxNum) {
		mav = new ModelAndView();
		int num = (pageNum == null)? 1 : pageNum;
		maxNum = aDao.getFAQCount();
		Map<String, Integer> pageInt = new HashMap<String, Integer>();
		pageInt.put("pageNum", num);
		pageInt.put("maxNum", maxNum);
		List<FT_FAQDto> faqList = aDao.getFAQList(pageInt);
		
		//날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<faqList.size();i++) {
			String convertDate = dataFm.format(faqList.get(i).getFt_regdate());
			faqList.get(i).setFt_date(convertDate);
		}
		
		mav.addObject("faqList",faqList);
		mav.addObject("paging",getPaging(num));
		session.setAttribute("pageNum", num);
		mav.setViewName("ADFAQ");
		return mav;
	}

	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ paging 처리
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	private Object getPaging(int num) {
		int maxNum = aDao.getFAQCount();
		int listCount = 10;
		int pageCount = 5;
		String listName = "ADFAQ";
		FAQPaging paging = new FAQPaging(maxNum, num, listCount, pageCount, listName);
		String PagingHtml = paging.makeHtmlPaging();
		
		return PagingHtml;
	}
	   
 	 /* ---------------------------------------------------------------------------------
 	  * 기능: FAQ입력 및 출력(ajax)
 	  * 작성자: JWJ
 	  * 작성일 : 2019.02.02
 	  -----------------------------------------------------------------------------------*/
	public Map<String, List<FT_FAQDto>> FAQInsert(FT_FAQDto faq,Integer pageNum,Integer maxNum) {
		Map<String, List<FT_FAQDto>> faqmap = null;
		
		try {
			aDao.FAQInsert(faq);
			maxNum = aDao.getFAQCount();
			Map<String, Integer> pageInt = new HashMap<String, Integer>();
			pageInt.put("pageNum", pageNum);
			pageInt.put("maxNum", maxNum);
			List<FT_FAQDto> faqList = aDao.getFAQList(pageInt);
			//DB에서 가져온 날짜 값을 yyyy-MM-dd 로 변환
			SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd"); 
			String convertDate = dataFm.format(faqList.get(1).getFt_regdate());
			Date parsedate = dataFm.parse(convertDate); 
			Timestamp convertedDate = new Timestamp(parsedate.getTime()); 
			faqList.get(1).setFt_regdate(convertedDate);
			
			faqmap = new HashMap<String, List<FT_FAQDto>>();
			faqmap.put("faqList", faqList);
			
		} catch (Exception e) {
			e.printStackTrace();
			faqmap = null;
		}
		return faqmap;
	}

	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 상세내용 출력
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getFAQDetail(FT_FAQDto faq) {
		mav = new ModelAndView();
		faq = aDao.getFAQDetail(faq.getFt_num());
		mav.addObject("faq",faq);
		mav.setViewName("ADFAQContents");
		
		return mav;
	}

	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 수정
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	public String FAQupdate(FT_FAQDto faq, RedirectAttributes rttr) {
		String view = null;
		if(aDao.FAQupdate(faq)) {
			view = "redirect:ADFAQ";
			rttr.addFlashAttribute("check", "수정 성공");
		}
		return view;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: FAQ 삭제
	  * 작성자: JWJ
	  * 작성일 : 2019.02.03
	  -----------------------------------------------------------------------------------*/
	@Transactional
	public ModelAndView delFAQ(String[] chkedBoxArr, RedirectAttributes rttr) {
		Integer maxNum = null;
		Integer pageNum = null;
		for(String ft_num : chkedBoxArr) {
			aDao.delFAQ(ft_num);
		}
		rttr.addFlashAttribute("check","삭제 완료!");
		
		mav = getFAQList(pageNum,maxNum);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 등록 서비스
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public ModelAndView MaterialInsert(AD_MaterialDto material, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		log.warn("원자재 등록 서비스 시작");

		try {
				aDao.materialInsert(material);
				view= "redirect:ADCompany";
				rttr.addFlashAttribute("check", "원자재가 등록되었습니다.");
			} catch (Exception e) {
				view = "redirect:ADCompanyInsert";
				rttr.addFlashAttribute("check", "fail");
			}
		mav.setViewName(view);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 리스트 출력
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  * 수정일 : 2019.02.19(리스트 삭제시에도 10개의 리스트씩 나오도록 설정)
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getADCompanyList(Integer adcPageNum,Integer maxNum) {
		log.warn("원자재 리스트 서비스 시작");
		
		mav = new ModelAndView();
		
		int num = (adcPageNum == null)? 1 : adcPageNum;
		maxNum = aDao.getRMCount();
		
		Map<String, Integer> pageInt = new HashMap<String, Integer>();
		pageInt.put("adcPageNum", num);
		pageInt.put("maxNum", maxNum);
		List<AD_MaterialDto> adcList = aDao.getADCompanyList(pageInt);
		mav.addObject("adcList", adcList);
		mav.addObject("ADCPaging", getADCPaging(num));
		
		mav.setViewName("ADCompany");
		session.setAttribute("adcPageNum", num);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 리스트 출력 / 페이징 처리
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	private Object getADCPaging(int num) {
		int maxNum = aDao.getADCompanyCount();
		int listCount = 10;
		int pageCount = 2;
		
		String listName = "ADCompany";
		AD_MaterialPaging AD_MaterialPaging = new AD_MaterialPaging(maxNum, num, listCount, pageCount, listName);
		String pagingHtml = AD_MaterialPaging.makeHtmlPaging();
		
		return pagingHtml;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 신청서의 항목을 DB에서 불러와 ADATMemeberUp.jsp에 출력
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getApplicant() {
		mav = new ModelAndView();
		List<AG_Dto> AGList = atDao.getATRegistUserData();
		
		mav.addObject("AGList", AGList);
		mav.setViewName("ADATMemberUp");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 신청서 항목에서 수락, 거절 버튼 클릭에 따른 분기 처리 
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public ModelAndView ATMemberCheckProc(String check, String id) {
		// TODO Auto-generated method stub
		//String s = null;
		mav = new ModelAndView();
		
		// 수락 버튼을 누르면
		if(check.equals("true")) {
			assentATMember(id);
		}
		// 거절 버튼을 누르면
		else {
			DeleteATMember(id);
		}
		System.out.println("fuck");
		mav = getApplicant();
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 수락하여 신청자의 정보를 공방회원 테이블(AM)에 저장 후 신청서 테이블(AG)에서 항목 삭제
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public void assentATMember(String id) {
		CM_Dto cm_Member = cmDao.getMemberInfo(id);
		AG_Dto ag_Member = atDao.getATRegistMember(id);
		AM_Dto am_Member = new AM_Dto();
		AT_Dto at_dto = new AT_Dto();
		
		cm_Member.setCm_state("공방회원");
		
		cmDao.userStateChange(cm_Member);
		
		// AM 테이블에 데이터 삽입
		am_Member.setAm_id(ag_Member.getAg_id());
		am_Member.setAm_name(ag_Member.getAg_at_name());
		am_Member.setAm_phone(ag_Member.getAg_phone());
		am_Member.setAm_addr(cm_Member.getCm_addr());
		am_Member.setAm_sns(ag_Member.getAg_snsaddr());
		am_Member.setAm_cate1(ag_Member.getAg_cate1());
		am_Member.setAm_cate2(ag_Member.getAg_cate2());
		am_Member.setAm_cate3(ag_Member.getAg_cate3());
		
		amDao.insertNewATMember(am_Member);
		
		// AT 테이블에 데이터 삽입
		at_dto.setAt_id(ag_Member.getAg_id());
		at_dto.setAt_name(ag_Member.getAg_at_name());
		at_dto.setAt_phone(ag_Member.getAg_phone());
		at_dto.setAt_addr(cm_Member.getCm_addr());
		at_dto.setAt_snsaddr(ag_Member.getAg_snsaddr());
		at_dto.setAt_cate1(ag_Member.getAg_cate1());
		at_dto.setAt_cate2(ag_Member.getAg_cate2());
		at_dto.setAt_cate3(ag_Member.getAg_cate3());
		at_dto.setAt_logo("default.png");
		atDao.insertATData(at_dto);
		DeleteATMember(id);
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방신청서(AG) DB에서 항목을 삭제
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	public void DeleteATMember(String id) {
		atDao.deleteAGRequest(id);
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 수정 / 기존 데이터 출력
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getADCompanyFix(Integer RM_NUM) {
		mav = new ModelAndView();
		AD_MaterialDto admDto = aDao.getADMaterial(RM_NUM);
		
		mav.addObject("admDto", admDto);
		mav.setViewName("ADCompanyFix");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 수정 / 업데이트
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	public ModelAndView MaterialFix(AD_MaterialDto material, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		
		log.warn("원자재 등록 서비스 시작");

		try {
				aDao.materialFix(material);
				view= "redirect:ADCompany";
				rttr.addFlashAttribute("check", "원자재가 등록되었습니다.");
			} catch (Exception e) {
				view = "redirect:ADCompanyInsert";
				rttr.addFlashAttribute("check", "fail");
			}
		mav.setViewName(view);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 삭제
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	public ModelAndView MaterialDel(Integer RM_NUM) {
		mav = new ModelAndView();
		log.warn("원자재 삭제 서비스 시작");
		aDao.delADMaterial(RM_NUM);
		mav.setViewName("redirect:ADCompany");

		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 리스트 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
		  -----------------------------------------------------------------------------------*/
	public ModelAndView goADMessage(String mg_receiver) {
		mav = new ModelAndView();
		String view = null;

		List<MG_Dto> bList = aDao.getADMessageList(mg_receiver);
		mav.addObject("bList", bList);
		mav.setViewName("ADMessage");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 상세보기 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
	-----------------------------------------------------------------------------------*/
		public ModelAndView ADMessagecon(Integer mg_num) {
		
		mav = new ModelAndView();
		String view = null;
		
		try {
			MG_Dto mgDto = aDao.getADMessageContents(mg_num);
			mav.addObject("mgDto", mgDto);
			mDao.ChangeCheck(mgDto.getMg_num());
			mav.setViewName("ADMessageContents");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

		/* ---------------------------------------------------------------------------------
		 * 기능: 메세지 상세보기에서 답장 
		 * 작성자: KBH
		 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
		-----------------------------------------------------------------------------------*/
		public ModelAndView MessageSendBtn(MG_Dto mDto) {
		 
		  mav = new ModelAndView();
		  String view = null;
		  String mg_receiver = mDto.getMg_sender();
		  log.warn(mDto.getMg_receiver()+","+mDto.getMg_sender());
		  
		  try {
			  aDao.ADSendMessage(mDto);
			  view =  "forward:ADMessage";
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		  
		  mav.setViewName(view);
		  
		  return mav; 
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 삭제
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
	-----------------------------------------------------------------------------------*/
	@Transactional
	public ModelAndView delMessage(String[] check, RedirectAttributes rttr) {
		mav = new ModelAndView();
		
		for(String hs : check) {
			aDao.delMessage(hs);
		}
		rttr.addFlashAttribute("check","삭제 완료!");
		mav.setViewName("redirect:ADMessage");
		
		return mav;
	}
	

	/* ---------------------------------------------------------------------------------
	 * 기능: 상품 리스트 전체 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.12 / 수정(KBH) 2020.02.13
	  -----------------------------------------------------------------------------------*/
	public ModelAndView getADProdList() {
		mav = new ModelAndView();
		List<PD_productDto> pd = aDao.getADProdList();
		mav.addObject("pd", pd);
		mav.setViewName("ADProdManage");
		
		return mav;
	}
	
	/*-----------------------------------------------------------------------------
	 *  	기능: 상품삭제 Paging 처리 
	 *  	작성자: KBH 
	 *  	작성일 : 2020.02.12
	 * ----------------------------------------------------------------------------- */
	private Object getADProdPaging(int num) {
		// 전체 글 개수 구하기(from DB)
		int maxNum = pdDao.getATProdListCount();
		int listCount = 10; // 페이지 당 글 개수
		int pageCount = 5; // 그룹 당 페이지 개수
		String listName = "ATProdManage";
		PD_Paging paging = new PD_Paging(maxNum, num, listCount, pageCount, listName);
		String pagingHtml = paging.makeHtmlPaging();

		return pagingHtml;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품내역 삭제 메소드 
	 * 작성자: KBH
	 * 작성일: 2020.02.12 / 수정(KBH) 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView productDelete(String[] check, RedirectAttributes rttr) {
		mav = new ModelAndView();
		
		try {
			for(int i=0; i<check.length; i++ ) {
				aDao.productDelete(check[i]);
			mav.setViewName("redirect:ADProdManage");	
			}
		}catch(Exception e) {
			e.printStackTrace();
			log.warn("error");
		}
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품내역 수정 메소드 중 상품상세정보 출력메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
		 -----------------------------------------------------------------------------------------*/
	public ModelAndView productUpdate1(Integer pd_code) {
		mav = new ModelAndView();
		PD_productDto pdDto = aDao.ProductUpdate1(pd_code);
		mav.addObject("pd",pdDto);
		mav.setViewName("ADProdDetail");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품내역 수정 메소드 중 상품상세정보 수정메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
		 -----------------------------------------------------------------------------------------*/
	public ModelAndView productUpdate2(PD_productDto pdDto) {
		mav = new ModelAndView();
		try {
			aDao.ProductUpdate2(pdDto);
				mav.setViewName("redirect:ADProdManage");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 공방의 전체 리스트를 가져 옴
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	  -----------------------------------------------------------------------------------*/
	public ModelAndView ADATListProc() {
		mav = new ModelAndView();
		List<AT_Dto>at_list = atDao.getATList();
		
		mav.addObject("at_list", at_list);
		mav.setViewName("ADATList");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방의 상태를 활성 / 비활성 으로 변경
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	-----------------------------------------------------------------------------------*/
	public ModelAndView ADATListStateProc(String id, String state, RedirectAttributes rttr, String check) {
		String view = null;
		AT_Dto at_dto = new AT_Dto();

		if(state.equals("active")) {
			at_dto.setAt_id(id);
			at_dto.setAt_state("활성");
			
			atDao.updateATState(at_dto);
			if(check.equals("true")) {
				mav = ADATListProc();
			}
			else {
				String SearchName = (String)session.getAttribute("search");
				mav = ADATListSearchProc(SearchName);
			}
			
			rttr.addFlashAttribute("check","해당 공방이 활성화 되었습니다.");
		}
		else {
			at_dto.setAt_id(id);
			at_dto.setAt_state("비활성");
			
			atDao.updateATState(at_dto);
			
			if(check.equals("true")) {
				mav = ADATListProc();
			}
			else {
				String SearchName = (String)session.getAttribute("search");
				mav = ADATListSearchProc(SearchName);
			}
			rttr.addFlashAttribute("check","해당 공방이 비활성화 되었습니다.");
		}
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 검색된 공방의 리스트를 출력
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	-----------------------------------------------------------------------------------*/
	public ModelAndView ADATListSearchProc(String searchName) {
		AT_Dto at_dto = new AT_Dto();
		session.setAttribute("search", searchName);
		at_dto.setAt_name(searchName);
		List<AT_Dto>at_list = atDao.getATListSearch(at_dto);
		mav.addObject("at_list", at_list);
		mav.setViewName("ADATListSearch"); 
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품 검색 메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
 	-----------------------------------------------------------------------------------------*/
		public ModelAndView SearchProc(String search) {
		mav = new ModelAndView();
		List<PD_productDto> pd = aDao.SearchProc(search);
		
		mav.addObject("pd",pd);
		mav.setViewName("ADProdManage");
		
		return mav;
	}
	
	public ModelAndView AdminMessage(MG_Dto mgDto) {
		mav = new ModelAndView();
		String view = null;
		try {
			aDao.setADMessage();
		}catch(Exception e) {
			
		}
		
		return mav;
	}
}//AD_Service Class end





