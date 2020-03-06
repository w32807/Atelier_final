package com.atelier.ad.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.atelier.ad.service.AD_Service;
import com.atelier.dto.CO_NoticeDto;
import com.atelier.dto.FT_FAQDto;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AD_RestController {

	@Setter(onMethod_ = {@Autowired} )
	AD_Service aServ;
	
	/* ---------------------------------------------------------------------------------
	  * 기능: 공지사항 입력 및 출력
	  * 작성자: KYH
	  * 작성일 : 2019.02.04
	  -----------------------------------------------------------------------------------*/
	 @PostMapping(value = "ADNoticeInsert", produces="application/json; charset=utf-8")
	 @ResponseBody
	 public Map<String, List<CO_NoticeDto>> ADNoticeInsert(CO_NoticeDto ntdto, Integer pageNum, Integer maxNum) {
		 Map<String, List<CO_NoticeDto>> ntMap = aServ.ADNoticeInsert(ntdto, pageNum, maxNum);
		 log.warn(ntdto.getNt_title()+ntdto.getNt_contents()+" 공지사항 입력 및 출력 컨트롤러");

		 return ntMap;
	 }
	   
 	 /* ---------------------------------------------------------------------------------
 	  * 기능: FAQ입력 및 출력 기능
 	  * 작성자: JWJ
 	  * 작성일 : 2019.02.02
 	  -----------------------------------------------------------------------------------*/

	@PostMapping(value = "FAQInsert", produces = "application/json; charset=utf-8")
	public Map<String, List<FT_FAQDto>> FAQInsert(FT_FAQDto faq, Integer pageNum, Integer maxNum) {
		Map<String, List<FT_FAQDto>> faqmap = aServ.FAQInsert(faq,pageNum,maxNum);
		
		return faqmap;
		
	}
}//AD_RestController Class end
