package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.vo.UserVO;

@Service
public interface UserService {

	UserVO login(UserVO userVo);

	int insert(UserVO userVo);

}
