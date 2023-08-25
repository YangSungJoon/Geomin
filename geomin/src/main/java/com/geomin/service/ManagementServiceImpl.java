package com.geomin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.mapper.ManagementMapper;
import com.geomin.vo.ContentVO;

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
	
	
	
}
