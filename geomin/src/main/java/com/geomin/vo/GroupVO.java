package com.geomin.vo;

import lombok.Data;

@Data
public class GroupVO {

	private String group_id;
	private String user_id_leader;
	private String content_id;
	private String group_name;
	private int group_personnel;
	private String learning_start;
	private String learning_end;
	
	
}
