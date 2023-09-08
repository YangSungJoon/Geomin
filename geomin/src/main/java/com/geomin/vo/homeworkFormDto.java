package com.geomin.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class homeworkFormDto {
	private String user_id_learner; // 학습자
	private String homework_deadline; // 제출 기한
	private String homework_subdate; // 숙제 제출 일자
	private String homework_content_learner; // 학습내용
	
	public homeworkFormDto(String homework_subdate, String homework_content_learner) {
		this.user_id_learner = user_id_learner;
		this.homework_subdate = homework_subdate;
		this.homework_content_learner = homework_content_learner;
		this.homework_deadline = homework_deadline;
	}
	
	@Override
	public String toString() {
		return "homeworkFormDto{" +
				"homework_subdate'" + homework_subdate + '\'' +
				"homework_content_learner ='" + homework_content_learner + '\'' + '}';
	}
}




