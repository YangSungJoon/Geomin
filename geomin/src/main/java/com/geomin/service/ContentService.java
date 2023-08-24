package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;

@Service
public interface ContentService {

	public List<ContentVO> contentList(Model model);
	
	public int insertSubscription(GroupVO groupVO, Model model);
}
