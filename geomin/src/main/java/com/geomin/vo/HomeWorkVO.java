package com.geomin.vo;

import lombok.Data;

@Data
public class HomeWorkVO {

	private String homework_id; // 숙제 일련번호
	private String group_id; // 그룹 id
	private String content_id; // 학습 콘텐츠 id
	private String content_name; // 콘텐츠 명
	private String user_id_leader; // 학습지도자 회원 id
	private String user_id_learner; // 학습자 회원 id
	
	private String homework_deadline; // 숙제 제출 기한
	private String homework_content_leader; // 숙제 내용 (지도자가 입력 한)
	private String homework_subdate; // 숙제 제출 일자
	private String homework_content_learner; // 학습 내용(학습자가 학습 한)
	private String evaluation; // 학습관리자 평가 ('우수', '보통', '미흡')
	
//	private String user_id;
//	private String user_name;
//	private String user_type;
	
	private String searchField; // 검색조건
	private String searchWord;	// 검색어
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_type;
	private String phonenumber;
	private String email;
	private String address;
	private String datebirth;
	private String gender;
}
