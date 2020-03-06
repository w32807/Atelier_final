package com.atelier.dto;

import org.omg.CORBA.PRIVATE_MEMBER;

import lombok.Data;

@Data
public class PD_productDto {

	private int pd_code;
	private String pd_name;
	private int pd_price;
	private String pd_detail;
	private String pd_at_name;
	private String pd_option;
	private String pd_regist;
	private String pd_regdate;
	private String pd_cate;
	private String pd_type;
	private String pd_sex;
	private int pd_numofstock;
	private String pd_at_id;
	
	private String imgOriName;
	private String pi_oriname;
	
}
