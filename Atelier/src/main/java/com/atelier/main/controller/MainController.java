package com.atelier.main.controller;


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
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.dto.CM_Dto;
import com.atelier.dto.PR_Dto;
import com.atelier.main.service.CM_Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class MainController {

	ModelAndView mav;

	@Setter(onMethod_ = @Autowired)
	private HttpSession session;

	@Setter(onMethod_ = @Autowired)
	CM_Service mServ;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/* ---------------------------------------------------------------------------------------
	 * 기능: 공방 메인에 오늘의 추천공방 띄우기
	 * 작성자: JSG
	 * 작성일: 2020.02.14
	 -----------------------------------------------------------------------------------------*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		log.info("1번");
	
		mav = new ModelAndView();
		mav = mServ.getTodayAT();

		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 로그인창 출력 메소드
	 * 작성자: JSG
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("login")
	public String login() {
		
		return "login";
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 아이디 입력 후 로그인 프로세스 처리
	 * 작성자: JSG
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("loginProc")
	public ModelAndView login(CM_Dto cmDto, RedirectAttributes rttr) {
		mav = mServ.loginProc(cmDto, rttr);
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 로그아웃 프로세스
	 * 작성자: JSG
	 * 작성일: 2020.02.04
	-----------------------------------------------------------------------------------------*/
	@GetMapping("logout")
	public ModelAndView logout() {
		mServ.logoutProc(session);
		//mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg","logoutSuccess");
		return mav;
	}

	//회원가입창 출력
	@RequestMapping(value = "/memJoinFrm", method = RequestMethod.GET)
	public String memJoinFrm(Locale locale, Model model) {

		return "memJoinFrm";
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 가입 컨트롤러
	 * 작성자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@PostMapping("memberInsert")
	public ModelAndView memberInsert(CM_Dto member, RedirectAttributes rttr) {
		mav = mServ.memberInsert(member, rttr);
		log.warn("memberInsert()");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 가입 / 아이디 유효성 검사 컨트롤러
	 * 작성자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	@RequestMapping(value = "/memJoinFrm/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("CM_ID") String CM_ID) {
		log.warn(CM_ID);
		
		return mServ.userIdCheck(CM_ID);
	}
	/* ---------------------------------------------------------------------------------------
	 * 기능: 장바구니 담기
	 * 작성자: JWJ
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	 @GetMapping(value = "insertbasket", produces="application/text; charset=utf-8")
	 @ResponseBody
	  public String basket(String bt_count, String bt_pd_code){

		 String insertChk = mServ.insertbasket(bt_count,bt_pd_code);
		 String jsonInsert = "{\"result\":\"" + insertChk + "\"}";
		 
		 return jsonInsert;
	  }

	 @GetMapping("main")
		public ModelAndView main() {
		 mav = new ModelAndView();
		 mav = mServ.getTodayAT();
			log.warn("메인으로 가는 컨트롤러");
			return mav;
		}
	 
	 /* ---------------------------------------------------------------------------------------
		 * 기능: 상품 목록 전체 보기
		 * 작성자: JWJ
		 * 작성일: 2020.02.10
		 -----------------------------------------------------------------------------------------*/
	@RequestMapping(value = "prodList_All", method = RequestMethod.GET)
	public ModelAndView product_All(Locale locale, Model model) {
		mav = mServ.getproduct_AllList();
		
		return mav;
	}
	

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품별 목록 보기
	 * 작성자: JWJ
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	@RequestMapping(value = {"prodList_Clo","prodList_Bag","prodList_shoes","prodList_Wallet","prodList_Belt"
			,"prodList_Gloves","prodList_House","prodList_Etc"}, method = RequestMethod.GET)
	public ModelAndView product_Clo(String pd_cate) {
		mav = mServ.getProdList(pd_cate);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 상세정보 보기 / 상품 리뷰 리스트 출력
	 * 작성자: JWJ / KYH
	 * 작성일: 2020.02.11 / 2020.02.14
	 * 수정일: 2020.02.19(댓글의 프로필 사진 출력 기능 추가)
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("prodDetail")
	public ModelAndView getprodDetail(int pd_code) {
		mav = mServ.getprodDetail(pd_code);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 리뷰 등록
	 * 작성자: KYH
	 * 작성일: 2020.02.14
	 -----------------------------------------------------------------------------------------*/
	@GetMapping(value = "prodReview", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<PR_Dto>> prodReviewWrite(PR_Dto prDto) {
		Map<String, List<PR_Dto>> prMap = mServ.prodReviewWrite(prDto);
		
		return prMap;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 리뷰 삭제
	 * 작성자: KYH
	 * 작성일: 2020.02.17
	 -----------------------------------------------------------------------------------------*/
	@GetMapping(value = "reviewDelete", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<PR_Dto>> prodReviewDelete(int pr_num,int pd_code) {
		Map<String, List<PR_Dto>> reMap = mServ.prodReviewDelete(pr_num,pd_code);
		
		return reMap;
	}
	
	//비밀번호변경
	@GetMapping("myChangePwd")
	public String myChangePwd() {
		
		return "myChangePwd";
	}
	//내정보수정
	@GetMapping("myInfoUpdate")
	public String myInfoUpdate() {
		
		return "myInfoUpdate";
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 공방회원 신청 페이지로 이동
	 * 작성자: JSG
	 * 작성일: 2020.02.07
	 -----------------------------------------------------------------------------------------*/
	@GetMapping("ATRegist")
	public String ATRegist(String id, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		view = mServ.registCheck(id, rttr);
		return view;
	}

	//	관리자에게 문의하기
	@GetMapping("myAdminRQ")
	public String myAdminRQ() {
		return "myAdminRQ";
	}
	/* ---------------------------------------------------------------------------------------
	 * 기능: 장바구니에서 주문 페이지로 이동
	 * 작성자: JWJ
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	 @PostMapping("prodBuy") 
	 public ModelAndView prodBuy(HttpServletRequest request){
		 
		mav = mServ.prodBuy(request);
	  return mav; 
	  }
	 
	 /* ---------------------------------------------------------------------------------------
	  * 기능: 주문하기 
	  * 작성자: JWJ
	  * 작성일: 2020.02.13
		 -----------------------------------------------------------------------------------------*/
	 @PostMapping("orderInsert")
	 public ModelAndView orderInsert(HttpServletRequest request){
		
		 mav = mServ.orderInsert(request);
		 return mav;
	 }
	 
	 /* ---------------------------------------------------------------------------------------
	  * 기능: 500 에러 페이지로 이동 
	  * 작성자: JWJ
	  * 작성일: 2020.02.16
		 -----------------------------------------------------------------------------------------*/
	 @ExceptionHandler(RuntimeException.class)
	 public String expHandler(Model model, Exception e) {
		 e.printStackTrace();
		 model.addAttribute("exception",e);
		 return "error/error500";
	 }
}//MainController Class end













