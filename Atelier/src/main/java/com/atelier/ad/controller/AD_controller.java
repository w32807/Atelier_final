package com.atelier.ad.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.ad.service.AD_Service;
import com.atelier.dto.AD_MaterialDto;
import com.atelier.dto.AG_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.CO_NoticeDto;
import com.atelier.dto.FT_FAQDto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.PD_productDto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AD_controller {
	
	ModelAndView mav;
	
	@Setter(onMethod_ = @Autowired)
	AD_Service aServ;

	@GetMapping("ADNotice")
	public String goADNotice() {
		return "ADNotice";
	}
	
	@Setter(onMethod_ = @Autowired) 
	private HttpSession session;
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 전체 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.01
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADNoticeList")
	public ModelAndView getADNoticeList(Integer pageNum, Integer maxNum) {
		log.warn("공지사항 컨트롤러");
		mav = aServ.getADNoticeList(pageNum, maxNum);
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 상세내용 보기
	  * 작성자: KYH
	  * 작성일 : 2019.02.04
	  -----------------------------------------------------------------------------------*/
	 @GetMapping("ADNoticeContents")
	 public ModelAndView goADNoticeContents(Integer nt_num) {
		 //log.warn("공지사항 상세내용 컨트롤러");
		 mav = aServ.getADNoticeDetail(nt_num);
		 
		 return mav;
	 }
	 
	 /* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 수정
	  * 작성자: KYH
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	 @PostMapping("ADNoticeUpdate")
	 public String goADNoticeUpdate(CO_NoticeDto ntdto) {
		//log.warn("공지사항 수정 컨트롤러");
		 String view = null;
		 view = aServ.goADNoticeUpdate(ntdto);
		 
		 log.warn(ntdto.getNt_title()+ntdto.getNt_contents());
		 
		 return view;
	 }
	 
	 /* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 삭제
	  * 작성자: KYH
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	 @PostMapping("ADNoticeDelete")
	 public ModelAndView ADNoticeDelete(CO_NoticeDto ntdto, HttpServletRequest request, RedirectAttributes rttr) {
		 log.warn("공지사항 삭제 컨트롤러");
		 String[] checkedBoxArr = request.getParameterValues("NoticeChk");
		 mav = aServ.ADNoticeDelete(ntdto, checkedBoxArr, rttr);
		 
		 return mav;
	 }
	 
	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 출력 
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADFAQ")
	public ModelAndView goADFAQ(Integer pageNum , Integer maxNum) {
		mav = aServ.getFAQList(pageNum,maxNum);
		
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 상세보기
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADFAQContents")
	public ModelAndView goADFAQContents(FT_FAQDto faq) {
		mav = aServ.getFAQDetail(faq);
		
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 수정
	  * 작성자: JWJ
	  * 작성일 : 2019.02.02
	  -----------------------------------------------------------------------------------*/
	@PostMapping("FAQupdate")
	public String FAQupdate(FT_FAQDto faq, RedirectAttributes rttr) {
		String view = null;
		view = aServ.FAQupdate(faq, rttr);
		
		return view;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: FAQ 삭제
	  * 작성자: JWJ
	  * 작성일 : 2019.02.03
	  -----------------------------------------------------------------------------------*/
	@PostMapping("delFAQ")
	public ModelAndView delFAQ(HttpServletRequest request, RedirectAttributes rttr) {
		String[] chkedBoxArr = request.getParameterValues("FAQchk");
		mav = aServ.delFAQ(chkedBoxArr,rttr);
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 공방회원신청서 화면으로 이동
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADATMemberUp")
	public ModelAndView goADATMemberUp() {
		mav = aServ.getApplicant();
		
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: 공방회원신청서 결과 처리
	  * 작성자: JSG
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATMemberUpCheck")
	public ModelAndView ATMemberUpCheck(String check, String id) {
		mav = aServ.ATMemberCheckProc(check, id);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 리스트로 이동
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADATList")
	public ModelAndView goADATList() {
		mav = aServ.ADATListProc();
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방의 상태를 변경
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADATListStateProc")
	public ModelAndView ADATListStateProc(String id, String state, RedirectAttributes rttr, String check) {
		mav = aServ.ADATListStateProc(id, state, rttr, check);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방을 검색 후 ADATListSearch 페이지에 출력
	  * 작성자: JSG
	  * 작성일 : 2019.02.13
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADATListSearch")
	public ModelAndView ADATListSearchProc(String searchName) {
		mav = aServ.ADATListSearchProc(searchName);
		
		return mav;
	}
	
	
	@GetMapping("ADCompanyInsert")
	public String goADCompanyInsert() {
		
		return "ADCompanyInsert";
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 등록 컨트롤러
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@PostMapping("MaterialInsert")
	public ModelAndView MaterialInsert(AD_MaterialDto material, RedirectAttributes rttr) {
		mav = aServ.MaterialInsert(material, rttr);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 리스트 출력
	  * 작성자: JSH
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADCompany")
	public ModelAndView ADCompany(Integer adcPageNum,Integer maxNum) {
		log.warn("원자재 리스트 출력 컨트롤러 시작");
		mav = aServ.getADCompanyList(adcPageNum,maxNum);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 수정 / 기존 데이터 입력
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADCompanyFix")
	public ModelAndView ADCompanyFix(Integer RM_NUM) {//form에서 넘겨주는 name과 controller의 매개변수 명과 같아야 한다.
		log.info("원자재 수정 컨트롤러 시작");
		mav = aServ.getADCompanyFix(RM_NUM);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 수정 / 업데이트
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@PostMapping("MaterialFix")
	public ModelAndView MaterialFix(AD_MaterialDto material, RedirectAttributes rttr) {//form에서 넘겨주는 name과 controller의 매개변수 명과 같아야 한다.
		log.info("원자재 수정 컨트롤러 시작");
		mav = aServ.MaterialFix(material, rttr);
		
		return mav;
	}
		
	/* ---------------------------------------------------------------------------------
	  * 기능: 원자재 삭제
	  * 작성자: JSH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADCompanyDel")
	public ModelAndView ADCompanyDel(Integer RM_NUM) {
		log.info("원자재 삭제 컨트롤러 시작");
		mav = aServ.MaterialDel(RM_NUM);
		
		return mav;
	}
	



	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 리스트 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
		  -----------------------------------------------------------------------------------*/

	@GetMapping("ADMessage")
	public ModelAndView goADMessage() {
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String mg_receiver = cmDto.getCm_id();
		mav = aServ.goADMessage(mg_receiver);

		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 상세보기 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
	-----------------------------------------------------------------------------------*/
	@GetMapping("ADMessageContents")
	public ModelAndView ADMessagecon(Integer mg_num) {
		log.info("메세지 상세보기 컨트롤러 시작");
		mav = aServ.ADMessagecon(mg_num);

		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 상세보기에서 답장 
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
	-----------------------------------------------------------------------------------*/
	@GetMapping("ADmessageSendBtn")
	public ModelAndView ADmessageSendBtn(MG_Dto mDto) {
		mav = aServ.MessageSendBtn(mDto);

		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 메세지 삭제
	 * 작성자: KBH
	 * 작성일 : 2020.02.11 / 수정(KBH) 2020.02.13
	-----------------------------------------------------------------------------------*/
	@GetMapping("delMessage")
	public ModelAndView delMessage(HttpServletRequest hs, RedirectAttributes rttr) {
		String[] check = hs.getParameterValues("prod");
		mav = aServ.delMessage(check,rttr);

		return mav;
	}

	/* ---------------------------------------------------------------------------------
	 * 기능: 상품 리스트 전체 출력
	 * 작성자: KBH
	 * 작성일 : 2020.02.12 / 수정(KBH) 2020.02.13
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ADProdManage")
	public ModelAndView getATProdList() {
		log.warn("제작한 상품 리스트 전체 출력 컨트롤러");
		mav = aServ.getADProdList();

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품내역 삭제 메소드 
	 * 작성자: KBH
	 * 작성일: 2020.02.12 / 수정(KBH) 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("productDelete")
	public ModelAndView ProdManager(HttpServletRequest hs, RedirectAttributes rttr) {
		String[] check = hs.getParameterValues("prod");
		log.warn(check[0]);
		mav = aServ.productDelete(check,rttr);

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품내역 수정 메소드 중 상품상세정보 출력메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
		 -----------------------------------------------------------------------------------------*/
	@GetMapping("ADProdDetail")
	public ModelAndView ADupdateManager1(Integer pd_code) {
		mav = aServ.productUpdate1(pd_code);

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품내역 수정 메소드 중 상품상세정보 수정메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
		 -----------------------------------------------------------------------------------------*/
	@GetMapping("ProdUpdate")
	public ModelAndView ADupdateManager2(PD_productDto pdDto) {
		log.warn("fdsa");
		mav = aServ.productUpdate2(pdDto);

		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능:  상품 검색 메소드
	 * 작성자: KBH
	 * 작성일: 2020.02.13
 	-----------------------------------------------------------------------------------------*/
	@GetMapping("searchProduct")
	public ModelAndView SearchProc(String search) {
		mav = aServ.SearchProc(search);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능:  마이페이지 관리자에 문의
	 * 작성자: KBH
	 * 작성일: 2020.02.19
		 -----------------------------------------------------------------------------------------*/
	@PostMapping("AdminMessage")
	public ModelAndView AdminMessage(MG_Dto mgDto) {
		mav = aServ.AdminMessage(mgDto);
		
		return mav;
	}
}//AD_controller Class end












