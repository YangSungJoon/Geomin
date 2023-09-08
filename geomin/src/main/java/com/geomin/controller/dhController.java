package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geomin.service.GroupJoinService;
import com.geomin.service.HomeWorkService;
import com.geomin.vo.GroupJoinVO;
import com.geomin.vo.HomeWorkVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class dhController {
	
	@Autowired
	private HomeWorkService homeworkService;
	
	@Autowired
	private GroupJoinService groupjoinService;
	
//	@GetMapping("/homework_send/{user_id_learner}")
//	public String homework_send(@PathVariable("user_id_learner") String user_id_learner, Model model) {
//		
//		// 화면에 전달
//		model.addAttribute("home", homeworkService.getList(user_id_learner));
//		
//		return "/homework_send";
//	}
	
	@GetMapping("/homework/homework_send")
	public String getList(@RequestParam(value = "user_id", required = false) String user_id, Model model) {
		
		
		log.info("숙제 목록----------");
		
		log.info("숙제 리스트 출력-----------------------");
		
		model.addAttribute("list", homeworkService.getList(user_id));
		
		log.info("학습자 이름 출력-----------------------");
		model.addAttribute("user", homeworkService.getUserName(user_id));
		
//		log.info("학습 지도자 이름 출력-----------------------");
//		model.addAttribute("leader", homeworkService.getLeaderName(user_id));
//		
//		log.info("콘텐츠명 출력-----------------------");
//		model.addAttribute("content", homeworkService.getContentName(content_id));
		
		return "/homework/homework_send";
	}
	
	@PostMapping("/homework/homework_sendAction")
	public String contentSend(String user_id, @RequestParam("content_send_box") String contentSendBox, @RequestParam("group_id") String groupId, Model model, RedirectAttributes rttr) {
		
		log.info("====================학습 내용 제출 =====================");
		
		HomeWorkVO homeworkVO = new HomeWorkVO();
		homeworkVO.setHomework_content_learner(contentSendBox);
		homeworkVO.setGroup_id(groupId);
		
		int res = homeworkService.update(homeworkVO);
		
			return "redirect:/main/main";
		
		
	}
	
	@GetMapping("/homework/study_group_join")
	public String group(@RequestParam(value = "user_id", required = false) String user_id, Model model) {
		log.info("그룹 정보 조회=========================");
		
		model.addAttribute("user", groupjoinService.userInfo(user_id));
		model.addAttribute("list", homeworkService.getGroupInfo());
		
		log.info("==================================가입 정보 조회======================================");
		//model.addAttribute("select", homeworkService.getGroupId(group_id));
		//model.addAttribute("info", groupjoinService.selectGroup(group_id));
		
		// 학습자 이름 출력
		//model.addAttribute("learner", homeworkService.getUserName(user_id));
		
		return "/homework/study_group_join";
	}
	
	@PostMapping("/homework/study_group_join")
	public String groupAdd(@RequestParam("user_id") String user_id, GroupJoinVO groupjoinvo, Model model) {
		log.info("그룹 가입 신청 ==================================");
		
//		model.addAttribute("list", homeworkService.getGroupInfo());
//		System.out.println(groupjoinvo.toString());
		
		groupjoinService.userInfo(user_id);
		homeworkService.getGroupInfo();
		groupjoinService.groupAdd(groupjoinvo);
		
		
		return "redirect:/homework/study_group_join?user_id="+user_id;
	}
	
//	@GetMapping("/homework/study_group_view")
//	public String groupView(String group_id, Model model) {
//		log.info("그룹 정보 조회=========================");
//		
//		model.addAttribute("list", homeworkService.getGroupInfo());
//		model.addAttribute("id", homeworkService.getGroupId(group_id));
//		
//		return "/homework/study_group_join";
//	}
	
}
