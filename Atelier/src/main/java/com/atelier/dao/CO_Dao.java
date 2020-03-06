package com.atelier.dao;

import java.util.List;

import com.atelier.dto.CO_NoticeDto;
import com.atelier.dto.FT_FAQDto;
import com.atelier.dto.MG_Dto;

public interface CO_Dao {

	public List<CO_NoticeDto> getNoticeList(Integer num1);

	public CO_NoticeDto getNoticeContents(Integer nt_num);

	public int getBoardCount();

	public List<FT_FAQDto> getFAQList(Integer num2);
	
	public int getFAQBoardCount();
	
	public FT_FAQDto viewFAQContents(Integer ft_num);
	
	public boolean ADSendMessage(MG_Dto mgDto);

	public void noticeCountUpdate(Integer noticenum);


}
