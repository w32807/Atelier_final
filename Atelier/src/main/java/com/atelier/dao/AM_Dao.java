package com.atelier.dao;

import com.atelier.dto.AM_Dto;

public interface AM_Dao {
	
	void insertNewATMember(AM_Dto am_Member);

	int checkRegistOverllapByAM(String id);
}
