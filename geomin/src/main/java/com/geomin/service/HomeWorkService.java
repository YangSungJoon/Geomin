package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.HomeWorkCriteria;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.UserVO;

@Service
public interface HomeWorkService {
	
	//public List<HomeWorkVO> getList(HomeWorkVO vo, Model model);

	// 목록 조회
	public List<HomeWorkVO> getList(String user_id);
	
	// 학습자 이름 조회
	public UserVO getUserName(String user_id);
	
	// 학습지도자 이름 조회
	public HomeWorkVO getLeaderName(String user_id);
	
	// 학습 콘텐츠 명 조회
	public ContentVO getContentName(String content_id);
	
	// 그룹 정보 조회
	public List<GroupVO> getGroupInfo();
	
	// 그룹 id 조회
	public GroupVO getGroupId(String group_id);
}
