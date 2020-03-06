package com.atelier.dto;


import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PO_Dto {
	
	private int po_num; //주문번호
	private int po_pd_code; //상품코드
	private String po_state; // 배송상태
	private int po_count; // 주문수량
	private int po_price; // 총 가격
	private String po_addr; // 배송지
	private String po_at_name; // 공방명
	private String po_cm_id; // 이메일
	private String pi_oriname;
	private String pi_num; 
	private String pi_pd_code;
	private String po_pd_name;	// 상품명
	private String po_at_id;
	 
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp po_date;		//	주문 날짜
	private String po_date_simple;
	
}
