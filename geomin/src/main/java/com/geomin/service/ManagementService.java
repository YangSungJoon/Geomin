package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.vo.ContentVO;

@Service
public interface ManagementService {

	public int insert(ContentVO contentVo);
}
