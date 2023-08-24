package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {
	
	@GetMapping("/content_request")
	public String contentRequest() {
		return "/content_request";
	}
	
	@GetMapping("/group_appro")
	public String group_appro() {
		return "/group_appro";
	}
	
	@GetMapping("/guide")
	public String guide() {
		return "/guide";
	}
	
	@GetMapping("/homework_send")
	public String homework_send() {
		return "/homework_send";
	}
	
	@GetMapping("/study_content_add")
	public String study_content_add() {
		return "/study_content_add";
	}
	
	@GetMapping("/study_group_add")
	public String study_group_add() {
		return "/study_group_add";
	}
	
	@GetMapping("/study_group_join")
	public String study_group_join() {
		return "/study_group_join";
	}
}
