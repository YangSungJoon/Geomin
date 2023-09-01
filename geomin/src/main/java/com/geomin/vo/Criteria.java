package com.geomin.vo;

import lombok.Data;

@Data
public class Criteria {

	private String searchField; // 검색조건
	private String searchWord;	// 검색어
	
	private String exercise_name; // 운동 이름
	private String dependsArray; // 정렬
	
	private String province;
	private String city;
	private String district;
	
	private String class_no;
	
	
	private int pageNo = 1;		// 요청 페이지 번호
	private int amount = 6; 	// 한페이지당 게시물수
	
	private int startNo = 1;
	private int endNo = 6;
	
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
	
}











