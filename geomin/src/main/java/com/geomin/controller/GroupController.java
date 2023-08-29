package com.geomin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.service.ContentService;
import com.geomin.vo.ContentVO;
import com.geomin.vo.GroupVO;
import com.geomin.vo.SubScriptionVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/group/*")
@Controller
@Log4j
public class GroupController {

	@Autowired
	ContentService contentService;

	@GetMapping("groupAdd")
	public String group(SubScriptionVO subScriptionVO,String userid,Model model){
		
		System.err.println("user_id : ========================" + subScriptionVO.getUser_id());
		contentService.option_content_id(subScriptionVO, model);
		
		
		return "/group/groupAdd";
	}


	
	@PostMapping("groupAdd")
	public String insertgroup(SubScriptionVO subScriptionVO, GroupVO groupVO, Model model, HttpSession session) {
		System.out.println("getUser_id : ===============" + session.getAttribute("userId").toString());
		System.out.println("getContent_name : ============" + subScriptionVO.getContent_name());
		System.out.println("getUser_id : ===============" + subScriptionVO.getGroup_name());
		System.out.println("getContent_name : ============" + subScriptionVO.getContent_id());
		
		contentService.contentList(subScriptionVO, model);

		contentService.insertgroup(subScriptionVO, model);
		
		
	
		subScriptionVO.setUser_id(session.getAttribute("userId").toString());
		contentService.myGroup(subScriptionVO, model);
		
		return "group/myGroup";
	}
	
	
	@GetMapping("groupApproval")
	public String groupApproval(SubScriptionVO subScriptionVO, Model model) {
		System.out.println("user_id : ===================================" +  subScriptionVO.getUser_id());
		
		contentService.option_content_id(subScriptionVO, model);
		contentService.groupApproval(subScriptionVO, model);

		return "group/groupApproval";
	}
	
	
	@PostMapping("Approval")
	public String updateGroupyn(SubScriptionVO subScriptionVO, Model model) {
		System.out.println("content_id: ===================================" +  subScriptionVO.getContent_id());
		
		contentService.updateGroupyn(subScriptionVO);
		contentService.add_current(subScriptionVO);
		
		contentService.groupApproval(subScriptionVO, model);
	
		return "group/groupApproval";
	}
	
	
	@GetMapping("myGroup")
	public String myGroup(SubScriptionVO subScriptionVO, Model model) {
		contentService.myGroup(subScriptionVO, model);
		
		return "group/myGroup";
	}
	
	
	@PostMapping("delGroup")
	public String delGroup(SubScriptionVO subScriptionVO, Model model) {
		
		System.err.println("group_id : =================================" + subScriptionVO.getGroup_id());
		
		contentService.delGroup(subScriptionVO);
		contentService.myGroup(subScriptionVO, model);
		
		return "group/myGroup";
	}
	
}
