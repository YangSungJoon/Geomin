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
}
