package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.Criteria;
import com.geomin.vo.PageDto;
import com.geomin.vo.SubScriptionVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/homework_t/*")
@Controller
@Log4j
public class homework_tController {

	
	@Autowired
	ContentService contentService;

	
	
	@GetMapping("homework_add")
	public String homework_add(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		
		System.out.println("user_id : ==========================" + subScriptionVO.getUser_id());
		
		contentService.groupApproval(subScriptionVO, cri,  model);
		contentService.homework_option(subScriptionVO, model);
		
		int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		
		return "/homework_t/homework_add";
	}
	
	@GetMapping("groupName")
	public String groupApproval(SubScriptionVO subScriptionVO, Criteria cri,  Model model) {
		System.out.println("user_id : ===================================" +  subScriptionVO.getUser_id());
		
		contentService.option_content_id(subScriptionVO, model);
		contentService.groupApproval(subScriptionVO, cri,  model);

		return "homework_t/homework_add";
	}
	
	
	@PostMapping("homework_add")
	public String homework_add1(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		
		System.out.println("getGroup_id : =====================" + subScriptionVO.getGroup_id());
		System.out.println("getUser_id_leader : =====================" + subScriptionVO.getUser_id_leader());
		System.out.println("getUser_id_learner : =====================" + subScriptionVO.getUser_id_learner());
		System.out.println("getContent_id : =====================" + subScriptionVO.getContent_id());
		System.out.println("getHomework_deadline : =====================" + subScriptionVO.getHomework_deadline());
		System.out.println("getHomework_content_leader : =====================" + subScriptionVO.getHomework_content_leader());
		System.out.println("getHomework_content_leader : =====================" + subScriptionVO.getHomework_content_leader());
		System.out.println("getHomework_no : =====================" + subScriptionVO.getHomework_no());
		
		
		try {
			String[] group_id_Arr = subScriptionVO.getGroup_id().split(",");
			String[] content_id_Arr = subScriptionVO.getContent_id().split(",");
			String[] user_id_learner_Arr = subScriptionVO.getUser_id_learner().split(",");
			String[] homework_content_leader_Arr = subScriptionVO.getHomework_content_leader().split(",");
			String[] homework_deadline_Arr = subScriptionVO.getHomework_deadline().split(",");
			

			
			for(int i =0; i < user_id_learner_Arr.length; i++) {
				String group_id = group_id_Arr[i];
				String content_id = content_id_Arr[i];
				String user_id_learner = user_id_learner_Arr[i];
				String homework_content_leader = homework_content_leader_Arr[0];
				String homework_deadline = homework_deadline_Arr[0];
				
				subScriptionVO.setGroup_id(group_id);
				subScriptionVO.setContent_id(content_id);
				subScriptionVO.setUser_id_learner(user_id_learner);
				subScriptionVO.setHomework_content_leader(homework_content_leader);
				subScriptionVO.setHomework_deadline(homework_deadline);
				
				if(subScriptionVO.getHomework_content_leader() != ""  &&
						subScriptionVO.getHomework_deadline() != "" &&
						subScriptionVO.getContent_id() != null) {
				
					System.out.println("카운트!=============================");
					int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					
					model.addAttribute("pageDto", pageDto);
					
					contentService.homework_add(subScriptionVO);
					contentService.groupApproval(subScriptionVO, cri,  model);
					contentService.homework_option(subScriptionVO, model);
					
				} else {
					int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					
					model.addAttribute("pageDto", pageDto);
					
					contentService.groupApproval(subScriptionVO, cri,  model);
					contentService.homework_option(subScriptionVO, model);
					
					return "homework_t/homework_add";
				}
			}
			
			return "homework_t/homework_add";
		} catch (Exception e) {
			int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			
			model.addAttribute("pageDto", pageDto);
			
			contentService.groupApproval(subScriptionVO, cri,  model);
			contentService.homework_option(subScriptionVO, model);
			
			return "homework_t/homework_add";
		}
     	
     	
     	
		
		
	}
	
	@PostMapping("homework_sel")
	public String homework_sel(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		
		System.out.println("user_id : ==========================" + subScriptionVO.getUser_id());
		
		contentService.groupApproval(subScriptionVO, cri,  model);
		contentService.homework_option(subScriptionVO, model);
		
		int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		
		return "/homework_t/homework_add";
	}
	
	
	@GetMapping("homework_evaluation")
	public String homeworkEval(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		
		int cnt = contentService.homeworkEvalCnt(subScriptionVO, cri);
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		
		contentService.homeworkEval(subScriptionVO, cri, model);
		
		return "homework_t/homework_evaluation";
		
	}
	
	@PostMapping("updateEvaluation")
	public String updateEvaluation(SubScriptionVO subScriptionVO, Criteria cri, Model model) {
		
		System.out.println("getHomework_no : ==============================" +  subScriptionVO.getHomework_no());
		System.out.println("getEvaluation : ==============================" +  subScriptionVO.getEvaluation());
		
		try {
			String[] homework_no_Arr = subScriptionVO.getHomework_no().split(",");
			String[] evaluation_Arr = subScriptionVO.getEvaluation().split(",");
			
			for(int i = 0; i < homework_no_Arr.length; i++) {
				
				String homework_no = homework_no_Arr[i];
				String evaluation = evaluation_Arr[i];
				
				subScriptionVO.setHomework_no(homework_no);
				subScriptionVO.setEvaluation(evaluation);
				
				if(subScriptionVO.getHomework_no() != null &&
						subScriptionVO.getEvaluation() != "") {
					
					int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					
					model.addAttribute("pageDto", pageDto);
					
					contentService.updateEvaluation(subScriptionVO);
					contentService.homeworkEval(subScriptionVO, cri, model);
					
					
				} else {
					int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					
					model.addAttribute("pageDto", pageDto);
					
					contentService.homeworkEval(subScriptionVO, cri, model);
					
					return "homework_t/homework_evaluation";
					
				}
			}
			return "homework_t/homework_evaluation";
			
		} catch (Exception e) {
			int cnt = contentService.groupApprovalCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			
			model.addAttribute("pageDto", pageDto);
			
			contentService.homeworkEval(subScriptionVO, cri, model);
			
			return "homework_t/homework_evaluation";
		}
		
		
		
		
	}
	
}
