package com.atelier.dao;

import java.util.List;

import com.atelier.dto.BT_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PO_Dto;

public interface BT_Dao {

	public List<PO_Dto> getBasketList(String bt_cm_id);

	public boolean goBasket(BT_Dto btDto);

	public boolean deleteBasket(int btNum);

}
