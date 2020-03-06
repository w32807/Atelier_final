package com.atelier.at.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.dao.AT_Dao;
import com.atelier.dao.NT_Dao;
import com.atelier.dao.PD_Dao;
import com.atelier.dao.PI_Dao;
import com.atelier.dao.RM_Dao;
import com.atelier.dao.RO_Dao;
import com.atelier.dto.AG_Dto;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.AT_NT_Dto;
import com.atelier.dto.AT_ProdDto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.CT_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.NT_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PI_productImgDto;
import com.atelier.dto.PO_Dto;
import com.atelier.dto.RM_Dto;
import com.atelier.dto.RO_Dto;
import com.atelier.dto.SM_Dto;
import com.atelier.util.PD_Paging;
import com.atelier.util.Paging;
import com.atelier.vo.PO_Vo;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AT_Service {

	ModelAndView mav;

	@Setter(onMethod_ = @Autowired)
	AT_Dao atDao;

	@Setter(onMethod_ = @Autowired)
	PD_Dao pdDao;

	@Setter(onMethod_ = @Autowired)
	RO_Dao roDao;

	@Setter(onMethod_ = @Autowired)
	RM_Dao rmDao;

	@Setter(onMethod_ = @Autowired)
	private HttpSession session;

	@Setter(onMethod_ = @Autowired)
	NT_Dao ntDao;

	@Setter(onMethod_ = @Autowired)
	PI_Dao piDao;

	
	/* -----------------------------------------------------------------------------
	 * 		 기능: 제작한 상품 리스트 전체 출력 
	 * 		작성자: KYH 
	 * 		작성일 : 2019.02.05
	 * ----------------------------------------------------------------------------- */
	public ModelAndView getATProdList(Integer pageNum, Integer maxNum) {
		//세션에 있는 아이디로, AT의 AT_STATE를 가져와서, 활성이면 진행, 아니면 못들어감.
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String pd_at_id = cmDto.getCm_id();
		String at_state = atDao.getAt_state(pd_at_id);

		if(at_state.equals("활성")) {

			mav = new ModelAndView();
			List<PI_productImgDto> piList = new ArrayList<PI_productImgDto>();
			
			int num = (pageNum == null) ? 1 : pageNum;
			maxNum = pdDao.getATProdListCount();
			Map<String, Object> pageInt = new HashMap<String, Object>();
			pageInt.put("pageNum", num);
			pageInt.put("maxNum", maxNum);
			pageInt.put("pd_at_id", pd_at_id);
			List<PD_productDto> pd = pdDao.getATProdList(pageInt);
			
			for(int i = 0 ; i < pd.size(); i++ ) {
				PI_productImgDto piDto = new PI_productImgDto();
				piDto = atDao.getProdImg(pd.get(i).getPd_code());
				piList.add(piDto);
				
			}

			mav.addObject("pd", pd);
			mav.addObject("piList",piList);
			mav.addObject("paging", getATProdPaging(num));
			session.setAttribute("pageNum", num);
			mav.setViewName("ATProdManage");
		}else {

			AT_Dto atDto = (AT_Dto) session.getAttribute("myAt");
			mav = getATDetail(atDto.getAt_seq());
			mav.addObject("message","비활성 상태이므로 접근 불가.");
		}

		return mav;
	}

	/*-----------------------------------------------------------------------------
	 * 		기능: 판매 등록한 상품 리스트 출력 
	 * 		작성자: KYH 
	 * 		작성일 : 2019.02.06
	 * ----------------------------------------------------------------------------- */
	public ModelAndView getATProdRegistTrueList(Integer pageNum, Integer maxNum) {
		mav = new ModelAndView();

		int num = (pageNum == null) ? 1 : pageNum;
		maxNum = pdDao.getATProdListCount();
		Map<String, Integer> pageInt = new HashMap<String, Integer>();
		pageInt.put("pageNum", num);
		pageInt.put("maxNum", maxNum);
		List<PD_productDto> pd = pdDao.getATProdRegistTrueList(pageInt);

		mav.addObject("pd", pd);
		mav.addObject("paging", getATProdPaging(num));
		session.setAttribute("pageNum", num);

		mav.setViewName("ATProdManage");
		return mav;
	}

	/*-----------------------------------------------------------------------------
	 *  	기능: 판매등록 Paging 처리 
	 *  	작성자: KYH 
	 *  	작성일 : 2019.02.05
	 * ----------------------------------------------------------------------------- */
	private Object getATProdPaging(int num) {
		// 전체 글 개수 구하기(from DB)
		int maxNum = pdDao.getATProdListCount();
		int listCount = 9; // 페이지 당 글 개수
		int pageCount = 5; // 그룹 당 페이지 개수
		String listName = "ATProdManage";
		PD_Paging paging = new PD_Paging(maxNum, num, listCount, pageCount, listName);
		String pagingHtml = paging.makeHtmlPaging();

		return pagingHtml;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 제품 목록 관리에서 판매 등록 해제 기능
	 * 작성자: KYH 
	 * 작성일: 2020.02.06
	 ----------------------------------------------------------------------------------------- */
	public ModelAndView prodRegistCancleProc(PD_productDto pdDto, String[] checkedBoxArr, RedirectAttributes rttr) {

		for (String pd_code : checkedBoxArr) {
			pdDao.prodRegistCancle(pd_code);
		}

		mav = new ModelAndView();
		mav.setViewName("redirect:ATProdManage");
		rttr.addFlashAttribute("ATProdcheck", "판매등록 해제 완료!");

		return mav;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 거래처 조회 리스트 출력 메소드
	 * 작성자: KYH 
	 * 작성일: 2020.02.09
	 ----------------------------------------------------------------------------------------- */
	public ModelAndView getATrmList() {
		mav = new ModelAndView();

		List<RM_Dto> rmList = rmDao.getRMList();

		mav.addObject("rmList", rmList);
		mav.setViewName("ATOrderRequest");

		return mav;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 거래처 조회에서 원재료 주문 기능
	 * 작성자: KYH 
	 * 작성일: 2020.02.10
	 ----------------------------------------------------------------------------------------- */
	public String rmOrderProc(RedirectAttributes rttr, MultipartHttpServletRequest multi) {
		String view = null;

		RM_Dto rmDto = new RM_Dto();
		RO_Dto roDto = new RO_Dto();
		String[] rmCheckedBoxArr = multi.getParameterValues("rmProdOrderChk");
		for (String rm_num : rmCheckedBoxArr) {
			int numOfProd = Integer.parseInt(multi.getParameter(rm_num));// 넘어온 수량은 String이지만 계산을 위해 int로 변환

			log.warn("수량 : " + numOfProd);

			rmDto = rmDao.getRMPaymentList(rm_num); // 원재료 코드(rm_num), 원재료명(rm_type), 단가(rm_price)
			roDto.setRo_type(rmDto.getRm_type());
			roDto.setRo_rm_price(rmDto.getRm_price());
			roDto.setRo_rm_num(rmDto.getRm_num());
			roDto.setRo_count(numOfProd);

			CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
			roDto.setRo_buyer(cmDto.getCm_id());

			// dao 에서 roDto를 넣는 메소드 작성
			roDao.rmPaymentProd(roDto);
		}

		view = "redirect:ATOrderRequest";
		rttr.addFlashAttribute("payment", "결제가 완료되었습니다.");

		return view;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 공방 신청 요청 서비스. AtRegist.jsp 입력폼에서 받은 데이터를 DB에 저장
	 * 작성자: 정성규
	 * 작성일: 2020.02.05
	 ----------------------------------------------------------------------------------------- */
	public String ATRegistProc(AG_Dto ag_Dto, RedirectAttributes rttr) {
		String view = null;
		atDao.setATRegistUserData(ag_Dto);
		
		view = "redirect:main";
		rttr.addFlashAttribute("ATRegistCheck", 1);
		 return view;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 제품 관리의 상품 등록하기
	 * 작성자: JWJ 
	 * 작성일: 2020.02.05
	 ----------------------------------------------------------------------------------------- */
	@Transactional
	public String ATProdInsert(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		String view = null;
		PD_productDto prodDto = new PD_productDto();
		PI_productImgDto prodImgDto = new PI_productImgDto();
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");

		String pd_at_id = cmDto.getCm_id();
		String pd_name = multi.getParameter("pd_name");
		String pd_at_name = multi.getParameter("pd_at_name");
		int pd_numofstock = Integer.parseInt(multi.getParameter("pd_numofstock"));
		int pd_price = Integer.parseInt(multi.getParameter("pd_price"));
		String pd_option = multi.getParameter("pd_option");
		String pd_sex = multi.getParameter("pd_sex");
		String pd_type = multi.getParameter("pd_type");
		String pd_cate = multi.getParameter("pd_cate");
		String pd_datail = multi.getParameter("pd_detail");
		String pi_oriname = multi.getParameter("pi_oriname");

		prodDto.setPd_at_id(pd_at_id);
		prodDto.setPd_at_name(pd_at_name);
		prodDto.setPd_cate(pd_cate);
		prodDto.setPd_detail(pd_datail);
		prodDto.setPd_name(pd_name);
		prodDto.setPd_numofstock(pd_numofstock);
		prodDto.setPd_option(pd_option);
		prodDto.setPd_price(pd_price);
		prodDto.setPd_sex(pd_sex);
		prodDto.setPd_type(pd_type);
		prodImgDto.setPi_oriname(pi_oriname);

		// 1. 상품을 DB에 Insert
		boolean b = atDao.ATProdInsert(prodDto);

		// 2. Insert한 상품의 상품코드를 가져와 이미지 업로드
		int currentPd_code = atDao.getPd_code();
		prodImgDto = prodImgup(multi, currentPd_code);
		if (b) {
			// 상품 insert 성공하면 해당 상품의 image도 DB에 insert
			atDao.ATProdImgInsert(prodImgDto);
			view = "redirect:ATProdManage";
			rttr.addFlashAttribute("ATProdcheck", "판매 등록 완료");

		} else {
			// 상품 insert 실패
			view = "redirect:ATProdRegist";
			rttr.addFlashAttribute("ATProdcheck", "판매 등록 실패");

		}
		return view;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 제품 관리의 상품 등록 시 이미지를 등록하기 위한 기능
	 * 작성자: JWJ 
	 * 작성일: 2020.02.05
	 ----------------------------------------------------------------------------------------- */
	public PI_productImgDto prodImgup(MultipartHttpServletRequest multi, int currentPd_code) {
		String path = getRealPath(multi);
		PI_productImgDto prodImgDto = new PI_productImgDto();
		MultipartFile imgFile = multi.getFile("pi_oriname");
		String oriName = imgFile.getOriginalFilename();

		String sysName = System.currentTimeMillis() + "." + oriName.substring(oriName.lastIndexOf(".") + 1);
		try {
			imgFile.transferTo(new File(path + sysName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		prodImgDto.setPi_oriname(oriName);
		prodImgDto.setPi_sysname(sysName);
		prodImgDto.setPi_pd_code(currentPd_code);

		return prodImgDto;

	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 이미지를 저장할 폴더 및 경로 생성
	 * 작성자: JWJ 
	 * 작성일: 2020.02.06
	 ----------------------------------------------------------------------------------------- */
	public String getRealPath(MultipartHttpServletRequest multi) {
		String path = multi.getSession().getServletContext().getRealPath("/");
		path += "resources/prodImg/";
		log.info(path);
		File dir = new File(path);
		if (dir.isDirectory() == false) {
			dir.mkdir();
			log.warn("이미지를 저장할 폴더 생성!!");
			log.warn(dir.getAbsolutePath());
		}
		return path;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 상품 정보 수정하기 위해 해당 상품의 정보를 가져옴
	 * 작성자: JWJ 
	 * 작성일: 2020.02.06
	 ----------------------------------------------------------------------------------------- */
	public ModelAndView goModifyProd(MultipartHttpServletRequest multi) {
		mav = new ModelAndView();
		List<CT_Dto> ctList = atDao.getctList();
		List<RM_Dto> rmList = atDao.getRmList();
		String modifyProd = multi.getParameter("prodChk");// 1개의 선택된 체크박스를 가져옴- 상품코드가 1개 넘어옴
		int pd_code = Integer.parseInt(modifyProd);
		PD_productDto modifyProdDto = atDao.getModifyProd(pd_code);// 상품을 가져옴
		String path = getRealPath(multi);
		log.warn("제품의 이미지를 불러올 경로 : " + path);
		PI_productImgDto prodImg = atDao.getProdImg(modifyProdDto.getPd_code());
		String oriName = prodImg.getPi_oriname();
		
		mav.addObject("ctList",ctList);
		mav.addObject("rmList",rmList);
		mav.addObject("oriName", oriName);
		mav.addObject("modifyProdDto", modifyProdDto);
		mav.addObject("check", "수정하기");
		mav.setViewName("ATProdRegist");

		return mav;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 상품 정보 수정
	 * 작성자: JWJ 
	 * 작성일: 2020.02.06
	 ----------------------------------------------------------------------------------------- */
	public String updateProd(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		// String view = atDao.ATProdUpdate(multi,rttr);
		String view = null;
		PD_productDto prodDto = new PD_productDto();
		PI_productImgDto prodImgDto = new PI_productImgDto();

		int pd_code = Integer.parseInt(multi.getParameter("pd_code"));
		String pd_name = multi.getParameter("pd_name");
		String pd_at_name = multi.getParameter("pd_at_name");
		int pd_numofstock = Integer.parseInt(multi.getParameter("pd_numofstock"));
		int pd_price = Integer.parseInt(multi.getParameter("pd_price"));
		String pd_option = multi.getParameter("pd_option");
		String pd_sex = multi.getParameter("pd_sex");
		String pd_type = multi.getParameter("pd_type");
		String pd_cate = multi.getParameter("pd_cate");
		String pd_datail = multi.getParameter("pd_detail");
		String pi_oriname = multi.getParameter("pi_oriname");

		prodDto.setPd_code(pd_code);
		prodDto.setPd_at_name(pd_at_name);
		prodDto.setPd_cate(pd_cate);
		prodDto.setPd_detail(pd_datail);
		prodDto.setPd_name(pd_name);
		prodDto.setPd_numofstock(pd_numofstock);
		prodDto.setPd_option(pd_option);
		prodDto.setPd_price(pd_price);
		prodDto.setPd_sex(pd_sex);
		prodDto.setPd_type(pd_type);
		prodImgDto.setPi_oriname(pi_oriname);

		boolean b = atDao.ATProdUpdate(prodDto);

		// 2. Insert한 상품의 상품코드를 가져와 이미지 업로드
		int currentPd_code = prodDto.getPd_code();
		// 상품 이미지를 먼저 지움
		atDao.deleteImg(currentPd_code);
		prodImgDto = prodImgup(multi, currentPd_code);
		if (b) {
			// 상품 insert 성공하면 해당 상품의 image도 DB에 insert
			atDao.ATProdImgInsert(prodImgDto);
			view = "redirect:ATProdManage";
			rttr.addFlashAttribute("ATProdcheck", "등록 완료");

		} else {
			// 상품 insert 실패
			view = "redirect:ATProdRegist";
			rttr.addFlashAttribute("ATProdcheck", "등록 실패");

		}
		return view;

	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 선택한 상품의 판매여부를 판매 (T)로 전환
	 * 작성자: JWJ 
	 * 작성일: 2020.02.07
	 ----------------------------------------------------------------------------------------- */
	public ModelAndView changeProdRegist(String[] chkedBoxArr) {
		mav = new ModelAndView();
		for (String pd_code : chkedBoxArr) {
			int pdCode = Integer.parseInt(pd_code);
			atDao.changeProdRegist(pdCode);
		}
		mav = getATProdList(null,null);
		
		return mav;
	}

	/*---------------------------------------------------------------------------------------
	 * 기능 : 응원의 한마디
	 * 책임자 : 김병현, 김종현
	 * 작성일 : 2020.02.06
	 * 최종수정일 : 2020.02.06
	 ----------------------------------------------------------------------------------------- */
	public Map<String, List<SM_Dto>> replyInsert(SM_Dto reply) {

		Map<String, List<SM_Dto>> rmap = null;

		try {
			atDao.replyInsert(reply);
			// 댓글 하나를 DB에 넣으면 댓글리스트를 다시 불러오자
			List<SM_Dto> rList = atDao.getReplyList1(reply.getSm_receiver());
			rmap = new HashMap<String, List<SM_Dto>>();
			rmap.put("rList", rList);
			
			
		} catch (Exception e) {
			rmap = null;
			// 먼저 try문이 실행 되므로 map은 생성 되어있고 에러를 발생시켜
			// ajax의 error 부의 함수를 실행시키기 위함
		}
		return rmap;
	}

	// 1. 응원의 한마디 출력
		public ModelAndView getSupportMg(String sm_receiver) {

			mav = new ModelAndView();

			List<SM_Dto> rList = atDao.getReplyList1(sm_receiver);
			
			SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
			
			for(int i=0; i<rList.size(); i++) {
				
				String convertDate = dataFm.format(rList.get(i).getSm_date());
				
				rList.get(i).setSm_regdate(convertDate);
				
			}
			

			mav.addObject("rList", rList);
			mav.setViewName("ATSupportMg");

			return mav;
		}
		
		
		public ModelAndView deleteMessage(int sm_num,RedirectAttributes rttr) {
			mav = new ModelAndView();
			String view = null;
			try {
				atDao.deleteMessage(sm_num);
				view = "redirect:ATSupportMg";
				rttr.addFlashAttribute("check","글 삭제에 성공하셨습니다");
			}catch(Exception e) {
				view = "redirect:ATSupportMg";
				rttr.addFlashAttribute("check","글 삭제에 실패하셨습니다");
			}
			mav.setViewName(view);
			
			return mav;
		}


	/*--------------------------------------------------------------------------------------- 
	 * 기능: 선택한 상품을 삭제
	 * 작성자: JWJ 
	 * 작성일: 2020.02.07
	 ----------------------------------------------------------------------------------------- */
	public String deleteProd(String[] chkedBoxArr, RedirectAttributes rttr) {
		String view = null;

		for (String pd_code : chkedBoxArr) {
			int pdCode = Integer.parseInt(pd_code);
			atDao.deleteProd(pdCode);
		}
		view = "redirect:ATProdManage";
		rttr.addFlashAttribute("ATProdcheck", "삭제 완료");
		return view;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 선택한 주문 내역의 배송상태를 변경
	 * 작성자: JWJ 
	 * 작성일: 2020.02.07
	 ----------------------------------------------------------------------------------------- */
	public String chgDeliveryState(String[] chkedBoxArr, RedirectAttributes rttr) {
		String view = null;

		for (String po_num : chkedBoxArr) {
			int poNum = Integer.parseInt(po_num);
			atDao.chgDeliveryState(poNum);
		}
		view = "redirect:ATOrderState";
		rttr.addFlashAttribute("check", "상태변경 완료!");
		return view;
	}

	/*--------------------------------------------------------------------------------------- 
	 * 기능: 주문 조회 페이지에서 주문 상태별로 출력하기 위한 기능 
	 * 작성자: JWJ 
	 * 작성일: 2020.02.09
	 * 수정일: 2020.02.10
	 ----------------------------------------------------------------------------------------- */
	public ModelAndView getATOrderList(String orderState) {
		// 1. 세션에서 id를 가져와 주문테이블에서 그 아이디에 해당하는 주문을 모두 가져옴.
		mav = new ModelAndView();
		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String AT_id = cmDto.getCm_id();
		// 로그인 한 공방 회원의 id를 가지고 그 회원의 공방이름을 가져옴
		String AM_Name = atDao.getAM_Name(AT_id);
		// 2. JSP에서 처음에는 before를 넘기고, select박스의 내용에 따라 being을 넘기거나 after를 넘긴다
		PO_Vo po_Vo = new PO_Vo();
		po_Vo.setPo_cm_id(AT_id);

		if (orderState == null) {
			po_Vo.setPo_state("before");
		} else {
			switch (orderState) {
			case "before":
				po_Vo.setPo_state("before");
				break;
			case "being":
				po_Vo.setPo_state("being");
				break;
			case "after":
				po_Vo.setPo_state("after");
				break;
			}
		}

		List<PO_Vo> poDtoList = atDao.getATOrderList(po_Vo);

		// 날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < poDtoList.size(); i++) {
			String convertDate = dataFm.format(poDtoList.get(i).getPo_date());
			poDtoList.get(i).setConveredPo_date(convertDate);
		}

		mav.addObject("poDtoList", poDtoList);
		mav.addObject("ATOrderCheck", po_Vo.getPo_state());
		mav.setViewName("ATOrderState");

		return mav;
	}

	
	/* -----------------------------------------------------------------------------
	 * 기능: 공지사항 작성 
	 * 작성자: KJH
	 * 작성일 : 2020.02.10
	 * 최종수정일 : 2020.02.11
	 * ------------------------------------------------------------------------------ */
	public ModelAndView noticeWrite(AT_NT_Dto ntDto,RedirectAttributes rttr) {
		log.warn("noticeserv");

		mav = new ModelAndView();

		
		String view = null;

		try {
			ntDao.noticeWrite(ntDto);
			view = "redirect:ATNotice";
			rttr.addFlashAttribute("writecheck", 2);
		} catch (Exception e) {
			view = "redirect:ATNoticeWrite";// redirect로, writeFrm에 가라
			rttr.addFlashAttribute("writecheck", 1);
		}
		mav.setViewName(view);
		// mav에 데이터를 담지 않아도 되나..?? - Insert를 하니까 상관 없음
		return mav;
	}

	/*
	    * -----------------------------------------------------------------------------
	    * 기능: 공지사항 출력
	    * 작성자: KJH 
	    * 작성일 : 2020.02.10 
	    * 최종수정일 : 2020.02.13
	    * ----------------------------------------------------------------------------- */
	   public ModelAndView getATNoticeList(String at_nt_id) {
	      List<AT_NT_Dto> ntList = ntDao.getNtList(at_nt_id);
	      mav.addObject("ntList",ntList);
	      mav.setViewName("ATNotice");
	      
	      return mav;
	   }
	   
	   /*
	    * -----------------------------------------------------------------------------
	    * 기능: 공지사항 세부내용 출력 
	    * 작성자: KJH 
	    * 작성일 : 2020.02.10 
	    * 최종수정일 : 2020.02.13
	    * ----------------------------------------------------------------------------- */
	   public ModelAndView getNoticeContents(Integer at_nt_num) {
	      mav = new ModelAndView();
	      ntDao.upView(at_nt_num);
	      AT_NT_Dto anDto = ntDao.getContents(at_nt_num);

	      AT_NT_Dto getNoticeContents = ntDao.getContents(at_nt_num);
	      CM_Dto sessionMember = (CM_Dto) session.getAttribute("mb");
	      if(sessionMember != null) {
	         String getSessionId = sessionMember.getCm_id();
	         String getId = getNoticeContents.getAt_nt_id();

	         if (getId.equals(getSessionId)) {
	            mav.addObject("deleteCheck", 1);
	         } else {
	            mav.addObject("deleteCheck", 0);
	         }
	      }
	      mav.addObject("board", anDto);// board는 공지사항 내용출력 ${board.at_nt_contents}
	      mav.setViewName("ATNoticeDetail");

	      return mav;
	   }

	
	   /*-----------------------------------------------------------------------------
	    * 기능: 공지사항 삭제 
	    * 작성자: KJH 
	    * 작성일 : 2020.02.10 
	    * 최종수정일 : 2020.02.13
	    * ----------------------------------------------------------------------------- */
	   public String delNotice(int at_nt_num, RedirectAttributes rttr) {

	      AT_NT_Dto getBoardContents = ntDao.getContents(at_nt_num);
	      CM_Dto sessionMember = (CM_Dto) session.getAttribute("mb");
	      String getSessionId = sessionMember.getCm_id();
	      String getId = getBoardContents.getAt_nt_id();
	      if (getId.equals(getSessionId)) {

	         ntDao.delNoticeContents(at_nt_num);

	         String view = "redirect:ATNotice?pageNum=" + session.getAttribute("pageNum");// redirect로, writeFrm에 가라
	         rttr.addFlashAttribute("check", "삭제 완료!");
	         return view;
	      } else {
	         String view = "redirect:ATNoticeDetail?at_nt_num=" + at_nt_num;
	         rttr.addFlashAttribute("check", "다른 사람의 글은 삭제 할 수 없습니다. ");
	         return view;
	      }
	   }

	/*-------------------------------------------------------------------
	 * 기능 : 발주 리스트 조회 서비스 / 발주 조회 리스트 취소 서비스
	 * 작성자: JSH / KYH
	 * 작성일 : 2020.02.11 / 2020.02.08
	 ------------------------------------------------------------------- */
	public ModelAndView getATOrderSearchList(HttpServletRequest request, RedirectAttributes rttr) {
		mav = new ModelAndView();

		log.warn("발주 리스트 조회 서비스 시작");

		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String id = cmDto.getCm_id();
		log.warn(id);

		List<RO_Dto> atoList = atDao.getATOrderSearchList(id);

		// 날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < atoList.size(); i++) {
			String convertDate = dataFm.format(atoList.get(i).getRo_date());
			atoList.get(i).setRo_dateSimple(convertDate);
		}

		// 취소를 위한 처리
		String[] roCheckedBoxArr = request.getParameterValues("rmProdCancleChk");// 체크박스의 값들이 넘어옴
		if (roCheckedBoxArr == null) {
			// 취소신청한 품목이 없음..
			// 사실 jsp의 자바스크립트에서 체크를 안 했을시의 처리를 했음.
		} else {
			// 취소를 신청한 품목이 있다면
			for (String ro_num : roCheckedBoxArr) {
				int roNum = Integer.parseInt(ro_num);
				roDao.rmOrderListCancle(roNum);
			}
			mav = new ModelAndView();
			mav.setViewName("redirect:ATOrderSearch");

			rttr.addFlashAttribute("check", "발주 목록 삭제 완료!");
			return mav;
		}

		mav.addObject("atoList", atoList);
		mav.setViewName("ATOrderSearch");

		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 공방 관리 홈 리스트 출력 서비스
	 * 작성자: JSH
	 * 작성일 : 2020.02.11
	 ------------------------------------------------------------------- */
	public ModelAndView getATManagerList() {

		mav = new ModelAndView();

		log.warn("발주 리스트 조회 서비스 시작");

		CM_Dto cmDto = (CM_Dto) session.getAttribute("mb");
		String id = cmDto.getCm_id();
		log.warn(id);
		
		AT_Dto at_dto = new AT_Dto();
		at_dto = atDao.getATSessionData(id);
		session.setAttribute("at", at_dto);

		List<RO_Dto> atmList = atDao.getATOrderSearchList(id);
		
		// 날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < atmList.size(); i++) {
			String convertDate = dataFm.format(atmList.get(i).getRo_date());
			atmList.get(i).setRo_dateSimple(convertDate);
		}

		// 구독자 수 출력
		int subNum = SubscribeNum(id);

		// 제품 오더 수 출력
		int orderNum = prodOrderNum(id);
		
		//	등록된 상품 수 출력
		int prodNum = prodNum(id);
		
		mav.addObject("prodNum", prodNum);
		mav.addObject("orderNum", orderNum);
		mav.addObject("subNum", subNum);
		mav.addObject("atmList", atmList);
		mav.setViewName("ATManager");

		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 발주 조회 / 다중 삭제 서비스
	 * 작성자: JSH
	 * 작성일 : 2020.02.11
	 ------------------------------------------------------------------- */
	public void orderCancel(String chkedBoxValue) {
		int parCancel = Integer.parseInt(chkedBoxValue);
		atDao.delATOrder(parCancel);
	}

	/*-------------------------------------------------------------------
	 * 기능 : 공방 관리 홈 리스트 출력 서비스 / 구독자 수 출력
	 * 작성자: JSH
	 * 작성일 : 2020.02.12
	 ------------------------------------------------------------------- */

	public int SubscribeNum(String id) {
		int Subscribe = atDao.getSubscribeNum(id);

		return Subscribe;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 공방 관리 홈 리스트 출력 서비스 / 제품 오더 수
	 * 작성자: JSH
	 * 작성일 : 2020.02.12
	 ------------------------------------------------------------------- */
	public int prodOrderNum(String id) {
		int prodOrder = atDao.getProdOrderNum(id);

		return prodOrder;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 공방 관리 홈 리스트 출력 서비스 / 등록된 제품 수
	 * 작성자: JSH
	 * 작성일 : 2020.02.12
	 ------------------------------------------------------------------- */
	public int prodNum(String id) {
		int prodNum = atDao.getprodNum(id);

		return prodNum;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 공방의 리스트를 출력
	 * 작성자: 정성규
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView printATList(String[] checkedBoxArr) {
		mav = new ModelAndView();
		List<AT_Dto> at_list = atDao.getATList(); 

		int listsize = at_list.size();

		System.out.println(listsize);
		List<AT_Dto> at_recommend_list = new ArrayList<AT_Dto>();
		List<AT_Dto> at_filter_list = new ArrayList<AT_Dto>();
		
		// 필터링 
		if(checkedBoxArr != null) {
			for(int i = 0; i < checkedBoxArr.length; i++) {
				for(int j = 0; j < at_list.size(); j++) {
					System.out.println(at_list.size());
					if(at_list.get(j).getAt_cate1().equals(checkedBoxArr[i])
					   || at_list.get(j).getAt_cate2().equals(checkedBoxArr[i])
					   || at_list.get(j).getAt_cate3().equals(checkedBoxArr[i])) {
						at_filter_list.add(at_list.get(j));
						at_list.remove(j);
					}
				}
			}
		}
		else {
			at_filter_list = at_list;
		}
		
		// 추천공방 5개를 추첨
		for(int i = 0; i < 5; i++) {
			int ran = (int)(Math.random() * listsize + 1);

			at_recommend_list.add(atDao.getRecommendAT(ran));

			// 추천공방 중복 방지
			for(int j=0; j<i-1; j++) {
				if(at_recommend_list.get(i).getAt_seq() == at_recommend_list.get(j).getAt_seq()) {
					at_recommend_list.remove(i);
					i--;
					System.out.println("중복이다");
				}
			}
		}

		mav.addObject("at_filter_list", at_filter_list);
		mav.addObject("at_recommend_list", at_recommend_list);
		mav.setViewName("ATMain");
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 공방에서 만든 상품의 리스트를 출력
	 * 작성자: 정성규
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getATDetail(int at_num) {
		mav = new ModelAndView();
		AT_Dto at_dto = new AT_Dto();
		PD_productDto pd_dto = new PD_productDto();
		PI_productImgDto pi_dto = new PI_productImgDto();

		at_dto = atDao.getATDetailData(at_num);

		session.setAttribute("at", at_dto);

		List<PI_productImgDto>piList = new ArrayList<PI_productImgDto>();

		List<PD_productDto> pdList = pdDao.getPDListByAT(at_dto.getAt_id());

		for(int i = 0; i < pdList.size(); i++) {
			piList.add(piDao.getPDImageList(pdList.get(i).getPd_code()));
		}

		mav.addObject("at_dto", at_dto);
		mav.addObject("pdList", pdList);
		mav.addObject("piList", piList);
		mav.setViewName("ATDetail");
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 공방 정보 수정 
	 * 작성자: 정성규
	 * 작성일: 2020.02.10
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView updateATData(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		AT_Dto at_dto = new AT_Dto();
		AT_Dto at_dto_temp = new AT_Dto();

		int check = Integer.parseInt(multi.getParameter("fileCheck"));

		at_dto_temp = (AT_Dto)session.getAttribute("at");

		at_dto.setAt_id(at_dto_temp.getAt_id());
		at_dto.setAt_addr(multi.getParameter("at_addr"));
		at_dto.setAt_snsaddr(multi.getParameter("at_snsaddr"));
		at_dto.setAt_name(multi.getParameter("at_name"));
		at_dto.setAt_phone(multi.getParameter("at_phone"));
		at_dto.setAt_cate1(multi.getParameter("at_cate1"));
		at_dto.setAt_cate2(multi.getParameter("at_cate2"));
		at_dto.setAt_cate3(multi.getParameter("at_cate3"));
		String view = null;
		try {
			atDao.updateATData(at_dto);
			mav = getATDetail(at_dto_temp.getAt_seq());
			
			rttr.addFlashAttribute("check",2);
		} catch(Exception e) {
			view = "redirect:ATInfoModify";
			rttr.addFlashAttribute("check",1);
		}

		if(check == 1) {//파일이 들어왔을 때...
			//파일 처리 메소드 호출
			fileup(multi,at_dto.getAt_id(), at_dto);
		}

		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 수정 서비스 / 프로필 이미지 업로드
	 * 수정자 : JSG
	 * 작성자: JSH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	public boolean fileup(MultipartHttpServletRequest multi, String AT_ID, AT_Dto at_dto) {

		log.warn("이미지 업로드 시작");
		String milsec = String.valueOf(System.currentTimeMillis());
		String AT_ID_milsec = milsec+AT_ID;

		AT_ID_milsec = AT_ID_milsec.replace(".com", ".jpg");

		System.out.println("예상 파일명 :: " + AT_ID_milsec);

		at_dto.setAt_logo(AT_ID_milsec);

		System.out.println("시간 :: " + AT_ID_milsec);

		MultipartFile mf = multi.getFile("input_img");
		String path = multi.getSession().getServletContext().getRealPath("/");
		path += "resources/upload/logo/";
		log.warn(path);


		File dir = new File(path);
		if(dir.isDirectory() == false) {
			dir.mkdir();
		}

		boolean fResult = false;

		String profileName = AT_ID;
		String fileName = AT_ID_milsec.replace("com", "jpg");

		try {
			log.warn("파일업로드 try 문 시작");
			mf.transferTo(new File(path+fileName));
			fResult = atDao.pfPhoto(at_dto);
		} catch (IOException e) {
			fResult = false;
		}

		return fResult;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 정보 / 프로필 사진 출력
	 * 수정자 : JSG
	 * 작성자: JSH
	 * 작성일: 2020.02.06
	 -----------------------------------------------------------------------------------------*/
	public void profileIMG(String name, HttpServletRequest req, HttpServletResponse resp) {
		//서버의 파일 위치를 얻자.
		log.warn("이미지 출력 시작");
		String path = req.getSession().getServletContext().getRealPath("/") + "resources/upload/logo/";
		log.warn(path);

		String profileName = name;
		String fileName = profileName.replace("com", "jpg");

		log.warn(path);
		log.warn(fileName);

		InputStream is = null;// 서버 컴퓨터 안에 저장된 파일을 읽어오는 것
		OutputStream os = null;// 파일을 사용자 컴퓨터로 전송하기 위한 것

		String realPath = path+fileName;
		log.warn(realPath);

		try {
			// 파일 객체 생성
			File file = new File(realPath);
			is = new FileInputStream(file);

			//응답 객체 (resp)의 헤더 설정
			//파일 전송용 contentType 설정
			resp.setContentType("application/octet-stream");
			//resp.setHeader("content-Disposition", "attachment; filename=\"" + fileName +"\"");
			resp.setHeader("content-Disposition", "attachment; filename=" + fileName);
			//attachment; filename=\파일명.txt"\가 됨

			//응답 객체(resp)를 통해서 파일 전송
			os = resp.getOutputStream();

			//전송하기
			byte[] buffer = new byte[1024];//파일의 데이터를 buffer에 넣음
			int length;
			while((length = is.read(buffer)) != -1) {
				os.write(buffer,0,length);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				os.flush();
				os.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/*-------------------------------------------------------------------
	 * 기능 : 거래처 조회 검색
	 * 작성자: JWJ
	 * 작성일 : 2020.02.14
	 ------------------------------------------------------------------- */
	public ModelAndView prodSearch(String keyword) {
		mav = new ModelAndView();
		List<RM_Dto> searchList = atDao.prodSearch(keyword);
		mav.addObject("rmList", searchList);
		mav.setViewName("ATOrderRequest");

		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 판매 등록 여부별 상품 출력
	 * 작성자: JWJ
	 * 작성일 : 2020.02.14
	 ------------------------------------------------------------------- */
	public ModelAndView getregistSelProd(String registSelect) {
		mav = new ModelAndView();
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String id = cmDto.getCm_id();

		//registSelect null이면 모두 가져와야 함.
		if(registSelect.equals("all")) {
			return getATProdList(null,null);
		}else {
			Map<String , String> dataMap = new HashMap<String, String>();
			List<PI_productImgDto> piList = new ArrayList<PI_productImgDto>();
			dataMap.put("cm_id", id);
			dataMap.put("pd_regist", registSelect);
			List<PD_productDto> pdList = atDao.getregistSelProd(dataMap);
	
			for(int i = 0 ; i < pdList.size(); i++ ) {
				PI_productImgDto piDto = new PI_productImgDto();
				piDto = atDao.getProdImg(pdList.get(i).getPd_code());
				piList.add(piDto);
				
			}
			mav.addObject("piList",piList);
			mav.addObject("registcheck",registSelect);
			mav.addObject("pd",pdList);
			mav.setViewName("ATProdManage");
		}
		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 판매물품 관리 메소드
	 * 작성자: KBH
	 * 작성일 : 2020.02.17
	 ------------------------------------------------------------------- */
	public ModelAndView getATProdList(String at_id) {
		mav = new ModelAndView();
		List<AT_ProdDto> pdList = atDao.getATProdList(at_id);
		mav.addObject("pdList",pdList);
		mav.setViewName("ATProduct");

		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 카테고리 별 필터기능
	 * 작성자: JSG
	 * 작성일 : 2020.02.17
	 ------------------------------------------------------------------- */
	public ModelAndView getFilteringList(String[] checkedBoxArr) {
		mav = new ModelAndView();
		List<AT_Dto> atlist = atDao.getATList();
		List<AT_Dto> at_recommend_list = new ArrayList<AT_Dto>();

		for(int i = 0; i < checkedBoxArr.length; i++) {
			for(int j = 0; j < atlist.size(); j++) {
				if(atlist.get(j).getAt_cate1().equals(checkedBoxArr[i])
				   || atlist.get(j).getAt_cate2().equals(checkedBoxArr[i])
				   || atlist.get(j).getAt_cate3().equals(checkedBoxArr[i])) {
					at_recommend_list.add(atlist.get(j));
					atlist.remove(j);
				}
			}
		}
		//List<AT_Dto> atlist = atDao.getFilteringList(checkedBoxArr);
		mav.addObject("at_recommend_list", at_recommend_list);
		mav.setViewName("ATMain");
		//printATList();
		return mav;
	}
	
	
	public ModelAndView getATMessage(String receiver) {
		mav = new ModelAndView();
		mav.addObject("pd",receiver);
		mav.setViewName("ATMessageWrite");
		
		return mav;
	}

	public ModelAndView setMessage(MG_Dto mgDto, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		AT_Dto atDto = (AT_Dto)session.getAttribute("at");
		int seq = atDto.getAt_seq();
		
		try {
			atDao.setMessage(mgDto);
			rttr.addFlashAttribute("check","성공");
			mav = getATDetail(seq);
		}catch(Exception e) {
			mav = getATDetail(seq);
			rttr.addFlashAttribute("check","fail");
		}
		
		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 공방 관리자가 메인 관리자에게 쪽지 보내는 서비스
	 * 작성자: JSH
	 * 작성일 : 2020.02.19
	 ------------------------------------------------------------------- */
	public ModelAndView setATMessageRQSend(MG_Dto mgDto) {
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String cmid = cmDto.getCm_id(); 
		
		mgDto.setMg_sender(cmid);
		
		atDao.sendATMessageRQ(mgDto);
		
		return mav;
	}

	/*-------------------------------------------------------------------
	 * 기능 : 제품 등록으로 이동
	 * 작성자: JWJ
	 * 작성일 : 2020.02.20
	 ------------------------------------------------------------------- */
	public ModelAndView prodMake() {
		mav = new ModelAndView();
		List<CT_Dto> ctList = atDao.getctList();
		List<RM_Dto> rmList = atDao.getRmList();
		
		mav.addObject("ctList",ctList);
		mav.addObject("rmList",rmList);
		mav.setViewName("ATProdRegist");
		return mav;
	}
}//AT_Service Class end




















