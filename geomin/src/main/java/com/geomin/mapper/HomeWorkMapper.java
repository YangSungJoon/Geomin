package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.ContentVO;
import com.geomin.vo.HomeWorkCriteria;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.UserVO;

public interface HomeWorkMapper {
	
	//public List<HomeWorkVO> getList(HomeWorkVO vo);

	// 목록
	public List<HomeWorkVO> getList();
	
	// 유저 이름 조회
	public UserVO getUserName(String user_id);
	
	// 학습지도자 이름 조회
	public UserVO getLeaderName(String user_id);
	
	// 학습 콘텐츠 명 조회
	public ContentVO getContentName(String content_id);
}
