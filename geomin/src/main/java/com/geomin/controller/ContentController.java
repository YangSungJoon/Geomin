package com.geomin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.geomin.service.ContentService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/content/*")
@Controller
@Log4j
public class ContentController {

	@Autowired
	ContentService contentService;
	
	@GetMapping("contentList")
	public void contentList(ContentVO contentVO, Model model) {
		
		
		contentService.contentList(contentVO, model);
	}
	

	
	
	 @GetMapping("subContentList") 
	 public String subContentList(Model model, SubScriptionVO subScriptionVO) { 
			System.out.println("User_id ============================== :  " + subScriptionVO.getUser_id());
			
			
		 contentService.subContentList(subScriptionVO, model);
		 
		 return "content/subContentList";
	 }
	 
	
	@PostMapping("subContentListAction")
	public String subContentListAction(Model model, SubScriptionVO subScriptionVO) {

		System.out.println("content_id ============================== :  " + subScriptionVO.getContent_id());
		System.out.println("content_id ============================== :  " + subScriptionVO.getUser_id());

		
		
		contentService.insertSubContent(subScriptionVO, model);

		
		contentService.insertContentPay(subScriptionVO);
		
		contentService.subContentList(subScriptionVO, model);
		
		
		
		return "/content/subContentList";
	}
	
	
	@PostMapping("payStatus")
	public String payStatusUpdate(SubScriptionVO subScriptionVO, Model model) {
		
		System.out.println("content_id ============================== :  " + subScriptionVO.getContent_id());
		
		contentService.payStatusUpdate(subScriptionVO);
		
		contentService.deletePay(subScriptionVO);
		
		contentService.subContentList(subScriptionVO, model);
		
		
		
		return "/content/subContentList";
				
	}
	

}
