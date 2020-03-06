package com.atelier.dao;

import java.util.List;
import java.util.Map;

import com.atelier.dto.PR_Dto;

public interface PR_Dao {
	public List<PR_Dto> getProdReviewList(int pd_code);

	public void prodReviewWrite(PR_Dto prDto);

	public boolean prodReviewDelete(Map<String, Object> dataMap);
	
}
