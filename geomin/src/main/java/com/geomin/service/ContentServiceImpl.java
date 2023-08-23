package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.ContentMapper;
import com.geomin.vo.ContentVO;

@Service
public class ContentServiceImpl implements ContentService{

	@Autowired
	private ContentMapper contentMapper;
	
	@Override
	public List<ContentVO> contentList(Model model){
		
		List<ContentVO> list = contentMapper.contentList();
		
		model.addAttribute("contentList", list);
		
		return null;
	}
	
}
