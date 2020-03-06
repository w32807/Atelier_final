package com.atelier.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RO_Dto {

	private int ro_num;
      private String ro_buyer;
      private String ro_type;
      private int ro_rm_num;
      private int ro_rm_price;
      private int ro_count;
      private String ro_state;
      
      @JsonFormat(pattern = "yyyy-MM-dd")
      private Timestamp ro_date;
      private String ro_dateSimple;
      
}
