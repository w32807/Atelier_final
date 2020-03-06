package com.atelier.mypage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.atelier.at.service.AT_Service;
import com.atelier.dao.AT_Dao;
import com.atelier.dao.CM_Dao;
import com.atelier.dao.MP_Dao;
import com.atelier.dao.PD_Dao;
import com.atelier.dao.SB_Dao;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.MP_SubscribeDto;
import com.atelier.dto.PO_Dto;
import com.atelier.main.service.CM_Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyPageService {
	ModelAndView mav;

	@Setter(onMethod_ = @Autowired)
	private HttpSession session;

	@Setter(onMethod_ = @Autowired)
	MyPageService mpServ;
	
	@Setter(onMethod_ = @Autowired)
	private CM_Dao cm_Dao;
	
	@Setter(onMethod_ = @Autowired)
	private MP_Dao mpDao;
	
	@Setter(onMethod_ = @Autowired)
	private CM_Service cmServ;
	
	@Setter(onMethod_ = @Autowired)
	private AT_Service atServ;
	
	@Setter(onMethod_ = @Autowired)
	private AT_Dao at_Dao;
	
	@Setter(onMethod_ = @Autowired)
	private PD_Dao pd_Dao;
	
	@Setter(onMethod_ = @Autowired)
	private SB_Dao sb_Dao;
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 수정 서비스
	 * 수정자: JSG   수정내용 : 1. 수정 후 myPage 경로로 이동   2. 변경된 정보로 세션(mb)에 저장
	 * 작성자: JSH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	@Transactional
	public ModelAndView myPageFixServ(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		mav = new ModelAndView();
		
		CM_Dto cm_Dto = new CM_Dto();
		int check = Integer.parseInt(multi.getParameter("fileCheck"));
		
		cm_Dto.setCm_id(multi.getParameter("CM_ID"));
		cm_Dto.setCm_name(multi.getParameter("CM_NAME"));
		cm_Dto.setCm_nick(multi.getParameter("CM_NICK"));
		cm_Dto.setCm_phone(multi.getParameter("CM_PHONE"));
		cm_Dto.setCm_addr(multi.getParameter("CM_ADDR"));
		cm_Dto.setCm_addr2(multi.getParameter("CM_ADDR2"));
		
		log.warn(cm_Dto.getCm_id());
		
		String view = null;
		try {
			cm_Dao.memberUpdate(cm_Dto);
			view = "redirect:myPage";
			rttr.addFlashAttribute("check",2);
		} catch (Exception e) {
			view = "redirect:myInfoUpdate";
			rttr.addFlashAttribute("check",1);
		}
		
		if(check == 1) {//파일이 들어왔을 때...
			//파일 처리 메소드 호출
			fileup(multi,cm_Dto.getCm_id());
		}
		mav.setViewName(view);
		cm_Dto = cm_Dao.getMemberInfo(cm_Dto.getCm_id());
		session.setAttribute("mb", cm_Dto);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 수정 서비스 / 프로필 이미지 업로드
	 * 작성자: JSH
	 * 작성일: 2020.02.05
	 -----------------------------------------------------------------------------------------*/
	public boolean fileup(MultipartHttpServletRequest multi, String CM_ID) {
		log.warn("이미지 업로드 시작");
		
		MultipartFile mf = multi.getFile("input_img");
		String path = multi.getSession().getServletContext().getRealPath("/");
		path += "resources/upload/profile/";
		log.warn(path);

		
		File dir = new File(path);
		if(dir.isDirectory() == false) {
			dir.mkdir();
		}
		
		boolean fResult = false;

		String profileName = CM_ID;
		String fileName = profileName.replace("com", "jpg");
		String nameFile = fileName.replace(".jpg", "");
		
		try {
			log.warn("파일업로드 try 문 시작");
			mf.transferTo(new File(path+fileName));
			fResult = cm_Dao.pfPhoto(profileName);
		} catch (IOException e) {
			fResult = false;
		}

		return fResult;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 정보 / 프로필 사진 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.06
	 -----------------------------------------------------------------------------------------*/
	public void profileIMG(String name, HttpServletRequest req, HttpServletResponse resp) {
		//서버의 파일 위치를 얻자.
		log.warn("이미지 출력 시작");
		String path = req.getSession().getServletContext().getRealPath("/") + "resources/upload/profile/";
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
			File file = new File(realPath);
			is = new FileInputStream(file);
		
			resp.setContentType("application/octet-stream");
			resp.setHeader("content-Disposition", "attachment; filename=" + fileName);
			
			os = resp.getOutputStream();
			
			//전송하기
			byte[] buffer = new byte[1024];
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
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 정보 개요 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getmyPage() {
		mav = new ModelAndView();
		
		log.warn("마이페이지 서비스 시작");
		
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String id = cmDto.getCm_id();
		log.warn(id);
		
		//	MY INFORMATIONS 데이터 출력을 위한 처리
		int sendingProd = sendingProd(id);
		int subscribedNum = subscribedNum(id);
		int uncheckedMessageNum = uncheckedMessageNum(id);
		
		List<PO_Dto> poList = mpDao.getProdOrderList(id);
		
		//	날짜를 yyyy-MM-dd 형태로 변환
		SimpleDateFormat dataFm = new SimpleDateFormat("yyyy-MM-dd");
		for(int i=0;i<poList.size();i++) {
			String convertDate = dataFm.format(poList.get(i).getPo_date());
			poList.get(i).setPo_date_simple(convertDate);
		}
		
		//	제품코드로 제품명 치환
		for(int i=0;i<poList.size();i++) {
			int pdCode = poList.get(i).getPo_pd_code();
			String prodName = mpDao.getProdName(pdCode);
			poList.get(i).setPo_pd_name(prodName);
		}
		
		//	배송상태 한글로 치환
		for(int i=0;i<poList.size();i++) {
			String carryingState = poList.get(i).getPo_state();
			if(carryingState.equals("before")) {
				poList.get(i).setPo_state("배송전");
			} else if (carryingState.equals("being")) {
				poList.get(i).setPo_state("배송중");
			} else if (carryingState.equals("after")) {
				poList.get(i).setPo_state("배송완료");
			}
		}
		
		//	구독 정보 출력
		List<MP_SubscribeDto> mpsList = mpDao.getSubscribeList(id);
		
		//	공방 id를 공방명으로 치환
		for(int i=0;i<mpsList.size();i++) {
			String atId = mpsList.get(i).getSc_at_id();
			String atName = mpDao.getAtName(atId);
			mpsList.get(i).setSc_at_name(atName);
		}
		
		//	mb세션 id로 at세션 담기
		AT_Dto atData = new AT_Dto();
		atData = at_Dao.getAtData(id);
		
		mav.addObject("atData", atData);
		mav.addObject("mpsList", mpsList);
		mav.addObject("sendingProd", sendingProd);
		mav.addObject("subscribedNum", subscribedNum);
		mav.addObject("uncheckedMessageNum", uncheckedMessageNum);
		mav.addObject("poList", poList);
		mav.setViewName("myPage");
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 정보 개요 출력 / 주문 내역
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public int sendingProd(String id) {
		int sendingProd = mpDao.getSendingProd(id);
		
		return sendingProd;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 정보 개요 출력 / 구독중인 공방 수
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public int subscribedNum(String id) {
		int subscribedNum = mpDao.getSubscribedNum(id);
		
		return subscribedNum;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 정보 개요 출력 / 읽지 않은 쪽지 수
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public int uncheckedMessageNum(String id) {
		int ucmNum = mpDao.getUncheckedMessageNum(id);
		
		return ucmNum;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 판매자에게 문의 / 정보 출력
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getMyPageMessageSend(String po_at_id) {
		log.warn("판매자에게 문의 서비스 실행");
		
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String sender = cmDto.getCm_id();
		String reciever = po_at_id;
		
		mav.addObject("sender", sender);
		mav.addObject("reciever", reciever);
		mav.setViewName("myPageHomeSendM");
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 판매자에게 문의 / 메세지 전송
	 * 작성자: JSH
	 * 작성일: 2020.02.12
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getMyPageMSendAction(MG_Dto mgDto) {
		log.warn("판매자에게 메세지 전송 서비스 실행");
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String mg_sender = cmDto.getCm_id();
		
		mgDto.setMg_sender(mg_sender);
		log.warn("받는사람: "+ mgDto.getMg_receiver());
		
		mpDao.sendMtoSeller(mgDto);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 제품 바로가기
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView getMyPageGoProd(int po_pd_code) {
		mav = cmServ.getprodDetail(po_pd_code);
		
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 주문 취소
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView actMyPageOrderCancle(int po_num) {
		mpDao.actMyPageOrderCancle(po_num);
		mav = getmyPage();
		mav.addObject("orderCancleMsg","주문취소 되었습니다");
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 구독중인 공방 바로가기
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView actMyPageGoAtelier(String sc_at_id) {
		int at_seq = mpDao.getAtSeq(sc_at_id);
		mav = atServ.getATDetail(at_seq);
		
		return mav;
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 마이페이지 홈 서비스 / 구독 해제
	 * 작성자: JSH
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView actMyPageDelSubs(String sc_at_id) {
		CM_Dto cmDto = (CM_Dto)session.getAttribute("mb");
		String id = cmDto.getCm_id();
		log.warn(id);
		
		MP_SubscribeDto mpSubDto = new MP_SubscribeDto();
		
		mpSubDto.setSc_at_id(sc_at_id);
		mpSubDto.setSc_cm_id(id);
		
		mpDao.actMyPageDelSubs(mpSubDto);
		mav = getmyPage();
		mav.addObject("subCancleMsg","구독취소 되었습니다");
		return mav;
	}
	
	/* ---------------------------------------------------------------------------------------
	 * 기능: 회원 탈퇴 기능
	 * 작성자: JSG
	 * 작성일: 2020.02.13
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView myDropoutProc(CM_Dto cm_dto, RedirectAttributes rttr) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();

		//DB에서 암호화된 비번 구하기
		String encPwd = cm_Dao.getSecurityPwd(cm_dto.getCm_id());
		if(encPwd != null) {
			if(pwdEncode.matches(cm_dto.getCm_pwd(), encPwd)) {			
				cm_dto = cm_Dao.getMemberInfo(cm_dto.getCm_id());
				
				if(cm_dto.getCm_state().equals("공방회원")) {
					deleteATUserData(cm_dto.getCm_id());
					System.out.println("데이터 삭제 완료");
				}
				
				cm_dto.setCm_state("탈퇴회원");
				cm_Dao.userStateChange(cm_dto);
				session.invalidate();	// 회원 세션 초기화
				view = "redirect:main";
				rttr.addFlashAttribute("check","탈퇴되었습니다. 이용해주셔서 감사합니다!");
			}
			else {
				view = "redirect:/";
				rttr.addFlashAttribute("check","패스워드가 틀립니다.");
			}
		}
		
		mav.setViewName(view);
		return mav;
		
	}

	private void deleteATUserData(String cm_id) {
		pd_Dao.deleteATUserPDData(cm_id);	// 상품 테이블에서 삭제
		sb_Dao.deleteATUserSCData(cm_id);	// 구독 테이블에서 삭제
		at_Dao.deleteATUserATData(cm_id);	// 공방 테이블에서 삭제
		at_Dao.deleteAGRequest(cm_id);		// 공방신청 테이블에서 삭제
	}

	/* ---------------------------------------------------------------------------------------
	 * 기능: 관리자에게 메세지 보내기
	 * 작성자: JSH
	 * 작성일: 2020.02.20
	 -----------------------------------------------------------------------------------------*/
	public ModelAndView SendAdminMessageFromMP(MG_Dto mgDto) {
		log.warn("관리자에게 문의하기 시작 서비스");
		mpDao.sendAdminMessageFromMP(mgDto);
		
		return mav;
	}
	
}//MyPageService Class end
