package com.atelier.dto;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FT_FAQDto {

	private int ft_num;
	private String ft_title;
	private String ft_contents;
	private String ft_id;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp ft_regdate;
	private String ft_date;
	
}
