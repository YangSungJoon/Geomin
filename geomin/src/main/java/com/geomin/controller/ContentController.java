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
		 System.out.println("getContent_id : =====================" + subScriptionVO.getContent_id());
		 
		 
		 try {
			 // content_id와 is_deleted를 가져옴
			 String[] contentIds = subScriptionVO.getContent_id().split(",");
			 String[] isDeletedValues = subScriptionVO.getIs_deleted().split(",");
			 
			 
			 for (int i = 0; i < contentIds.length; i++) {
				 String contentId = contentIds[i];
				 String isDeleted = isDeletedValues[i];
				 
				 subScriptionVO.setContent_id(contentId);
				 subScriptionVO.setIs_deleted(isDeleted);
				 
				 System.out.println("getIs_deleted : =====================" + subScriptionVO.getIs_deleted());
				 System.out.println("getContent_id : =====================" + subScriptionVO.getContent_id());
				 
				 // is_deleted가 'N'인 경우에만 성공으로 처리
				 if ("N".equals(subScriptionVO.getIs_deleted())) {
					 contentService.insertSubContent(subScriptionVO, model);
					 contentService.insertContentPay(subScriptionVO);
					 contentService.subContentList(subScriptionVO, cri, model);
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
			 return "redirect:/content/contentList";
			
		} catch (Exception e) {
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
		
		try {
			String[] content_idArr = subScriptionVO.getContent_id().split(",");
			String[] paystatusArr = subScriptionVO.getPaystatus().split(",");
			
			for (int i = 0; i < content_idArr.length; i++) {
				String contentId = content_idArr[i];
				String paystatus = paystatusArr[i];
				
				subScriptionVO.setContent_id(contentId);
				subScriptionVO.setPaystatus(paystatus);
				
				if ("Y".equals(subScriptionVO.getPaystatus())) {
					contentService.payStatusUpdate(subScriptionVO);
					
					contentService.deletePay(subScriptionVO);
					
					contentService.subContentList(subScriptionVO, cri, model);
					
					
					int cnt = contentService.subContentListCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					model.addAttribute("pageDto", pageDto);
					
					
					
					
				} else {
					contentService.subContentList(subScriptionVO, cri, model);
					
					int cnt = contentService.subContentListCnt(subScriptionVO, cri);
					PageDto pageDto = new PageDto(cri, cnt);
					model.addAttribute("pageDto", pageDto);
					
					
					return "/content/subContentList";
					
				}
				
			}
			return "/content/subContentList";
			
		} catch (Exception e) {
			contentService.subContentList(subScriptionVO, cri, model);
			
			int cnt = contentService.subContentListCnt(subScriptionVO, cri);
			PageDto pageDto = new PageDto(cri, cnt);
			model.addAttribute("pageDto", pageDto);
			
			
			return "/content/subContentList";
		}
		
		
				
	}
	

}
