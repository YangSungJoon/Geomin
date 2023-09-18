package com.geomin.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.geomin.service.AnnouncementService;
import com.geomin.service.ManagementService;
import com.geomin.vo.AnnouncementVO;
import com.geomin.vo.Criteria;
import com.geomin.vo.PageDto;

@RequestMapping("/management/*")
@Controller
public class AnnouncementController {

	@Autowired
	ManagementService managementService;
	
	@Autowired
	AnnouncementService announcementService;
		
	@GetMapping("announce_add")
	public String announce_add(){
		return "/management/announce_add";
	}
	
	@GetMapping("announcementView")
	public String announcementView(Model model, @RequestParam("announcement_id") String announcementId) {
	    AnnouncementVO announcement = announcementService.getAnnouncementById(announcementId);
	    model.addAttribute("announceVo", announcement);
	    
	    return "/management/announcementView";
	}
	
	@GetMapping("announcement")
	public String announcement(String announcement_type,Criteria cri, Model model){
		 // 게시물의 총 개수 가져오기
        int cnt = announcementService.getTotalAnnouncementCount("1", cri);
		
		List<AnnouncementVO> type1List = announcementService.getAllAnnouncements("1", cri, model);
		
		PageDto pageDto = new PageDto(cri, cnt);
		
		 model.addAttribute("pageDto", pageDto);
		 model.addAttribute("type1List", type1List);
		return "/management/announcement";
	}
	
	@GetMapping("faq")
	public String faq(String announcement_type,Criteria cri, Model model){
		 // 게시물의 총 개수 가져오기
        int cnt = announcementService.getTotalAnnouncementCount("2", cri);
		
		List<AnnouncementVO> type2List = announcementService.getAllAnnouncements("2", cri, model);
		
		PageDto pageDto = new PageDto(cri, cnt);
		
		 model.addAttribute("pageDto", pageDto);
		 model.addAttribute("type2List", type2List);
		 
	    return "/management/faq";
	}
	
	@PostMapping("announceInsert")
	public String announceInsert(@RequestParam("announcement_type") String announcementType, AnnouncementVO announcementVo, Model model) {
	    System.out.println("announcementType: " + announcementType);
	    System.out.println("announcementVo: " + announcementVo);

	    // Set current date as string
	    LocalDate currentDate = LocalDate.now();
	    announcementVo.setAnnouncement_date(currentDate);
	    announcementVo.setAnnouncement_type(announcementType); // Set announcement type

	    int result = announcementService.announceInsert(announcementVo);
	    if (result > 0) {
	        model.addAttribute("insertSuccess", "true");
	    }
	    return "redirect:/management/announcement";
	}


}
