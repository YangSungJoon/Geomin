package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/content/*")
@Controller
@Log4j
public class ContentController {

	@Autowired
	ContentService contentService;
	
	@GetMapping("contentList")
	public void contentList(Model model) {
		
		// 마지막 테스트
		
		contentService.contentList(model);
	}
	
}
