package com.geomin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geomin.service.MailSendService;
import com.geomin.service.ManagementService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/management/*")
@Controller
@Log4j
public class ManagementController {
	
	@Autowired
	ManagementService managementService;
	
	@Autowired
	MailSendService mailService;
	
	@GetMapping("learner_content")
	public String learner_content(Model model){
		managementService.contentList(model);
		return "/management/learner_content";
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
	
	@GetMapping("salestally")
	public String salestally(Model model){
		
		return "/management/salestally";
	}

	@GetMapping("yearSaleList")
	@ResponseBody
	public List<SubScriptionVO> yearSaleList(@RequestParam String contentName) {
		
		System.out.println("contentName : "+contentName);
	    return managementService.yearSaleList(contentName);
	}

	
	@GetMapping("monthSaleList")
	@ResponseBody
	public List<SubScriptionVO> monthSaleList(@RequestParam String contentName, @RequestParam String year) {
		
		System.out.println("contentName : "+contentName);
		System.out.println("year : " + year);
	    return managementService.monthSaleList(contentName, year);
	}
	
	@PostMapping("emailEdit")
	public String emailEdit(UserVO userVo, RedirectAttributes rttr) {
		int res = managementService.emailEdit(userVo);
		log.info("=========================================================" + res);
		if(res > 0) {
			rttr.addAttribute("user_id", userVo.getUser_id());
			
			
		}else{
			rttr.addAttribute("errorMsg", "이메일 변경 중 에러가 발생하였습니다.");
		}
		return "redirect:/login/profile";
	}
	
			/*
	@PostMapping("phonenumberEdit")
	public String phonenumberEdit(UserVO userVo, RedirectAttributes rttr) {
		int res = mypageService.myPhonenumberEdit(userVo);
		log.info("=========================================================" + res);
		if(res > 0) {
			rttr.addAttribute("member_no", userVo.getMember_no());
			
			if(userVo.getTeacheryn().equals("Y")) {
				
				return "redirect:/mypage/teacher";
			}
		}else{
			rttr.addAttribute("errorMsg", "전화번호 변경 중 에러가 발생하였습니다.");
			return "/";
		}
		
		
	}
	*/
	//이메일 인증
		@GetMapping("mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
		
	
}
