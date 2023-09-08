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
	public String announcement(Model model){
		
//		List<AnnouncementVO> announceList = announcementService.getAllAnnouncements();
		List<AnnouncementVO> type1List = announcementService.getAllAnnouncements("1");
		List<AnnouncementVO> type2List = announcementService.getAllAnnouncements("2");
//		
//		for (AnnouncementVO announcement : announceList) {
//	        if ("1".equals(announcement.getAnnouncement_type())) {
//	            type1List.add(announcement);
//	        } else if ("2".equals(announcement.getAnnouncement_type())) {
//	            type2List.add(announcement);
//	        }
//	    }
		 model.addAttribute("type1List", type1List);
		 model.addAttribute("type2List", type2List);
		return "/management/announcement";
	}
	
	@GetMapping("qna")
	public String qna(Model model){
	    List<AnnouncementVO> type2List = announcementService.getAllAnnouncements("2");
	    
	    model.addAttribute("type2List", type2List);
	    
	    return "/management/qna";
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
