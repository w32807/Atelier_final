package com.atelier.dao;

import java.util.List;

import com.atelier.dto.PO_Dto;

public interface PO_Dao {

	public List<PO_Dto> getMyOrder(String po_cm_id);

	public int getBoardCount();

	public List<PO_Dto> getOrderList(PO_Dto poDto);

	public boolean orderCancle(String prod);
	
}
