package com.geomin.vo;

import lombok.Data;

@Data
public class HomeWorkCriteria {

	private int pageNo = 1;		// 요청 페이지 번호
	private int amount = 10; 	// 한페이지당 게시물수
	
	private int startNo = 1;
	private int endNo = 10;
	
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
}
