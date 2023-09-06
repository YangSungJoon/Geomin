package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.UserVO;

@Service
public interface GroupJoinService {
	
	public int groupAdd(GroupJoinVO groupjoinvo);
	
	public UserVO userInfo(String user_id);
	
	// 가입 정보 조회
	public GroupJoinVO selectGroup(String group_id);
}
