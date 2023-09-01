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
	
//	@Override
//	public String toString() {
//		return "GroupJoinVO [user_id=" + user_id + ", user_id_learner=" + user_id_learner + ", user_id_leader=" + user_id_leader + ", group_id=" + group_id + ", content_id=" + content_id + ", learner_name=" + learner_name + ", group_appdate=" + group_appdate + ", groupyn=" + groupyn + "]";
//	}
}
