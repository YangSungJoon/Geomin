package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/group/*")
@Controller
@Log4j
public class GroupController {

	@Autowired
	ContentService contentService;

	@GetMapping("groupAdd")
	public String group(ContentVO contentVO, String userid,Model model){
		contentService.contentList(contentVO, model);
		
		
		return "/group/groupAdd";
	}

	
	@GetMapping("myGroup")
	public String myGroup(Model model, SubScriptionVO subScriptionVO){
		
		contentService.subContentList(subScriptionVO, model);
		
		return "/group/myGroup";
	}
	
	
	
	@PostMapping("groupAdd")
	public void insertgroup(ContentVO contentVO, GroupVO groupVO, Model model) {
		
		contentService.insertgroup(groupVO, model);
		contentService.contentList(contentVO, model);
		
	}
	
	
	@GetMapping("groupApproval")
	public String groupApproval(SubScriptionVO subScriptionVO, Model model) {
		System.out.println("user_id : ===================================" +  subScriptionVO.getUser_id());
		
		contentService.option_content_id(subScriptionVO, model);
		contentService.groupApproval(subScriptionVO, model);

		return "group/groupApproval";
	}
	
	
	@PostMapping("Approval")
	public String updateGroupyn(SubScriptionVO subScriptionVO, Model model) {
		System.out.println("content_id: ===================================" +  subScriptionVO.getContent_id());
		
		contentService.updateGroupyn(subScriptionVO);
		contentService.add_current(subScriptionVO);
		
		contentService.groupApproval(subScriptionVO, model);
	
		return "group/groupApproval";
	}
	
}
