package com.atelier.mypage.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.dao.CM_Dao;
import com.atelier.dto.CM_Dto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class PwdChangeService {

	@Setter(onMethod_=@Autowired)
	private HttpSession  session;


	@Setter(onMethod_=@Autowired)
	private CM_Dao mDao;

	private ModelAndView mav;

	/*---------------------------------------------------------------------------------
	 * 기능 : 비밀번호 변경
	 * 작성인 : 김병현,김종현
	 * 작성날짜 : 2020.02.04     최종수정일 :2020.02.04
 	----------------------------------------------------------------------------------*/
	public ModelAndView changeProc(String cm_id, String pwd1,String pwd2, String pwd3) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwdEncode = new BCryptPasswordEncoder();

		String cm_pass = mDao.getSecurityPwd(cm_id);

		if(pwdEncode.matches(pwd1, cm_pass)) {
			if(pwd2.equals(pwd3)) {

				String cm_pwd = pwdEncode.encode(pwd2);

				CM_Dto udto = new CM_Dto();

				udto.setCm_id(cm_id);
				udto.setCm_pwd(cm_pwd);
				try {
					mDao.upPass(udto);
					mav.addObject("chgMessage","비밀번호가 변경되었습니다.");
					view = "main";
					log.warn("ddddddd");
				}catch(Exception e) {
					e.printStackTrace();
					view = "myChangePwd";
					log.warn("ddddddd");
				}
			}
			else {
				log.warn("ddddddd");
				mav.addObject("chgMessage","비밀번호 변경실패!");
				view = "myChangePwd";
			}
		}
		else {
			log.warn("ddddddd");
			mav.addObject("chgMessage","비밀번호 변경실패!");
			view = "myChangePwd";

		}
		mav.setViewName(view);
		
		return mav;
	}

}//PwdChangeService Class end
