package com.atelier.at.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.at.service.AT_Service;
import com.atelier.dto.AG_Dto;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.AT_NT_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PI_productImgDto;
import com.atelier.dto.RO_Dto;
import com.atelier.dto.SM_Dto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class AT_Controller {
	
	ModelAndView mav;

	@Setter(onMethod_ = @Autowired)
	private HttpSession session;

	@Setter(onMethod_ = @Autowired)
	AT_Service mServ;
	
	@Setter(onMethod_ = @Autowired)
	AT_Service atServ;
	
	
	/*-------------------------------------------------------------------
	 * 기   능 : 공방 신청 요청 처리
	 * 작성일 : 20.02.05
	 * 수정일 :
	 * 작업자 : 정성규
	 -------------------------------------------------------------------*/
	@PostMapping("ATRegistProc")
	public String ATRegistProc(AG_Dto agDto, RedirectAttributes rttr) {
		String view = null;
		view = mServ.ATRegistProc(agDto, rttr);
		
		return view;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 상세 페이지 이동 및 데이터 출력
	  * 작성자: JSG
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATDetail")
	public ModelAndView goATDetail(int at_num) {
		mav = mServ.getATDetail(at_num);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 메인 페이지에 공방 리스트 출력
	  * 작성자: JSG
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATMain")
	public ModelAndView goATMain(HttpServletRequest request) {
		String[] checkedBoxArr = request.getParameterValues("category");
		int size = 0;
		if(checkedBoxArr != null) {
			for(int i = 0 ; i < checkedBoxArr.length; i++) {
				System.out.println(checkedBoxArr[i]);
			}
		}
		mav = mServ.printATList(checkedBoxArr);
		
		return mav;
	}
	
	@GetMapping("ATInfoModify")//공방 수정으로 이동하는 메소드
	public String goATInfoModify() {
		return "ATInfoModify";
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공방 정보 업데이트(수정)
	  * 작성자: JSG
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/
	@PostMapping("ATUpdateAtelier")
	public ModelAndView ATUpdateAtelierData(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		mav = atServ.updateATData(multi,rttr);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 제작한 상품 리스트 전체 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATProdManage")
	public ModelAndView getATProdList(Integer pageNum, Integer maxNum) {
		mav = atServ.getATProdList(pageNum, maxNum);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 판매 등록한 상품 리스트 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.06
	  -----------------------------------------------------------------------------------*/
	@PostMapping("ATProdRegistTrueList")
	public ModelAndView getATProdRegistTrueList(Integer pageNum, Integer maxNum) {
		mav = atServ.getATProdRegistTrueList(pageNum, maxNum);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 제품 목록 관리에서 판매 등록 해제 처리
	  * 작성자: KYH
	  * 작성일 : 2019.02.06
	  -----------------------------------------------------------------------------------*/
	@PostMapping("prodRegistCancle")
	public ModelAndView prodRegistCancleProc(PD_productDto pdDto, HttpServletRequest request, RedirectAttributes rttr) {
		String[] checkedBoxArr = request.getParameterValues("prodChk");
		mav = atServ.prodRegistCancleProc(pdDto, checkedBoxArr, rttr);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 거래처 조회 리스트 출력 메소드
	  * 작성자: KYH
	  * 작성일 : 2019.02.09
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATOrderRequest")
	public ModelAndView getATrmList() {
		mav = atServ.getATrmList();
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 거래처 조회에서 원재료 주문 기능
	  * 작성자: KYH
	  * 작성일 : 2019.02.10
	  -----------------------------------------------------------------------------------*/	
	@PostMapping("ATrmOrder")
	public String rmOrderProc(RedirectAttributes rttr, MultipartHttpServletRequest multi) {
		String view = null;
		view = atServ.rmOrderProc(rttr, multi);
		
		return view;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: 제품 관리의 상품 등록하기
	  * 작성자: JWJ
	  * 작성일 : 2019.02.05
	  -----------------------------------------------------------------------------------*/
	@PostMapping("ATProdInsert")
	public String ATProdInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		view = atServ.ATProdInsert(multi,rttr);
		return view;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: 선택한 상품의 판매여부를 판매 (T)로 전환
	  * 작성자: JWJ
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@PostMapping("prodRegist")
	public ModelAndView prodSellRegist(HttpServletRequest request) {
		
		String[] chkedBoxArr = request.getParameterValues("prodChk");
		mav = atServ.changeProdRegist(chkedBoxArr);
		
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: 상품 정보 수정하기 위해 선택한 상품을 불러오는 기능
	  * 작성자: JWJ
	  * 작성일 : 2019.02.06
	  -----------------------------------------------------------------------------------*/
	@PostMapping("Prodmodify")
	public ModelAndView modifyProd(MultipartHttpServletRequest multi) {
		mav = atServ.goModifyProd(multi);
		
		return mav;
	}
	
	 /* ---------------------------------------------------------------------------------
	  * 기능: 상품 정보 수정
	  * 작성자: JWJ
	  * 작성일 : 2019.02.06
	  -----------------------------------------------------------------------------------*/
	@PostMapping("ProdModifyUpdate")
	public String prodModifyUpdate(MultipartHttpServletRequest multi,RedirectAttributes rttr) {
		String view = null;
		view = atServ.updateProd(multi,rttr);
		
		return view;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 선택한 상품을 삭제
	  * 작성자: JWJ
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@PostMapping("prodDelete")//제품 목록 관리에서 여러 상품을 선택하여 삭제를 하기 위한 메소드
	public String prodDelete(HttpServletRequest request,RedirectAttributes rttr) {
		String[] chkedBoxArr = request.getParameterValues("prodChk");//체크박스의 값들이 넘어옴
		String view = atServ.deleteProd(chkedBoxArr,rttr);
		
		return view;
	}

	/* ---------------------------------------------------------------------------------
	  * 기능: 주문 상태 조회 페이지로 이동
	  * 작성자: JWJ
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@GetMapping("ATOrderState")
	public ModelAndView goATOrderState(HttpServletRequest request) {
		String orderState = request.getParameter("orderState");
		mav = atServ.getATOrderList(orderState);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 선택한 주문 내역의 배송상태를 변경
	  * 작성자: JWJ
	  * 작성일 : 2019.02.07
	  -----------------------------------------------------------------------------------*/
	@GetMapping("chgDeliveryState")
	public String chgDeliveryState(HttpServletRequest request,RedirectAttributes rttr) {
		String[] chkedBoxArr = request.getParameterValues("po_num");//체크박스의 값들이 넘어옴(상품의 상품코드를 가져옴)
		String view = atServ.chgDeliveryState(chkedBoxArr,rttr);
		return view;
	}
	
	@GetMapping("ATMessageRQ")
	public String ATMessageRQ() {
		return "ATMessageRQ";
	}
	
	/*-------------------------------------------------------------------
	 * 기능 : 응원의 한마디 출력 / 입력ajax / 삭제 
	 * 책임자 : 김병현, 김종현
	 * 작성일 : 2020.02.06		최종수정일 : 2020.02.06
	 ------------------------------------------------------------------- */
	@GetMapping("ATSupportMg")//응원의 메세지로 이동하는 메소드 public String goATSupportMg() {
	   public ModelAndView getSupportMg() {
		   
		   AT_Dto atDto = (AT_Dto)session.getAttribute("at");
		   
		   String sm_receiver = atDto.getAt_id();
		   
		   log.warn("ATSupportMg()");
		   mav = mServ.getSupportMg(sm_receiver);
		   
		   return mav;
	   }
	
	   //응원의 한마디 ajax
		@PostMapping(value = "/supportMGInsert", produces = "application/json; charset=utf-8")
		@ResponseBody
		public Map<String, List<SM_Dto>> supportMGInsert(SM_Dto reply){
		Map<String, List<SM_Dto>> rmap = mServ.replyInsert(reply);
	
			return rmap;
		}
	
		@GetMapping("chgOrderList")
		public ModelAndView chgOrderList(HttpServletRequest request) {
			String orderState = request.getParameter("orderState");
		    log.warn(orderState);
		    mav = atServ.getATOrderList(orderState);
			return mav;
		}
		
		
		@GetMapping("deleteMessage")
		public ModelAndView deleteMessage(int sm_num,RedirectAttributes rttr) {
			
			mav = atServ.deleteMessage(sm_num,rttr);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
	       * 기   능 : 공지사항 리스트 출력
	       * 작업자 : KJH
	       * 작성일 : 2020.02.11      최종수정일 : 2020.02.11
	      -------------------------------------------------------------------*/
	      @GetMapping("ATNotice")
	      public ModelAndView ATNoticeList(Integer pageNum) {
	         log.info("ATNoticeList()");
	         AT_Dto atDto = (AT_Dto) session.getAttribute("at");
	         String at_nt_id = atDto.getAt_id();
	         mav = atServ.getATNoticeList(at_nt_id);

	         return mav;
	      }
	      /*-------------------------------------------------------------------
	       * 기   능 : 공지사항 내용 출력
	       * 작업자 : KJH
	       * 작성일 : 2020.02.11      최종수정일 : 2020.02.11
	      -------------------------------------------------------------------*/
	      @GetMapping("ATNoticeDetail")
	      public ModelAndView getNoticeContents(Integer at_nt_num) {
	         log.info("getNoticeContents - at_nt_num = " + at_nt_num);
	         mav = atServ.getNoticeContents(at_nt_num);
	         
	         return mav;
	      }
	      
	      
	      /*-------------------------------------------------------------------
	       * 기   능 : 공지사항 작성
	       * 작업자 : KJH
	       * 작성일 : 2020.02.11      최종수정일 : 2020.02.11
	      -------------------------------------------------------------------*/
	      //글 쓰기 관련 작업 2가지.
	      //1. 리스트 화면에서 글쓰기 화면으로 전환하기
	      //DB안가고 화면전환만 하는 방법

	      //공지사항 작성폼으로 이동
	      @GetMapping("ATNoticeWrite")
	      public String ATNoticeWrite() {
	    	  
	         return "ATNoticeWrite";
	      }

	      //2. 글쓰기 화면에서 들어 온 데이터를 처리
	      //공지사항 작성
	      @PostMapping("noticeWrite")
	      public ModelAndView noticeWrite(AT_NT_Dto ntDto,RedirectAttributes rttr) {
	         log.warn("notice");
	         mav = atServ.noticeWrite(ntDto,rttr);
	         
	         return mav;
	      }
	      
	      @GetMapping("delNotice")//글 삭제를 위한 controller 메소드
	      public String delNotice (@RequestParam("at_nt_num")int at_nt_num, RedirectAttributes rttr) {
	         String view = atServ.delNotice(at_nt_num,rttr);
	         
	         return view;
	      }
		
		/*-------------------------------------------------------------------
		 * 기능 : 발주 리스트 조회 컨트롤러 / 발주 조회 리스트 삭제 컨트롤러
		 * 작성자: JSH / KYH
		 * 작성일 : 2020.02.11 / 2020.02.08
		 ------------------------------------------------------------------- */
		@GetMapping("ATOrderSearch")
		public ModelAndView ATOrderSearchList(HttpServletRequest request, RedirectAttributes rttr) {
			log.warn("발주 리스트 조회 컨트롤러 시작");
			
			mav = mServ.getATOrderSearchList(request, rttr);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 공방 관리 홈 리스트 출력 컨트롤러
		 * 작성자: JSH
		 * 작성일 : 2020.02.11
		 ------------------------------------------------------------------- */
		@GetMapping("ATManager")
		public ModelAndView ATManagerList() {
			log.warn("공방 관리 홈 리스트 출력 컨트롤러 시작");
			mav = mServ.getATManagerList();
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 거래처 조회 검색
		 * 작성자: JWJ
		 * 작성일 : 2020.02.14
		 ------------------------------------------------------------------- */
		@GetMapping("prodSearch")
		public ModelAndView prodSearch(String keyword) {
			mav = atServ.prodSearch(keyword);

			return mav;

		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 판매 등록 여부별 상품 출력
		 * 작성자: JWJ
		 * 작성일 : 2020.02.14
		 ------------------------------------------------------------------- */
		@PostMapping("registSelect")
		public ModelAndView getregistSelProd(String registSelect) {
			mav = atServ.getregistSelProd(registSelect);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 공방에 쪽지 보내기 화면 출력 메소드
		 * 작성자: KBH
		 * 작성일 : 2020.02.18
		 ------------------------------------------------------------------- */
		@GetMapping("ATMessageWrite")
		public ModelAndView ATMessage() {
			AT_Dto atDto = (AT_Dto)session.getAttribute("at");
			String receiver = atDto.getAt_id();
			mav = atServ.getATMessage(receiver);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 공방에 쪽지 보내기 메소드
		 * 작성자: KBH
		 * 작성일 : 2020.02.18
		 ------------------------------------------------------------------- */
		@GetMapping("messageFrm")
		public ModelAndView messageFrm(MG_Dto mgDto, RedirectAttributes rttr) {
			CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
			String sender = cmDto.getCm_id();
			mgDto.setMg_sender(sender);
			mav = atServ.setMessage(mgDto,rttr);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 공방 관리자가 메인 관리자에게 쪽지 보내기 메소드
		 * 작성자: JSH
		 * 작성일 : 2020.02.19
		 ------------------------------------------------------------------- */
		@GetMapping("ATMessageRQSend")
		public ModelAndView ATMessageRQSend(MG_Dto mgDto) {
			mav = atServ.setATMessageRQSend(mgDto);
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 제품 등록으로 이동
		 * 작성자: JWJ
		 * 작성일 : 2020.02.20
		 ------------------------------------------------------------------- */
		@GetMapping("ATProdRegist")//제품 목록 관리에서(ATProdManage)에서 제품 메뉴 제작 페이지로 넘어가는 메소드
		public ModelAndView prodMake() {
			mav = atServ.prodMake();
			
			return mav;
		}
		
		/*-------------------------------------------------------------------
		 * 기능 : 공방 홈에서 판매물품 보기
		 * 작성자: JWJ
		 * 작성일 : 2020.02.20
		 ------------------------------------------------------------------- */
		@GetMapping("ATProduct")
		public ModelAndView ATProduct(String at_id) {
			mav = atServ.getATProdList(at_id);
			
			return mav;
		}
		
}//AT_Controller Class end
