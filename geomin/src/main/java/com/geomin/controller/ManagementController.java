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
				
		return "redirect:/management/learner_content";
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
	
	
	/*
	@PostMapping("emailEdit")
	@ResponseBody
	public String emailEdit(
	    @RequestParam String user_id,
	    @RequestParam String email,
	    @RequestParam String emailNumber
	) {
	    // 여기서 user_id, email, emailNumber는 프론트엔드에서 넘겨줘야 하는 파라미터입니다.

	    // 사용자가 입력한 인증번호와 실제로 발송한 인증번호가 일치하는지 확인
	    boolean isEmailVerified = verifyEmailNumber(email, emailNumber);

	    if (isEmailVerified) {
	        // 인증번호가 일치하는 경우
	        UserVO userVo = new UserVO();
	        userVo.setUser_id(user_id);
	        userVo.setEmail(email);

	        int res = managementService.emailEdit(userVo); // email 변경 처리

	        if (res > 0) {
	            return "success"; // 성공적으로 이메일 변경
	        } else {
	            return "error"; // 이메일 변경 중 에러 발생
	        }
	    } else {
	        // 인증번호가 일치하지 않는 경우
	        return "invalid"; // 인증번호가 일치하지 않음
	    }
	}

	// 이메일 인증번호 검증을 위한 메서드
	private boolean verifyEmailNumber(String email, String emailNumber) {
	    // 여기에 이메일 인증번호를 검증하는 로직을 작성
	    // 이메일과 인증번호를 비교하여 검증합니다.
	    // 실제로는 이 부분에서 데이터베이스를 이용하여 검증하는 것이 좋습니다.
	    // 아래는 간단한 가상 예시입니다.
	    String storedEmailNumber = getEmailNumberFromDatabase(email); // 데이터베이스에서 저장된 인증번호 가져오기
	    return emailNumber.equals(storedEmailNumber); // 입력한 인증번호와 저장된 인증번호 비교
	}

	// 실제 데이터베이스에서 이메일 인증번호를 가져오는 메서드 (가상의 메서드)
	private String getEmailNumberFromDatabase(String email) {
	    // 여기에 데이터베이스에서 이메일에 대한 인증번호를 조회하는 로직을 작성
	    // 이메일을 기반으로 데이터베이스에서 저장된 인증번호를 가져와서 반환
	    // 이 부분은 실제 프로젝트에서 데이터베이스 연동을 통해 구현되어야 합니다.
	    return "123456"; // 가상의 인증번호 반환
	}

	
	@GetMapping("mailCheck")
	public String mailCheck(String email, HttpServletResponse response) {
	    System.out.println("이메일 인증 요청이 들어옴!");
	    System.out.println("이메일 인증 이메일 : " + email);
	    
	    // 이메일 인증 로직을 수행
	    
	    // 인증이 성공했다면 리다이렉트
	    return "redirect:/login/profile?user_id=test56";
	}
	/*
	
			/*
	@PostMapping("phonenumberEdit")
	public String phonenumberEdit(UserVO userVo, RedirectAttributes rttr) {
		int res = mypageService.myPhonenumberEdit(userVo);
		log.info("=========================================================" + res);
		if(res > 0) {
			rttr.addAttribute("member_no", userVo.getMember_no());
			
			if(userVo.getTeacheryn().equals("Y")) {
				
				return "redirect:/mypage/teacher";
			}
		}else{
			rttr.addAttribute("errorMsg", "전화번호 변경 중 에러가 발생하였습니다.");
			return "/";
		}
		
		
	}
	*/
		
	
}
