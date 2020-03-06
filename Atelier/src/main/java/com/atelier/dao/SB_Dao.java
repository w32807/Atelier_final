package com.atelier.dao;

import java.util.List;

import com.atelier.dto.SB_Dto;
import com.atelier.dto.SBS_Dto;

public interface SB_Dao {

	public boolean getSubscription(SB_Dto sbDto);

	public List<SBS_Dto> getSubList(String sc_cm_id);
	
	public void deleteATUserSCData(String cm_id);

	public Integer compareSub(SB_Dto sbDto);
	
}
