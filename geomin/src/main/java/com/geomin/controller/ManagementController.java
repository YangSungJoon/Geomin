package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.service.ManagementService;
import com.geomin.vo.ContentVO;

@RequestMapping("/management/*")
@Controller
public class ManagementController {
	
	@Autowired
	ContentService contentService;
	
	@Autowired
	ManagementService managementService;
	
	@GetMapping("learner_content")
	public String learner_content(Model model){
		managementService.contentList(model);
		return "/management/learner_content";
	}
	
	@GetMapping("announcement")
	public String announcement(Model model){
		managementService.contentList(model);
		return "/management/announcement";
	}
	
	@PostMapping("insert_content")
	public String insertContent(ContentVO contentVo, Model model) {
		System.out.println("contentVo" + contentVo);
		int result = managementService.insert(contentVo);
		
		if(result > 0) {
			model.addAttribute("insertSuccess", "true");
		}
		
		
		return "redirect:/management/learner_content";
	}
	
	
}
