package com.geomin.mapper;

import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.UserVO;

public interface GroupJoinMapper {
	
	public int groupAdd(GroupJoinVO groupjoinvo);
	
	public UserVO userInfo(String user_id);
	
	// 가입 정보 조회
	public GroupJoinVO selectGroup(String group_id);
}
