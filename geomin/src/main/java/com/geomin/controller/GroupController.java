package com.geomin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.Criteria;
import com.geomin.vo.GroupVO;
import com.geomin.vo.PageDto;
import com.geomin.vo.SubScriptionVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/group/*")
@Controller
@Log4j
public class GroupController {

	@Autowired
	ContentService contentService;

	@GetMapping("groupAdd")
	public String group(SubScriptionVO subScriptionVO,String userid,Model model){
		
		System.err.println("user_id : ========================" + subScriptionVO.getUser_id());
		contentService.option_content_id(subScriptionVO, model);
		
		
		
		return "/group/groupAdd";
	}


	
	@PostMapping("groupAdd")
	public String insertgroup(SubScriptionVO subScriptionVO,Criteria cri, Model model, HttpSession session) {

		if(subScriptionVO.getGroup_name() != "" && 
				subScriptionVO.getGroup_personnel() != "" && 
				subScriptionVO.getLearning_start() != "" &&
				subScriptionVO.getLearning_end() != "") {
			contentService.insertgroup(subScriptionVO, model);
			
			subScriptionVO.setUser_id(session.getAttribute("userId").toString());
			
			contentService.option_content_id(subScriptionVO, model);
			
			System.out.println("getUser_id : ===============" + session.getAttribute("userId").toString());
			System.out.println("getGroup_personnel : ============" + subScriptionVO.getGroup_personnel());
			System.out.println("getGroup_name : ===============" + subScriptionVO.getGroup_name());
			System.out.println("getContent_id : ============" + subScriptionVO.getContent_id());
			System.out.println("getLearning_start : ===============" + subScriptionVO.getLearning_start());
			System.out.println("getLearning_end : ===============" + subScriptionVO.getLearning_end());
			
			
			System.out.println("성공=========================");
			
			return "group/groupAdd";
			
		} else {
			System.out.println("getUser_id : ===============" + session.getAttribute("userId").toString());
			System.out.println("getGroup_personnel : ============" + subScriptionVO.getGroup_personnel());
			System.out.println("getGroup_name : ===============" + subScriptionVO.getGroup_name());
			System.out.println("getContent_id : ============" + subScriptionVO.getContent_id());
			System.out.println("getLearning_start : ===============" + subScriptionVO.getLearning_start());
			System.out.println("getLearning_end : ===============" + subScriptionVO.getLearning_end());
			
			subScriptionVO.setUser_id(session.getAttribute("userId").toString());
			
			
			contentService.option_content_id(subScriptionVO, model);
			
			System.out.println("실패=========================");
			
			return "group/groupAdd";
		}
		
		
	}
	
	
	@GetMapping("groupApproval")
	public String groupApproval(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		System.out.println("user_id : ===================================" +  subScriptionVO.getUser_id());
		
		contentService.option_content_id(subScriptionVO, model);
		contentService.groupApproval(subScriptionVO,cri, model);

		int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		
		return "group/groupApproval";
	}
	
	
	@PostMapping("Approval")
	public String updateGroupyn(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		System.out.println("content_id: ===================================" +  subScriptionVO.getContent_id());
		
		System.out.println("total_personnel : ======================" + subScriptionVO.getTotal_personnel());
		System.out.println("current_personnel : ======================" + subScriptionVO.getCurrent_personnel());
		
		
		if(subScriptionVO.getCurrent_personnel() < subScriptionVO.getTotal_personnel()) {
			System.out.println("현재인원 < 총인원");
			int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			
			contentService.updateGroupyn(subScriptionVO);
			contentService.add_current(subScriptionVO);
			
			contentService.groupApproval(subScriptionVO, cri, model);
			
			model.addAttribute("pageDto", pageDto);
			
			return "group/groupApproval";
		} else {
			
			System.out.println("현재인원 >= 총인원");
			int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			
			contentService.groupApproval(subScriptionVO, cri, model);
			
			model.addAttribute("pageDto", pageDto);
			
			return "group/groupApproval";
		}
		
	}
	
	
	@GetMapping("myGroup")
	public String myGroup(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		
		int cnt = contentService.myGroupCnt(subScriptionVO, cri);
		
		PageDto pageDto = new PageDto(cri, cnt);

		contentService.myGroup(subScriptionVO, cri,  model);
		
		model.addAttribute("pageDto", pageDto);
		
		return "group/myGroup";
	}
	
	
	@PostMapping("delGroup")
	public String delGroup(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		
		System.err.println("group_id : =================================" + subScriptionVO.getGroup_id());
		
		if(subScriptionVO.getGroup_id() != null) {
			int cnt = contentService.myGroupCnt(subScriptionVO, cri);
			
			PageDto pageDto = new PageDto(cri, cnt);
			
			contentService.delGroup(subScriptionVO);
			contentService.myGroup(subScriptionVO, cri, model);
			
			model.addAttribute("pageDto", pageDto);
			
			return "group/myGroup";
			
		} else {
			int cnt = contentService.myGroupCnt(subScriptionVO, cri);
			
			PageDto pageDto = new PageDto(cri, cnt);
			
			contentService.myGroup(subScriptionVO, cri, model);
			
			model.addAttribute("pageDto", pageDto);
			
			return "group/myGroup";
		}
		
	}
	
}
