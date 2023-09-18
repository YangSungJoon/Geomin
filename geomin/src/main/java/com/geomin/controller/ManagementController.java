package com.geomin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.service.MailSendService;
import com.geomin.service.ManagementService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.SaleVO;
import com.geomin.vo.SubScriptionVO;

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
	
	@GetMapping("contentListView")
	public String contentListView(@RequestParam("content_id") String contentId, Model model){
		
		ContentVO contentVo = managementService.contentListView(contentId);
		contentVo.setLearning_difficulty_str();
		
		model.addAttribute("contentVo", contentVo);
		
		return "/management/contentListView";
	}
	
	@GetMapping("contentUpdate")
	public String contentUpdateList(@RequestParam("content_id") String contentId, Model model) {
	    ContentVO contentVo = managementService.contentListView(contentId);
	    model.addAttribute("contentVo", contentVo);
	    return "/management/contentUpdate";
	}

	@PostMapping("contentUpdate")
	public String contentUpdate(ContentVO contentVo, Model model) {
	    int result = managementService.contentUpdate(contentVo);

	    if (result > 0) {
	        model.addAttribute("updateSuccess", "true");
	    } else {
	        model.addAttribute("updateSuccess", "false");
	    }

	    return "redirect:/management/contentListView?content_id=" + contentVo.getContent_id();
	}

	@PostMapping("contentDelete")
	@ResponseBody
	public Map<String, String> contentDelete(@RequestParam("content_id") String contentId) {
	    Map<String, String> response = new HashMap<>();

	    ContentVO contentVo = new ContentVO();
	    contentVo.setContent_id(contentId);
	    contentVo.setIs_deleted("Y"); // is_deleted 값을 "Y"로 설정

	    int result = managementService.contentDelete(contentVo);

	    if (result > 0) {
	        response.put("success", "true");
	    } else {
	        response.put("success", "false");
	    }

	    return response;
	}


	
	@PostMapping("insert_content")
	public String insertContent(ContentVO contentVo, Model model) {
		System.out.println("contentVo" + contentVo);
		int result = managementService.insert(contentVo);
		
		if(result > 0) {
			model.addAttribute("insertSuccess", "true");
		}
				
		return "redirect:/content/contentList";
	}
	
	@GetMapping("salestally")
	public String salestally(Model model) {
	    List<SubScriptionVO> contentNameList = managementService.contentSelect();
	    
	 // 중복을 제거할 데이터 배열
	    List<SubScriptionVO> uniqueContentNameList = new ArrayList<>();
	    Map<String, SubScriptionVO> contentMap = new HashMap<>();

	    for (SubScriptionVO content : contentNameList) {
	        if (!contentMap.containsKey(content.getContent_name())) {
	            uniqueContentNameList.add(content);
	            contentMap.put(content.getContent_name(), content);
	        }
	    }
	    
	    model.addAttribute("contentNameList", uniqueContentNameList);
	    return "/management/salestally";
	}
	
	@GetMapping("yearSaleList")
	@ResponseBody
	public List<SaleVO> yearSaleList(@RequestParam String content_id) {
		
		System.out.println("content_id : "+content_id);
	    return managementService.yearSaleList(content_id);
	}

	
	@GetMapping("monthSaleList")
	@ResponseBody
	public List<SaleVO> monthSaleList(@RequestParam String content_id, @RequestParam String year) {
		
		System.out.println("content_id : "+content_id);
		System.out.println("year : " + year);
	    return managementService.monthSaleList(content_id, year);
	}
	
	
}
