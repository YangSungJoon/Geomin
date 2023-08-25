package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.LearnerGroupVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

@Service
public interface ContentService {

	public List<ContentVO> contentList(Model model);
	
	public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO, Model model);
	
	public List<LearnerGroupVO> learnerGroup(Model model);
	
	public int insertgroup(GroupVO groupVO, Model model);
	
	public int insertSubContent(SubScriptionVO subScriptionVO, Model model);
	
	public int payStatusUpdate(SubScriptionVO subScriptionVO);
	
	public int insertContentPay(SubScriptionVO subScriptionVO);
	
	public int deletePay(SubScriptionVO subScriptionVO);
	
}
