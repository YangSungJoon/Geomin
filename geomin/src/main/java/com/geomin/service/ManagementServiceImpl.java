package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.ManagementMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

@Service
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	ManagementMapper managementMapper;

	@Override
	public int insert(ContentVO contentVo) {
		// 패키지 정보를 DB에 저장
	    int res = managementMapper.insert(contentVo);
	    return res > 0 ? 1 : 0; // 1: 성공, 0: 실패
	}

	@Override
	public void contentList(Model model) {
		
	}

	@Override
	public List<SubScriptionVO> yearSaleList(String contentName) {
		System.out.println("contentName : " + contentName);
	    return managementMapper.yearSaleList(contentName);
	}

	@Override
	public List<SubScriptionVO> monthSaleList(String contentName, String year) {
		
	    return managementMapper.monthSaleList(contentName, year);
	}

	@Override
	public int emailEdit(UserVO userVo) {
		// TODO Auto-generated method stub
		return managementMapper.emailEdit(userVo);
	}
	
}
