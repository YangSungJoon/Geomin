package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.SubScriptionVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/homework_t/*")
@Controller
@Log4j
public class homework_tController {

	
	@Autowired
	ContentService contentService;

	
	
	@GetMapping("homework_add")
	public String homework_add(SubScriptionVO subScriptionVO, Model model) {
		
		System.out.println("user_id : ==========================" + subScriptionVO.getUser_id());
		
		contentService.groupApproval(subScriptionVO, model);
		
		return "/homework_t/homework_add";
	}
	
	@GetMapping("groupName")
	public String groupApproval(SubScriptionVO subScriptionVO, Model model) {
		System.out.println("user_id : ===================================" +  subScriptionVO.getUser_id());
		
		contentService.option_content_id(subScriptionVO, model);
		contentService.groupApproval(subScriptionVO, model);

		return "homework_t/homework_add";
	}
	
	
	@PostMapping("homework_add")
	public String homework_add1(SubScriptionVO subScriptionVO, Model model) {
		
		System.out.println("getGroup_id : =====================" + subScriptionVO.getGroup_id());
		System.out.println("getUser_id_leader : =====================" + subScriptionVO.getUser_id_leader());
		System.out.println("getUser_id_learner : =====================" + subScriptionVO.getUser_id_learner());
		System.out.println("getContent_id : =====================" + subScriptionVO.getContent_id());
		System.out.println("getHomework_deadline : =====================" + subScriptionVO.getHomework_deadline());
		System.out.println("getHomework_content_leader : =====================" + subScriptionVO.getHomework_content_leader());
		System.out.println("getHomework_content_leader : =====================" + subScriptionVO.getHomework_content_leader());
		System.out.println("getHomework_no : =====================" + subScriptionVO.getHomework_no());
		
		
		contentService.homework_add(subScriptionVO);
		contentService.groupApproval(subScriptionVO, model);
		
		return "homework_t/homework_add";
	}
	
	
	@GetMapping("homework_evaluation")
	public String homeworkEval(SubScriptionVO subScriptionVO, Model model) {
		
		
		contentService.homeworkEval(subScriptionVO, model);
		
		return "homework_t/homework_evaluation";
		
	}
	
	@PostMapping("updateEvaluation")
	public String updateEvaluation(SubScriptionVO subScriptionVO, Model model) {
		
		System.out.println("getHomework_no : ==============================" +  subScriptionVO.getHomework_no());
		System.out.println("getEvaluation : ==============================" +  subScriptionVO.getEvaluation());
		
		
		contentService.updateEvaluation(subScriptionVO);
		contentService.homeworkEval(subScriptionVO, model);
		
		return "homework_t/homework_evaluation";
		
	}
	
}
