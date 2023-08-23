package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.UserVO;

public interface UserMapper {

	public UserVO login(UserVO paramMember);

	public int insert(UserVO userVo);

	public List<UserVO> userList();

}
