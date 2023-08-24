package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@PostMapping(value="main.do")
	public String initMain() {
		return "/main";
	}
	
	@GetMapping("/intro")
	public String intro() {
		return "/intro";
	}
	
}
