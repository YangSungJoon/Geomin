package com.geomin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class StudyController {
	
	@Autowired
	private HomeWorkService homeworkService;
	
	@Autowired
	private GroupJoinService groupjoinService;
	

	@GetMapping("/homework/homework_send")
	public String getList(@RequestParam(value = "user_id", required = false) String user_id
			,@RequestParam(value = "user_id_leader", required = false) String user_id_leader, Model model) {
		
		
		log.info("숙제 목록----------");
		
		log.info("숙제 리스트 출력-----------------------");
		
		// 학습자 이름 조회
			log.info("학습자 이름 조회");
			UserVO user = homeworkService.getUserName(user_id);
			model.addAttribute("user", user);
			
			// 학습지도자 이름 조회
			log.info("학습지도자 이름 조회");
			HomeWorkVO leader = homeworkService.getLeaderName(user_id_leader);
			model.addAttribute("leader", leader);

			// 숙제 목록 조회 (getListTest를 사용)
			log.info("숙제 목록 조회");
			List<HomeWorkVO> list = homeworkService.getList(user_id);
			
			System.out.println(list);
			model.addAttribute("list", list);
				
		return "/homework/homework_send";
	}
	
	
	
	@PostMapping("/homework/homework_sendAction")
	public String contentSend(
	    Model model, 
	    RedirectAttributes rttr, 
	    HttpSession session, 
	    HomeWorkVO homeworkVO) {

	    log.info("====================학습 내용 제출 =====================");

	    // homeworkVO 객체가 올바른 데이터를 가지고 있는지 로그로 확인
	    log.info("homeworkVO: " + homeworkVO);

	     homeworkService.update(homeworkVO); // 주석 처리, 테스트 시 주석 처리해도 상관 없음

	    // 모델에 데이터를 추가하여 JSP로 전달
	    model.addAttribute("homeworkVO", homeworkVO);
	    System.out.println("update컨텐츠 : " + homeworkVO.getHomework_content_learner());
	    return "redirect:/homework/homework_send?user_id=" + homeworkVO.getUser_id();
	}

	
	
	
	@GetMapping("/homework/study_group_join")
	public String group(@RequestParam(value = "user_id", required = false) String user_id, Model model) {
		log.info("그룹 정보 조회=========================");
		
		model.addAttribute("user", groupjoinService.userInfo(user_id));
		model.addAttribute("list", homeworkService.getGroupInfo());
		
		return "/homework/study_group_join";
	}
	
	@PostMapping("/homework/study_group_join")
	public String groupAdd(@RequestParam("user_id") String user_id, GroupJoinVO groupjoinvo, Model model) {
		log.info("그룹 가입 신청 ==================================");
	
		groupjoinService.userInfo(user_id);
		homeworkService.getGroupInfo();
		groupjoinService.groupAdd(groupjoinvo);
		
		
		return "redirect:/homework/study_group_join?user_id="+user_id;
	}
	
	@GetMapping("/homework/study_group_info")
	public String groupInfo(@RequestParam(value = "user_id", required = false) String user_id, GroupJoinVO groupjoinvo, Model model) {
		
		log.info("========================가입된 그룹 정보 조회=========================");
		model.addAttribute("list", groupjoinService.JoinGroupInfo(user_id));
		log.info("========================승인 대기 중인 그룹 정보 조회=========================");
		model.addAttribute("list2", groupjoinService.JoinGroupInfo2(user_id));
		
		return "/homework/study_group_info";
	}
	
}
