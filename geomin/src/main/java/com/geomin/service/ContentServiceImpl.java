package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.ContentMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.LearnerGroupVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

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
	
	
	@Override
	public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO, Model model){
		
		List<SubScriptionVO> list = contentMapper.subContentList(subScriptionVO);
		
		System.out.println("list : " +  list);
		
		model.addAttribute("subContentList", list);
		
		return null;
		
	}
	
	@Override
	public List<LearnerGroupVO> learnerGroup(Model model){
		List<LearnerGroupVO> list = contentMapper.learnerGroup();
		
		model.addAttribute("learnerGroup", list);
		
		return null;
		
	}
	

	
	@Override
	public int insertgroup(GroupVO groupVO, Model model) {
		
		int res = contentMapper.insertgroup(groupVO);
		
		model.addAttribute("GroupVO", groupVO);
		return res;
	}
	
	
	@Override
	public int insertSubContent(SubScriptionVO subScriptionVO, Model model) {
		
		int res = contentMapper.insertSubContent(subScriptionVO);
		
		model.addAttribute("subScriptionVO", subScriptionVO);
		
		return res;
		
	}
	
	
	@Override
	public int payStatusUpdate(SubScriptionVO subScriptionVO) {
		
		int res = contentMapper.payStatusUpdate(subScriptionVO);
		
		
		return res;
		
	}
	
	@Override
	public int insertContentPay(SubScriptionVO subScriptionVO) {
		
		int res = contentMapper.insertContentPay(subScriptionVO);
		
		return res;
		
	}
	
	
	@Override
	public int deletePay(SubScriptionVO subScriptionVO) {
		
		int res = contentMapper.deletePay(subScriptionVO);
		
		return res;
		
	}
	
}
