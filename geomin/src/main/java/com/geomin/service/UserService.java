package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.vo.UserVO;

@Service
public interface UserService {

	UserVO login(UserVO userVo);
	
	List<UserVO> userList(UserVO userVo);	

	int insert(UserVO userVo);

	int idCheck(UserVO userVo);

	List<UserVO> findId(String email);

	int updatePw(UserVO userVo);

	boolean checkUser(UserVO userVo);

	void sendTemporaryPasswordByEmail(String userEmail, String userName, String temporaryPassword);

	int passwordEdit(UserVO userVo);
}
