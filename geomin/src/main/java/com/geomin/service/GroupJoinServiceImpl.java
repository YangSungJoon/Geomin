package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.mapper.GroupJoinMapper;
import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GroupJoinServiceImpl implements GroupJoinService {
	
	@Autowired
	private GroupJoinMapper groupjoinMapper;

	@Override
	public int groupAdd(GroupJoinVO groupjoinvo) {
		return groupjoinMapper.groupAdd(groupjoinvo);
	}

	@Override
	public UserVO userInfo(String user_id) {
		return groupjoinMapper.userInfo(user_id);
	}

	@Override
	public GroupJoinVO selectGroup(String group_id) {
		return groupjoinMapper.selectGroup(group_id);
	}

	@Override
	public List<GroupJoinVO> JoinGroupInfo(String user_id) {
		return groupjoinMapper.JoinGroupInfo(user_id);
	}
	
	@Override
	public List<GroupJoinVO> JoinGroupInfo2(String user_id) {
		return groupjoinMapper.JoinGroupInfo2(user_id);
	}

}
