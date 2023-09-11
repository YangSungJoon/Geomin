package com.geomin.vo;

import lombok.Data;

@Data
public class GroupJoinVO {
	
	private String user_id;
	private String user_id_learner;
	private String user_id_leader;
	private String group_id;
	private String content_id;
	private String learner_name;
	private String group_appdate; // 가입 신청 일자
	private String groupyn;
	
	// GroupVO 정보 추가
	private String group_name;
	private int group_personnel;
	private String learning_start;
	private String learning_end;
	
}
