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
import com.geomin.vo.Criteria;
import com.geomin.vo.GroupVO;
import com.geomin.vo.PageDto;
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
	public void contentList(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		

		System.out.println("cri : =================" + cri);
		int cnt = contentService.contentListCnt(subScriptionVO, cri);

		List<ContentVO> list = contentService.contentList(subScriptionVO, cri, model);
		System.out.println("contentList : =====================" + list);
		
		
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("contentList", list);

	}
	

	@PostMapping("contentList")
	public String contentListPost(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		

		System.out.println("cri : =================" + cri);
		int cnt = contentService.contentListCnt(subScriptionVO, cri);

		List<ContentVO> list = contentService.contentList(subScriptionVO, cri, model);
		System.out.println("contentList : =====================" + list);
		
		
		PageDto pageDto = new PageDto(cri, cnt);
		
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("contentList", list);

		return "content/contentList";
	}
	
	
	 @GetMapping("subContentList") 
	 public String subContentList(Model model, SubScriptionVO subScriptionVO, Criteria cri) { 
			System.out.println("User_id ============================== :  " + subScriptionVO.getUser_id());
			System.out.println("cri =========================" + cri);
			
			int cnt = contentService.subContentListCnt(subScriptionVO, cri);
			
			List<SubScriptionVO> list = contentService.subContentList(subScriptionVO, cri, model);

			contentService.subContentList(subScriptionVO, cri, model);
			PageDto pageDto = new PageDto(cri, cnt);
			
			model.addAttribute("pageDto", pageDto);
		 
		 return "content/subContentList";
	 }
	 
	 
	 @GetMapping("contentRead") 
	 public String contentRead(Model model, SubScriptionVO subScriptionVO, Criteria cri) { 
		 System.out.println("User_id ============================== :  " + subScriptionVO.getUser_id());
		 
		 
		 contentService.subContentList(subScriptionVO, cri, model);
		 
		 return "content/contentRead";
	 }
	 
	
	@PostMapping("subContentListAction")
	public String subContentListAction(Model model, SubScriptionVO subScriptionVO, Criteria cri) {

		System.out.println("content_id ============================== :  " + subScriptionVO.getContent_id());
		System.out.println("content_id ============================== :  " + subScriptionVO.getUser_id());

		contentService.insertSubContent(subScriptionVO, model);

		
		contentService.insertContentPay(subScriptionVO);
		
		contentService.subContentList(subScriptionVO,cri, model);
		

		
		
		return "/content/subContentList";
	}
	
	
	@PostMapping("payStatus")
	public String payStatusUpdate(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		
		System.out.println("content_id ============================== :  " + subScriptionVO.getContent_id());
		
		contentService.payStatusUpdate(subScriptionVO);
		
		contentService.deletePay(subScriptionVO);
		
		contentService.subContentList(subScriptionVO, cri, model);
		
		
		int cnt = contentService.subContentListCnt(subScriptionVO, cri);
		PageDto pageDto = new PageDto(cri, cnt);
		model.addAttribute("pageDto", pageDto);
		
		
		return "/content/subContentList";
				
	}
	

}
