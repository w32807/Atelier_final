package com.atelier.dto;



import java.sql.Timestamp;

import lombok.Data;

@Data
public class MG_Dto {
	
	private int mg_num; // 쪽지번호
	private String mg_sender; // 송신자
	private String mg_receiver; // 수신자
	private String mg_check; // 읽음여부 t/f
	private String mg_contents; //쪽지내용
	private Timestamp mg_date; // 받은 시간
	
}
