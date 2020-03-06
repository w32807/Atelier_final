package com.atelier.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PR_Dto {
	
	private int pr_num;
	private int pr_pd_code;
	private String pr_cm_id;
	private String pr_cm_nick;
	private int pr_star;
	private String pr_contents;
 
	@JsonFormat(pattern = "yyyy-MM-dd")
    private Timestamp pr_date;
    private String pr_dateSimple;
    
    //댓글의 프로필 사진을 가져오기 위한 변수
    private String pr_cm_pfphoto;
    
}