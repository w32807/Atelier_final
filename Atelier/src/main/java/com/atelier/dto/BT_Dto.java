package com.atelier.dto;

import java.security.Timestamp;

import lombok.Data;

@Data
public class BT_Dto {
	
	private int bt_num;
	private String bt_cm_id;
	private String bt_at_name;
	private int bt_price;
	private int bt_count;
	private int bt_pd_code;
	private String pd_name;
	private String pi_oriname;
	private String pi_sysname;
}
