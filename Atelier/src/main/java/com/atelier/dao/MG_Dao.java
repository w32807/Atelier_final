package com.atelier.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.atelier.dto.MG_Dto;
import com.atelier.dto.PO_Dto;

public interface MG_Dao {

	public List<MG_Dto> getList(String mg_receiver);

	public int getBoardCount();

	public MG_Dto getMessage(Integer mg_num);

	public boolean SendMessage(MG_Dto mDto);

	public List<PO_Dto> getOrderList(MG_Dto mDto);
	
	public boolean ChangeCheck(int mg_num);


}
