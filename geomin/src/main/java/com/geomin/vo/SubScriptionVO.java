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
	
	private String group_name;
	private String learner_name;
	private String group_appdate;
	private String groupyn;
	private String user_id_leader;
	private String user_id_learner;
	
	private String group_id;
	private String group_personnel;
	private String learning_start;
	private String learning_end;
	
	
	private String homework_content_leader;
	private String homework_deadline;
	private String homework_no;
	
	private String user_name;
	private String homework_content_learner;
	private String homework_subdate;
	private String evaluation;
	
	private String user_type;
	

	
}
