package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.vo.ContentVO;
import com.geomin.vo.Criteria;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;

@Service
public interface ContentService {

	public List<ContentVO> contentList(SubScriptionVO subScriptionVO, Criteria cri, Model model);
	
	public int contentListCnt(SubScriptionVO subScriptionVO, Criteria cri);
	
	public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO, Criteria cri, Model model);
	
	public int subContentListCnt(SubScriptionVO subScriptionVO, Criteria cri);
	
	public List<SubScriptionVO> groupApproval(SubScriptionVO subScriptionVO, Criteria cri, Model model);

	public int groupApprovalCnt(SubScriptionVO subScriptionVO, Criteria cri);
	
	public List<SubScriptionVO> myGroup(SubScriptionVO subScriptionVO, Criteria cri, Model model);

	public int myGroupCnt(SubScriptionVO subScriptionVO, Criteria cri);
	
	public List<SubScriptionVO> homeworkEval(SubScriptionVO subScriptionVO, Criteria cri, Model model);

	public int homeworkEvalCnt(SubScriptionVO subScriptionVO, Criteria cri);
	
	
	public List<SubScriptionVO> option_content_id(SubScriptionVO subScriptionVO, Model model);

	public List<SubScriptionVO> homework_option(SubScriptionVO subScriptionVO, Model model);
	
	
	
	
	
	public int insertgroup(SubScriptionVO subScriptionVO, Model model);
	
	public int insertSubContent(SubScriptionVO subScriptionVO, Model model);
	
	public int payStatusUpdate(SubScriptionVO subScriptionVO);
	
	public int insertContentPay(SubScriptionVO subScriptionVO);
	
	public int deletePay(SubScriptionVO subScriptionVO);
	
	public int updateGroupyn(SubScriptionVO subScriptionVO);

	public int add_current(SubScriptionVO subScriptionVO);
	
	public int delGroup(SubScriptionVO subScriptionVO);

	public int homework_add(SubScriptionVO subScriptionVO);

	public int updateEvaluation(SubScriptionVO subScriptionVO);

	
	

	
	
}
