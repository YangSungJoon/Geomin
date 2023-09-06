package com.geomin.vo;

import lombok.Data;

@Data
public class ContentVO {

	private String content_id;
	private String content_name;
	private String user_id;
	private String learning_difficulty;
	private String learning_member;
	private int price;
	private String sale;
	private String real_price;
	private String learning_content;
	private String is_deleted;
	
	private String learning_difficulty_str;
	
	public void setLearning_difficulty_str() {
		
		switch (this.learning_difficulty) {
		case "1":
			this.learning_difficulty_str= "초급";
			break;
		case "2":
			this.learning_difficulty_str= "중급";
			break;
		case "3":
			this.learning_difficulty_str= "고급";
			break;
		default:
			this.learning_difficulty_str= "기타";
			break;
		}
		
		
	}
}
