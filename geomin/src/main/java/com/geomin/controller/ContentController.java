package com.geomin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.Criteria;
import com.geomin.vo.PageDto;
import com.geomin.vo.SubScriptionVO;

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
		
		model.addAttribute("gudok","구독신청이 완료 되었습니다.");
		model.addAttribute("gudokNO","구독신청이 실패 하였습니다.");

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
		 
		 System.out.println("getIs_deleted : =====================" + subScriptionVO.getIs_deleted());
		 
		 
		 // is_deleted가 'N'인 경우에만 성공으로 처리
		 if ("N".equals(subScriptionVO.getIs_deleted())) {
			 contentService.insertSubContent(subScriptionVO, model);
			 contentService.insertContentPay(subScriptionVO);
			 contentService.subContentList(subScriptionVO, cri, model);
			 
			 return "redirect:/content/contentList";
			 
		 } else if("Y".equals(subScriptionVO.getIs_deleted())){
			 int cnt = contentService.contentListCnt(subScriptionVO, cri);
			 List<ContentVO> list = contentService.contentList(subScriptionVO, cri, model);
			 System.out.println("contentList : =====================" + list);
			 
			 PageDto pageDto = new PageDto(cri, cnt);
			 
			 model.addAttribute("pageDto", pageDto);
			 model.addAttribute("contentList", list);
			 
			 return "redirect:/content/contentList";
			 
		 } else {
			 int cnt = contentService.contentListCnt(subScriptionVO, cri);
			 List<ContentVO> list = contentService.contentList(subScriptionVO, cri, model);
			 System.out.println("contentList : =====================" + list);
			 
			 PageDto pageDto = new PageDto(cri, cnt);
			 
			 model.addAttribute("pageDto", pageDto);
			 model.addAttribute("contentList", list);
			 
			 return "redirect:/content/contentList";
		 }
		 
	 }
	 
/*	@PostMapping("subContentListAction")
	public String subContentListAction(Model model, SubScriptionVO subScriptionVO, Criteria cri, RedirectAttributes redirectAttributes) {

		System.out.println("getIs_deleted : =====================" + subScriptionVO.getIs_deleted());
		

	        

		        // is_deleted가 'N'인 경우에만 성공으로 처리
		        if ("N".equals(subScriptionVO.getIs_deleted())) {
		        	contentService.insertSubContent(subScriptionVO, model);
		        	contentService.insertContentPay(subScriptionVO);
		        	contentService.subContentList(subScriptionVO, cri, model);
				
		        	redirectAttributes.addFlashAttribute("successMessage", "구독 신청이 완료되었습니다.");
		        	redirectAttributes.addAttribute("user_id",subScriptionVO.getUser_id());
				  
				  return "redirect:/content/subContentList";
		        	
		        } else if("Y".equals(subScriptionVO.getIs_deleted())){
			        int cnt = contentService.contentListCnt(subScriptionVO, cri);
			        List<ContentVO> list = contentService.contentList(subScriptionVO, cri, model);
			        System.out.println("contentList : =====================" + list);
			        	
			        PageDto pageDto = new PageDto(cri, cnt);
			        
			        model.addAttribute("pageDto", pageDto);
			        model.addAttribute("contentList", list);
			        
				
				  redirectAttributes.addFlashAttribute("delMessage", "삭제된 컨텐츠 입니다. 다시 선택해 주세요.");
				  
				  
				  return "redirect:/content/contentList";
				 
		        } else {
		        	redirectAttributes.addFlashAttribute("errorMessage", "구독 신청할 컨텐츠를 선택해주세요.");
		        	return "redirect:/content/contentList"; // 리다이렉트
		        	
		        }
		
	}
	
	*/
	
	@PostMapping("payStatus")
	public String payStatusUpdate(SubScriptionVO subScriptionVO,Criteria cri, Model model) {
		
		System.out.println("content_id ============================== :  " + subScriptionVO.getContent_id());
		
		if(subScriptionVO.getContent_id() != null) {
			contentService.payStatusUpdate(subScriptionVO);
			
			contentService.deletePay(subScriptionVO);
			
			contentService.subContentList(subScriptionVO, cri, model);
			
			
			int cnt = contentService.subContentListCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			model.addAttribute("pageDto", pageDto);
			
			
			return "/content/subContentList";
			
		} else {
			contentService.subContentList(subScriptionVO, cri, model);
			
			int cnt = contentService.subContentListCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			model.addAttribute("pageDto", pageDto);
			
			
			return "/content/subContentList";
		}
		
				
	}
	

}
