package com.atelier.at.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.atelier.at.service.AT_Service;
import com.atelier.dao.AT_Dao;
import com.atelier.vo.PO_Vo;

import lombok.Setter;


@RestController
public class AT_RestController {

	@Setter(onMethod_ = @Autowired)
	AT_Service atServ;

	/*-------------------------------------------------------------------
	 * 기   능 : 거래처조회에서 검색
	 * 작성일 : 20.02.05
	 * 작업자 : 장원준
	 -------------------------------------------------------------------*/
	@GetMapping(value = "prodSearch", produces = "application/json; charset=utf-8")
	public Map<String, String> prodSearch(HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		Map<String, String> searchmap = null;

		return searchmap;

	}
}//AT_RestController Class end
