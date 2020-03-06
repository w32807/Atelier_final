package com.atelier.dao;

import java.util.List;

import com.atelier.dto.MG_Dto;
import com.atelier.dto.MP_SubscribeDto;
import com.atelier.dto.PO_Dto;


public interface MP_Dao {

	int getSendingProd(String id);

	int getSubscribedNum(String id);

	int getUncheckedMessageNum(String id);

	List<PO_Dto> getProdOrderList(String id);

	String getProdName(int pdCode);

	void sendMtoSeller(MG_Dto mgDto);

	void actMyPageOrderCancle(int po_num);

	List<MP_SubscribeDto> getSubscribeList(String id);

	String getAtName(String atId);

	int getAtSeq(String sc_at_id);

	void actMyPageDelSubs(MP_SubscribeDto mpSubDto);

	void sendAdminMessageFromMP(MG_Dto mgDto);

}
