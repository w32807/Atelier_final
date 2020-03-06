package com.atelier.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.dao.AM_Dao;
import com.atelier.dao.AT_Dao;
import com.atelier.dao.BT_Dao;
import com.atelier.dao.CM_Dao;
import com.atelier.dao.PR_Dao;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.BT_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.CT_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PR_Dto;
import com.atelier.mypage.service.MP_BasketService;
import com.atelier.vo.PO_Vo;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CM_Service {

	ModelAndView mav;

	@Setter(onMethod_=@Autowired)
	BT_Dao btDao;

	@Setter(onMethod_ = @Autowired)
	AT_Dao atDao;

	@Setter(onMethod_ = @Autowired)
	CM_Dao cm_Dao;

	@Setter(onMethod_ = {@Autowired}) 
	private HttpSession session;

	@Setter(onMethod_ = {@Autowired}) 
	private MP_BasketService mServ;

	@Setter(onMethod_ = @Autowired)
	PR_Dao prDao;

	@Setter(onMethod_ = @Autowired)
	AM_Dao amDao;

	/*----------------------------------------------------------
	 * 기   능 : 로그인 프로세스, 입력된 아이디와 비밀번호를 DB와 대조 후 일치 시 세션에 저장
	 *          로그인 예외처리 추가 필요 
	 * 작성일 : 20.02.03
	 * 수정일 : 20.02.18(공방정보 세션에 저장하기 추가)
	 * 작성자 : JSG
	    ----------------------------------------------------------*/
	public ModelAndView loginProc(CM_Dto customer, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		AT_Dto atDto = new AT_Dto();
		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();


		//DB에서 암호화된 비번 구하기
		String encPwd = cm_Dao.getSecurityPwd(customer.getCm_id());

		if(encPwd != null) {
			if(pwdEncode.matches(customer.getCm_pwd(), encPwd)) {         
				customer = cm_Dao.getMemberInfo(customer.getCm_id());
				atDto = cm_Dao.getAt(customer.getCm_id());
				session.setAttribute("myAt", atDto);
				// 탈퇴회원이 아니라면
				if(!customer.getCm_state().equals("탈퇴회원")) {
					// 사용자 정보를 세션에 저장
					session.setAttribute("mb", customer);
					view = "redirect:main";
				}
				// 탈퇴한 계정이라면 
				else {
					rttr.addFlashAttribute("check","탈퇴한 계정입니다.");
					view = "redirect:main";
				}

			}
			else {
				view = "redirect:/";
				rttr.addFlashAttribute("check","패스워드가 틀립니다.");
			}
		}
		else {
			//아이디가 존재하지 않는다.
			view = "redirect:/";
			rttr.addFlashAttribute("check","해당 아이디가 없습니다.");
		}
		mav.setViewName(view);

		return mav;

	}
	/*----------------------------------------------------------
	 * 기   능 : 로그아웃 프로세스 실행, 사용자 세션 정보 초기화
	 * 작성일 : 20.02.04
	 * 수정일 : -
	 * 작성자 : JSG
	 ----------------------------------------------------------*/
	public void logoutProc(HttpSession logout_session) {
		// TODO Auto-generated method stub
		logout_session.invalidate();
		//mav.setViewName("main");
		//return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원가입 서비스
	 * 수정자 : JSG : 기본 프사 설정
	 * 작성자: JSH
	 * 작성일: 2020.02.04
	    -----------------------------------------------------------------------------------------*/
	public ModelAndView memberInsert(CM_Dto member, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;

		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

		String encPwd = pwdEncoder.encode(member.getCm_pwd());
		member.setCm_pwd(encPwd);
		member.setCm_pfphoto("default.png");
		log.warn("회원가입 서비스 시작");

		try {
			cm_Dao.memberInsert(member);
			view= "redirect:main";
			rttr.addFlashAttribute("check", "회원 가입 성공!");
		} catch (Exception e) {
			view = "redirect:memJoinFrm";
			rttr.addFlashAttribute("check", "fail");
		}
		mav.setViewName(view);
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원가입 / 아이디 유효성 검사
	 * 작성자: JSH
	 * 작성일: 2020.02.04
	 -----------------------------------------------------------------------------------------*/
	public int userIdCheck(String CM_ID) {

		return cm_Dao.checkOverId(CM_ID);
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 이미 공방회원신청을 요청한 회원인지 체크
	 * 작성자: JSG
	 * 작성일: 2020.02.07
	 -----------------------------------------------------------------------------------------*/
	public String registCheck(String id, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;

		int check = cm_Dao.checkRegistOverllap(id);
		check = amDao.checkRegistOverllapByAM(id);
		if(check >= 1) {
			rttr.addFlashAttribute("check", "이미 가입하였습니다.");
			view = "redirect:main";
		}
		else {
			view = "ATRegist";
		}

		return view;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 목록 전체 보기
	 * 작성자: JWJ
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getproduct_AllList() {
		mav = new ModelAndView();
		List<PD_productDto> pdList = cm_Dao.getproduct_AllList();
		//List<String> imgName = new ArrayList<String>();
		for(int i = 0; i < pdList.size(); i++) {
			int pd_code = pdList.get(i).getPd_code();
			String pi_oriName = cm_Dao.getPi_oriName(pd_code);
			pdList.get(i).setImgOriName(pi_oriName);
		}
		mav.addObject("pdList",pdList);
		mav.setViewName("prodList_All");

		return mav;
	}


	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품별 목록 보기
	 * 작성자: JWJ
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getProdList(String pd_cate) {
		mav = new ModelAndView();
		String view = null;
		List<PD_productDto> pdList = cm_Dao.getProdList(pd_cate);
		for(int i = 0; i < pdList.size(); i++) {
			int pd_code = pdList.get(i).getPd_code();
			String pi_oriName = cm_Dao.getPi_oriName(pd_code);
			pdList.get(i).setImgOriName(pi_oriName);
		}
		switch (pd_cate) {
		case "의류":
			view = "prodList_Clo";
			break;
		case "가방":
			view = "prodList_Bag";	
			break;
		case "신발":
			view = "prodList_shoes";
			break;
		case "지갑":
			view = "prodList_Wallet";
			break;
		case "벨트":
			view = "prodList_Belt";
			break;
		case "장갑":
			view = "prodList_Gloves";
			break;
		case "가구":
			view = "prodList_House";
			break;
		case "기타 악세사리":
			view = "prodList_Etc";
			break;
		}

		mav.addObject("pdList",pdList);
		mav.setViewName(view);
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 상세정보 보기 / 상품 리뷰 리스트 출력
	 * 작성자: JWJ / KYH
	 * 작성일: 2020.02.11 / 2020.02.14
	 * 수정일: 2020.02.19(댓글의 프로필 사진 출력 기능 추가)
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getprodDetail(int pd_code) {
		mav = new ModelAndView();

		PD_productDto prodDto = cm_Dao.getprodDetail(pd_code);
		String pi_oriName = cm_Dao.getPi_oriName(pd_code);
		int at_num = cm_Dao.getAt_num(prodDto.getPd_at_name());
		prodDto.setImgOriName(pi_oriName);

		mav.addObject("at_num",at_num);
		mav.addObject("prodDto",prodDto);

		List<PR_Dto> prList = prDao.getProdReviewList(pd_code);

		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<prList.size();i++) {
			//댓글에 프로필 이미지를 출력하기 위한 기능
			String cm_id = prList.get(i).getPr_cm_id();
			CM_Dto cmDto = cm_Dao.getMemberInfo(cm_id);
			String cm_pfphoto = cmDto.getCm_pfphoto();
			if(cm_pfphoto!=null) {
				cm_pfphoto = cm_pfphoto.replace("com", "jpg");
				prList.get(i).setPr_cm_pfphoto(cm_pfphoto);
			}
			String convertDate = dataFm.format(prList.get(i).getPr_date());
			prList.get(i).setPr_dateSimple(convertDate);
		}

		mav.addObject("prList", prList);
		mav.setViewName("prodDetail");

		return mav;
	}


	/* ---------------------------------------------------------------------------------------
	 * 기능: 장바구니 담기
	 * 작성자: JWJ
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public String insertbasket(String bt_count, String bt_pd_code) {
		String insertChk = null;
		BT_Dto btDto = new BT_Dto();
		int btCount = Integer.parseInt(bt_count);
		int btPdCode = Integer.parseInt(bt_pd_code);
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String AT_id = cmDto.getCm_id();
		PD_productDto prodDto = atDao.getModifyProd(btPdCode);
		String bt_at_name = prodDto.getPd_at_name();
		int bt_price = prodDto.getPd_price();

		btDto.setBt_cm_id(AT_id);
		btDto.setBt_at_name(bt_at_name);
		btDto.setBt_price(bt_price);
		btDto.setBt_count(btCount);
		btDto.setBt_pd_code(btPdCode);

		cm_Dao.insertbasket(btDto);

		insertChk = "insertChkSuccess";
		return insertChk;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 장바구니에서 주문 페이지로 이동
	 * 작성자: JWJ
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView prodBuy(HttpServletRequest request) {
		mav = new ModelAndView();
		String[] orderBtNum = request.getParameterValues("orderBtNum");//주문 번호
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		List<PD_productDto> orderedProdList = new ArrayList<PD_productDto>();
		int totalPrice = 0;

		for(int i = 0; i < orderBtNum.length; i++) {
			PD_productDto pdDto = new PD_productDto();
			int orderCount = Integer.parseInt(request.getParameter(orderBtNum[i]));
			int getorderVtNum = Integer.parseInt(orderBtNum[i]);
			int pd_code = cm_Dao.getPd_code(getorderVtNum);
			pdDto = cm_Dao.getprodDetail(pd_code);
			pdDto.setPd_numofstock(orderCount);
			orderedProdList.add(pdDto);
			totalPrice += orderCount * pdDto.getPd_price();
		}

		//모든 가격의 총 합 구하기
		mav.addObject("cmDto",cmDto);
		mav.addObject("orderBtNum",orderBtNum);
		mav.addObject("totalPrice",totalPrice);
		mav.addObject("orderedProdList",orderedProdList);
		mav.setViewName("prodBuy");

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 주문하기 
	 * 작성자: JWJ
	 * 작성일: 2020.02.14
		 -----------------------------------------------------------------------------------------*/
	public ModelAndView orderInsert(HttpServletRequest request) {

		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String[] orderProdList = request.getParameterValues("orderProdList");
		String[] orderProdCount = request.getParameterValues("orderProdCount");
		String[] orderProdPrice = request.getParameterValues("orderProdPrice");
		String[] orderBtNum = request.getParameterValues("orderBtNum");
		String receiverName = request.getParameter("receiverName");
		String receiverPhone = request.getParameter("receiverPhone");
		String orderAddr = request.getParameter("orderAddr");

		mav = new ModelAndView();

		for (int i = 0; i < orderProdList.length; i++) {
			PO_Vo poVo = new PO_Vo();
			PD_productDto prodDto = cm_Dao.getprodDetail(Integer.parseInt(orderProdList[i]));

			poVo.setPo_cm_id(cmDto.getCm_id());
			poVo.setPo_pd_code(Integer.parseInt(orderProdList[i]));
			poVo.setPo_count(Integer.parseInt(orderProdCount[i]));
			poVo.setPo_price(Integer.parseInt(orderProdPrice[i]));
			poVo.setPo_addr(orderAddr);
			poVo.setPo_at_id(prodDto.getPd_at_id());
			poVo.setPo_at_name(prodDto.getPd_name());
			poVo.setReceiverName(receiverName);
			poVo.setReceiverPhone(receiverPhone);

			cm_Dao.orderInsert(poVo);
			btDao.deleteBasket(Integer.parseInt(orderBtNum[i]));

		}
		mav = mServ.getBasketList(cmDto.getCm_id());

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 메인화면 오늘의 공방 출력
	 * 작성자: JSG
	 * 작성일: 2020.02.14
	 * 수정일: 2020.02.17 (JWJ)
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getTodayAT() {
		mav = new ModelAndView();
		List<PD_productDto> pdList = new ArrayList<PD_productDto>();
		List<AT_Dto> at_list = atDao.getATList(); 

		int listsize = at_list.size();

		System.out.println(listsize);
		List<AT_Dto> main_at_recommend_list = new ArrayList<AT_Dto>();

		// 추천공방 3개를 추첨
		for(int i = 0; i < 3; i++) {
			int ran = (int)(Math.random() * listsize + 1);

			main_at_recommend_list.add(atDao.getRecommendAT(ran));

			// 추천공방 중복 방지
			for(int j=0; j<i-1; j++) {
				if(main_at_recommend_list.get(i).getAt_seq() == main_at_recommend_list.get(j).getAt_seq()) {
					main_at_recommend_list.remove(i);
					i--;
					System.out.println("중복이다");
				}
			}
		}

		pdList = getMainProd();
		mav.addObject("pdList",pdList);
		mav.addObject("main_at_recommend_list", main_at_recommend_list);
		mav.setViewName("main");

		return mav;
	}
	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 리뷰 등록
	 * 작성자: KYH
	 * 작성일: 2020.02.14
	 * 
	 -----------------------------------------------------------------------------------------*/
	public Map<String, List<PR_Dto>> prodReviewWrite(PR_Dto prDto) {
		Map<String, List<PR_Dto>> prMap = null;
		try {
			CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
			prDto.setPr_cm_id(cmDto.getCm_id());
			prDto.setPr_cm_nick(cmDto.getCm_nick());
			prDto.setPr_star(prDto.getPr_star());
			prDao.prodReviewWrite(prDto);

			List<PR_Dto> prList = prDao.getProdReviewList(prDto.getPr_pd_code());

			for(int i=0;i<prList.size();i++) {
				//댓글에 프로필 이미지를 출력하기 위한 기능
				String cm_id = prList.get(i).getPr_cm_id();
				cmDto = cm_Dao.getMemberInfo(cm_id);
				String cm_pfphoto = cmDto.getCm_pfphoto();
				if(cm_pfphoto!=null) {
					cm_pfphoto = cm_pfphoto.replace("com", "jpg");
					prList.get(i).setPr_cm_pfphoto(cm_pfphoto);
				}
			}

			prMap = new HashMap<String, List<PR_Dto>>();
			prMap.put("prList", prList);
		} catch (Exception e) {
			e.printStackTrace();
			prMap = null;
		}

		return prMap;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 상품 리뷰 삭제
	 * 작성자: KYH
	 * 작성일: 2020.02.17
	 -----------------------------------------------------------------------------------------*/
	public Map<String, List<PR_Dto>> prodReviewDelete(int prNum, int pd_code) {
		Map<String, List<PR_Dto>> reMap = new HashMap<String, List<PR_Dto>>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String AT_id = cmDto.getCm_id();
		dataMap.put("pr_num", prNum);
		dataMap.put("aT_id", AT_id);

		boolean a = prDao.prodReviewDelete(dataMap);

		if(a) {
			List<PR_Dto> prList = prDao.getProdReviewList(pd_code);

			SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
			for(int i=0;i<prList.size();i++) {
				String cm_id = prList.get(i).getPr_cm_id();
				cmDto = cm_Dao.getMemberInfo(cm_id);
				String cm_pfphoto = cmDto.getCm_pfphoto();
				if(cm_pfphoto!=null) {
					cm_pfphoto = cm_pfphoto.replace("com", "jpg");
					prList.get(i).setPr_cm_pfphoto(cm_pfphoto);
				}
				String convertDate = dataFm.format(prList.get(i).getPr_date());
				prList.get(i).setPr_dateSimple(convertDate);
			}

			reMap.put("prList",prList);

		} else {
			reMap = null;
		}

		return reMap;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 메인화면 상품 출력
	 * 작성자: JWJ
	 * 작성일: 2020.02.17
	 -----------------------------------------------------------------------------------------*/
	public List<PD_productDto> getMainProd(){
		List<PD_productDto> pdList = new ArrayList<PD_productDto>(); 
		List<String> ctList = new ArrayList<String>();

		ctList = atDao.getCateName();

		for (int i = 0; i < ctList.size(); i++) {
			pdList.add(atDao.getProductByCate(ctList.get(i)));
		}
	
		for(int i = 0; i < pdList.size(); i++) {
			if(pdList.get(i) != null) {
				int pd_code = pdList.get(i).getPd_code();
				String pi_oriName = cm_Dao.getPi_oriName(pd_code);
				pdList.get(i).setImgOriName(pi_oriName);
			}
		}

		return pdList;
	}
}//CM_Service
