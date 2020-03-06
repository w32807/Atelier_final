package com.atelier.dao;

import java.util.List;

import com.atelier.dto.RM_Dto;

public interface RM_Dao {

	public List<RM_Dto> getRMList();

	public RM_Dto getRMPaymentList(String rm_num);

}
