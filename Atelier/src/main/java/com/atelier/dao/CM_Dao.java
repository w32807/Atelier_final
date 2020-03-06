package com.atelier.dao;

import java.util.List;

import com.atelier.dto.AT_Dto;
import com.atelier.dto.BT_Dto;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.vo.PO_Vo;



public interface CM_Dao {
	
	public boolean memberInsert(CM_Dto member);
	
	public String getSecurityPwd(String cm_id);

	public CM_Dto getMemberInfo(String cm_id);
	
	//public CM_Dto getMemberInfo2(String getSessionId);
	
	public boolean memberUpdate(CM_Dto member);

	public int checkOverId(String CM_ID);
	
	public boolean upPass(CM_Dto udto);

	public boolean pfPhoto(String profileName);
	
	public int checkRegistOverllap(String id);

	public List<PD_productDto> getproduct_AllList();

	public String getPi_oriName(int pd_code);

	public List<PD_productDto> getProdList(String pd_cate);

	public PD_productDto getprodDetail(int pd_code);

	public int getAt_num(String pd_at_name);

	public void insertbasket(BT_Dto btDto);

	public int getPd_code(int getorderVtNum);

	public void orderInsert(PO_Vo poVo);
	
	public void userStateChange(CM_Dto cm_dto);
	
	public AT_Dto getAt(String at_id);
	
}
