package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.UserVO;

@Service
public interface GroupJoinService {
	
	public int groupAdd(GroupJoinVO groupjoinvo);
	
	public UserVO userInfo(String user_id);

	public int groupjoinAdd(GroupJoinVO groupjoinVO);
}
