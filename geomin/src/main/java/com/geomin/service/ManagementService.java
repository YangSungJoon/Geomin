package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;

@Service
public interface ManagementService {

	public int insert(ContentVO contentVo);

	public void contentList(Model model);

	public List<SubScriptionVO> yearSaleList(String contentName);
	

}
