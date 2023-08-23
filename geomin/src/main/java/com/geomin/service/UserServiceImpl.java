package com.geomin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.geomin.mapper.UserMapper;
import com.geomin.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public UserVO login(UserVO paramMember) {
	    // 사용자 정보 조회
		UserVO userVo = userMapper.login(paramMember);

	    if (userVo != null) {
	        // 사용자가 입력한 비밀번호와 데이터베이스에 저장된 비밀번호 비교
	        // 암호화된 비밀번호와 사용자가 입력한 비밀번호를 비교
	    	boolean res = 
					encoder.matches(paramMember.getUser_pw(), userVo.getUser_pw());	
			         // 비밀번호가 일치하면 로그인 성공
	    	if(res) {
			 return userVo; // 로그인 성공
	        }
	    }
	   

	    // 비밀번호가 일치하지 않으면 로그인 실패
	    return null;
	}
	
	@Override
	public int insert(UserVO userVo) {
	    // 비밀번호 암호화
		userVo.setUser_pw(encoder.encode(userVo.getUser_pw()));

	    // 회원 정보를 DB에 저장
	    int res = userMapper.insert(userVo);
	    return res > 0 ? 1 : 0; // 1: 회원가입 성공, 0: 회원가입 실패
	}
	
}
