package com.atelier.dao;

import java.util.List;
import java.util.Map;

import com.atelier.dto.AG_Dto;
import com.atelier.dto.AT_Dto;
import com.atelier.dto.AT_ProdDto;
import com.atelier.dto.CT_Dto;
import com.atelier.dto.MG_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PI_productImgDto;
import com.atelier.dto.PO_Dto;
import com.atelier.dto.RM_Dto;
import com.atelier.dto.RO_Dto;
import com.atelier.dto.SM_Dto;
import com.atelier.vo.PO_Vo;

public interface AT_Dao {

	public boolean ATProdInsert(PD_productDto prodDto);

	public void ATProdImgInsert(PI_productImgDto prodImgDto);

	public int getPd_code();
	
	public boolean setATRegistUserData(AG_Dto ag_Dto);

	public PD_productDto getModifyProd(int pd_code);

	public PI_productImgDto getProdImg(int pd_code);

	public boolean ATProdUpdate(PD_productDto prodDto);

	public void changeProdRegist(Integer pd_code);

	public void replyInsert(SM_Dto reply);

	public List<SM_Dto> getReplyList1(String sm_receiver);

	/* public List<SM_Dto> getReplyList2(SM_Dto reply); */

	public void deleteImg(int currentPd_code);

	public void deleteProd(int pdCode);
	
	public void chgDeliveryState(int pdCode);

	public String getAM_Name(String aT_id);

	public List<PO_Vo> getATOrderList(PO_Vo po_Vo);
	
	public List<AG_Dto> getATRegistUserData();

	public AG_Dto getATRegistMember(String id);

	public void deleteAGRequest(String id);
	
	public List<RO_Dto> getATOrderSearchList(String id);

	public void delATOrder(int chkedBoxValue);

	public int getSubscribeNum(String id);

	public int getProdOrderNum(String id);

	public int getprodNum(String id);

	public String getAt_state(String pd_at_id);
	
	public List<AT_Dto> getATList();
	
	public void updateATState(AT_Dto at_dto);
	
	public List<AT_Dto> getATListSearch(AT_Dto at_dto);
	
	public AT_Dto getRecommendAT(int ran);
	
	public AT_Dto getATDetailData(int at_seq);
	
	public void updateATData(AT_Dto at_dto);
	
	public boolean pfPhoto(AT_Dto at_dto);
	
	public void deleteATUserATData(String cm_id);
	
	public List<RM_Dto> prodSearch(String keyword);

	public List<PD_productDto> getregistSelProd(Map<String, String> dataMap);
	
	public AT_Dto getATSessionData(String cm_id);

	public List<String> getCateName();

	public PD_productDto getProductByCate(String cate);
	
	public List<AT_ProdDto> getATProdList(String at_id);

	public boolean deleteMessage(int sm_num);

	public boolean setMessage(MG_Dto mgDto);

	public void insertATData(AT_Dto at_dto);

	public void sendATMessageRQ(MG_Dto mgDto);

	public AT_Dto getAtData(String id);
	/*
	 * public AT_Dto getAtInfo(String id);
	 */

	public List<CT_Dto> getctList();

	public List<RM_Dto> getRmList();
}