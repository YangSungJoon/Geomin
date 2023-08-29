package com.geomin.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;

@Service
public interface ManagementService {

	public int insert(ContentVO contentVo);

	public void contentList(Model model);
}
