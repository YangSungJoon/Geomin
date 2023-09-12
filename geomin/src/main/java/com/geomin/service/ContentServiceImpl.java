package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.geomin.mapper.ContentMapper;
import com.geomin.vo.ContentVO;
import com.geomin.vo.Criteria;
import com.geomin.vo.SubScriptionVO;

@Service
public class ContentServiceImpl implements ContentService{

	@Autowired
	private ContentMapper contentMapper;
	
	@Override
	public List<ContentVO> contentList(SubScriptionVO subScriptionVO,Criteria cri, Model model){
		
		List<ContentVO> list = contentMapper.contentList(subScriptionVO.getLearning_difficulty(), cri.getStartNo(), cri.getEndNo());
		
		int totalCnt = contentMapper.contentListCnt(subScriptionVO.getLearning_difficulty(), cri.getStartNo(), cri.getEndNo());
		
		//model.addAttribute("learning_difficulty", subScriptionVO.getLearning_difficulty());
		
		  model.addAttribute("totalCnt", totalCnt);
		
		return list;
	}
	
	
	@Override
	public List<SubScriptionVO> subContentList(SubScriptionVO subScriptionVO,Criteria cri, Model model){
		
		
		
		List<SubScriptionVO> list = contentMapper.subContentList(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
		
		System.out.println("list : " +  list);
		
		int totalCnt = contentMapper.subContentListCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
		
		model.addAttribute("subContentList", list);
		model.addAttribute("subTotalCnt", totalCnt);
		
		return list;
		
	}
	
	@Override
	public List<SubScriptionVO> groupApproval(SubScriptionVO subScriptionVO, Criteria cri, Model model){
		List<SubScriptionVO> list = contentMapper.groupApproval(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo(), subScriptionVO.getContent_name(), subScriptionVO.getGroupyn());
		
		int total = contentMapper.groupApprovalCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo(), subScriptionVO.getContent_name(), subScriptionVO.getGroupyn());
		
		model.addAttribute("groupyn", subScriptionVO.getGroupyn());
		
		model.addAttribute("content_name",subScriptionVO.getContent_name());
		
		model.addAttribute("groupApproval", list);
		
		return list;
		
	}

	
	@Override
	public List<SubScriptionVO> homework_add_list(SubScriptionVO subScriptionVO, Criteria cri, Model model){
		
		List<SubScriptionVO> list = contentMapper.homework_add_list(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo(), subScriptionVO.getContent_name(), subScriptionVO.getGroupyn());
		
		int total = contentMapper.homework_add_list_Cnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo(), subScriptionVO.getContent_name(), subScriptionVO.getGroupyn());
		
		model.addAttribute("groupyn", subScriptionVO.getGroupyn());
		
		model.addAttribute("content_name",subScriptionVO.getContent_name());
		
		model.addAttribute("homework_add_list", list);
		
		model.addAttribute("total", total);
		
		return null;
	}
	
	

	@Override
	public List<SubScriptionVO> option_content_id(SubScriptionVO subScriptionVO, Model model){
		
		List<SubScriptionVO> list = contentMapper.option_content_id(subScriptionVO);
		
		model.addAttribute("option_content_id", list);
		
		return null;
		
	}
	
	@Override
	public List<SubScriptionVO> myGroup(SubScriptionVO subScriptionVO, Criteria cri, Model model){
		
		List<SubScriptionVO> list = contentMapper.myGroup(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
		
		
		
		 
		model.addAttribute("group_id", subScriptionVO.getGroup_id());
		model.addAttribute("myGroup", list);
		
		return null;
	}
	
	@Override
	public List<SubScriptionVO> homeworkEval(SubScriptionVO subScriptionVO, Criteria cri, Model model){
		
		List<SubScriptionVO> list = contentMapper.homeworkEval(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
		
		 
		model.addAttribute("homeworkEval", list);
		
		return null;
	}

	@Override
	public List<SubScriptionVO> homework_option(SubScriptionVO subScriptionVO,Model model){
		
		List<SubScriptionVO> list = contentMapper.homework_option(subScriptionVO);
		
		
		model.addAttribute("homework_option", list);
		
		return null;
	}
	
	
	
	@Override
	public int insertgroup(SubScriptionVO subScriptionVO, Model model) {
		
		int res = contentMapper.insertgroup(subScriptionVO);
		
		model.addAttribute("GroupVO", subScriptionVO);
		return res;
	}
	
	
	@Override
	public int insertSubContent(SubScriptionVO subScriptionVO, Model model) {
		
		int res = contentMapper.insertSubContent(subScriptionVO);
		
		model.addAttribute("subScriptionVO", subScriptionVO);
		model.addAttribute("content_id", subScriptionVO.getContent_id());
		
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
	
	@Override
	public int updateGroupyn(SubScriptionVO subScriptionVO) {
		
		int res = contentMapper.updateGroupyn(subScriptionVO);
		
		return res;
	}
	
	@Override
	public int add_current(SubScriptionVO subScriptionVO) {
	
		int res = contentMapper.add_current(subScriptionVO);
		
		return res;
		
	}
	
	@Override
	public int delGroup(SubScriptionVO subScriptionVO) {
		int res = contentMapper.delGroup(subScriptionVO);
		
		return res;
	}
	
	
	@Override
	public int homework_add(SubScriptionVO subScriptionVO) {
		int res = contentMapper.homework_add(subScriptionVO);
		
		return res;
	}

	@Override
	public int updateEvaluation(SubScriptionVO subScriptionVO) {
		int res = contentMapper.updateEvaluation(subScriptionVO);
		
		return res;
	}
	
	@Override
	public int personReset(SubScriptionVO subScriptionVO) {
		int res = contentMapper.personReset(subScriptionVO);
		
		return res;
	}
	
	@Override
	public int contentListCnt(SubScriptionVO subScriptionVO,Criteria cri) {
		return contentMapper.contentListCnt(subScriptionVO.getLearning_difficulty(), cri.getStartNo(), cri.getEndNo());
	}
	
	@Override
	public int subContentListCnt(SubScriptionVO subScriptionVO, Criteria cri) {
		return contentMapper.subContentListCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
	}

	@Override
	public int groupApprovalCnt(SubScriptionVO subScriptionVO, Criteria cri) {
		return contentMapper.groupApprovalCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo(), subScriptionVO.getContent_name(),subScriptionVO.getGroupyn());
	}

	@Override
	public int myGroupCnt(SubScriptionVO subScriptionVO, Criteria cri) {
		return contentMapper.myGroupCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
	}

	@Override
	public int homeworkEvalCnt(SubScriptionVO subScriptionVO, Criteria cri) {
		return contentMapper.homeworkEvalCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
	}
	
	@Override
	public int homework_add_list_Cnt(SubScriptionVO subScriptionVO, Criteria cri) {
		return contentMapper.homeworkEvalCnt(subScriptionVO.getUser_id(), cri.getStartNo(), cri.getEndNo());
	}
	

}
