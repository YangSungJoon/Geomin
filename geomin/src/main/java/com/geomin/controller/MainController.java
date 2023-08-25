package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value="main.do")
	public String initMain() {
		return "main/main";
	}
	
	@GetMapping("/main/intro")
	public String intro() {
		return "main/intro";
	}
	
	@GetMapping("/main/guide")
	public String guide() {
		return "main/guide";
	}
}
