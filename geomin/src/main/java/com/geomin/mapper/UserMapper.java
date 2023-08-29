package com.geomin.mapper;

import java.util.List;

import com.geomin.vo.UserVO;

public interface UserMapper {

	public UserVO login(UserVO paramMember);

	public int insert(UserVO userVo);

	public List<UserVO> userList();
	
	public int idCheck(UserVO userVo);

	public List<UserVO> findId(String email);

	public void findId(UserVO userVo);

	public int updatePw(UserVO userVo);

	public UserVO findPw(UserVO userVo);

	public List<UserVO> userList(UserVO userVo);
	
	public int passwordEdit(UserVO userVo);
}
