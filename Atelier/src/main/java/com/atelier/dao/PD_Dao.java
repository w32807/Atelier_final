package com.atelier.dao;

import java.util.List;
import java.util.Map;

import com.atelier.dto.PD_productDto;

public interface PD_Dao {
	public List<PD_productDto> getATProdList(Map<String, Object> pageInt);
	
	public int getATProdListCount();

	public List<PD_productDto> getATProdRegistTrueList(Map<String, Integer> pageInt);

	public boolean prodRegistCancle(String pd_code);

	public String getPi_oriName(int pd_code);
	
	public List<PD_productDto> getPDListByAT(String at_id);
	
	public void deleteATUserPDData(String cm_id);
	
}