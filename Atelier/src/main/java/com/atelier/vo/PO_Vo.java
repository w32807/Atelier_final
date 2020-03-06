
package com.atelier.vo;



import java.sql.Timestamp;
import com.atelier.dto.CM_Dto;
import com.atelier.dto.PD_productDto;
import com.atelier.dto.PO_Dto;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PO_Vo {

	//주문 테이블의 VO
	private int po_num; //주문번호
	private int po_pd_code; //상품코드
	private String po_state; // 배송상태
	private int po_count; // 주문수량
	private int po_price; // 가격
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp po_date; // 주문날짜
	private String po_addr; // 배송지
	private String po_at_name; // 공방명
	private String po_cm_id; // 이메일
	private String pi_oriname;
	private String pi_num; 
	private String converedPo_date;
	 
	
	//회원 테이블의 회원 이름
	private String cm_name;// 주문자 이름
	
	//상품 테이블의 상품 이름 및 옵션
	private String pd_name;//상품 이름
	private String pd_option;//상품 옵션

	
	//2020.02.14 추가 생성 변수
	private String po_at_id;//공방 이메일
	private String receiverName;//받는사람 이름
	private String receiverPhone;//받는사람 전화번호
	

}
