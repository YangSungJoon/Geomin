package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.UserVO;

public interface GroupJoinMapper {
	
	public int groupAdd(GroupJoinVO groupjoinvo);
	
	public UserVO userInfo(String user_id);
	
	// 가입 정보 조회
	public GroupJoinVO selectGroup(String group_id);
	
	// 가입된 그룹 정보 조회
	public List<GroupJoinVO> JoinGroupInfo(String user_id);
	
	// 승인 대기 중 그룹 정보 조회
	public List<GroupJoinVO> JoinGroupInfo2(String user_id);
	
}
