package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.GroupVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/group/*")
@Controller
@Log4j
public class GroupController {

	@Autowired
	ContentService contentService;

	@GetMapping("groupAdd")
	public String group(String userid,Model model){
		contentService.contentList(model);
		
		
		return "/group/groupAdd";
	}
	
	
	
	@PostMapping("groupAdd")
	public void insertgroup(GroupVO groupVO, Model model) {
		
		contentService.insertgroup(groupVO, model);
		contentService.contentList(model);
		
	}
	
	
	@GetMapping("groupApproval")
	public String groupApproval() {
		return "group/groupApproval";
	}
	
}
