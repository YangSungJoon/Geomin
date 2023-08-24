package com.geomin.vo;

import lombok.Data;

@Data
public class SubScriptionVO {

	private String content_id;
	private String content_name;
	private String user_id;
	private String learning_difficulty;
	private String learning_member;
	private String price;
	private String sale;
	private String real_price;
	private String learning_content;
	
	private String subscription_date;
	private int subscription_price;
	private int total_personnel;
	private int current_personnel;
	private String paystatus;
	
	
}
