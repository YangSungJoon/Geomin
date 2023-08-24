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

@RequestMapping("/content/*")
@Controller
@Log4j
public class ContentController {

	@Autowired
	ContentService contentService;
	
	@GetMapping("contentList")
	public void contentList(Model model) {
		
		
		contentService.contentList(model);
	}
	
	@GetMapping("group")
	public String group(Model model){
		contentService.contentList(model);
		return "/content/group";
	}
	
	
	@PostMapping("group")
	public void insertSubscription(GroupVO groupVO, Model model) {
		
		contentService.insertSubscription(groupVO, model);
		contentService.contentList(model);
		
	}
}
