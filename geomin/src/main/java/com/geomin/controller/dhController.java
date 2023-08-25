package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geomin.service.HomeWorkService;
import com.geomin.vo.HomeWorkCriteria;
import com.geomin.vo.HomeWorkVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class dhController {
	
	@Autowired
	private HomeWorkService homeworkService;
	
//	@GetMapping("/homework_send/{user_id_learner}")
//	public String homework_send(@PathVariable("user_id_learner") String user_id_learner, Model model) {
//		
//		// 화면에 전달
//		model.addAttribute("home", homeworkService.getList(user_id_learner));
//		
//		return "/homework_send";
//	}
	
	@GetMapping("/homework_send")
	public void getList(String user_id, String content_id, Model model) {
		log.info("숙제 목록----------");
		
		model.addAttribute("list", homeworkService.getList());
		model.addAttribute("learner", homeworkService.getUserName(user_id));
		model.addAttribute("leader", homeworkService.getLeaderName(user_id));
		model.addAttribute("content", homeworkService.getContentName(content_id));
	}
	
}
