package com.atelier.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SM_Dto {
	private int sm_num;				//응원의 한마디 번호
	private String sm_contents;		//내용
	private String sm_sender;			//작성자(일반회원ID)
	private String sm_receiver;			//수신자(공방회원ID)

	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp sm_date;
	private String sm_regdate;
	
}
