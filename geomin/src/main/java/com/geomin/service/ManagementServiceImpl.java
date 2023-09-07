package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.ManagementMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.SaleVO;
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
		List<ContentVO> contentList = managementMapper.contentList();
		model.addAttribute("contentList", contentList);
	}
	
	public ContentVO contentListView(String contentId) {
		return managementMapper.contentListView(contentId);
	}

	@Override
	public List<SaleVO> yearSaleList(String content_id) {
		System.out.println("content_id : " + content_id);
	    return managementMapper.yearSaleList(content_id);
	}

	@Override
	public List<SaleVO> monthSaleList(String content_id, String year) {
		
	    return managementMapper.monthSaleList(content_id, year);
	}

	@Override
	public int emailEdit(UserVO userVo) {
		return managementMapper.emailEdit(userVo);
	}

	@Override
	public int contentUpdate(ContentVO contentVo) {
		return managementMapper.contentUpdate(contentVo);
	}

	@Override
	public int contentDelete(ContentVO contentVo) {
		return managementMapper.contentDelete(contentVo);
	}

	@Override
	public List<SubScriptionVO> contentSelect() {
		
		return managementMapper.contentSelect();
	}
	
}
