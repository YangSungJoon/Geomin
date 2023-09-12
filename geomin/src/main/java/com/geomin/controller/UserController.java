package com.geomin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.service.UserService;
import com.geomin.vo.HomeWorkVO;
import com.geomin.vo.UserVO;

import lombok.extern.log4j.Log4j;

import com.geomin.service.HomeWorkService;
import com.geomin.service.HomeWorkServiceImpl;
import com.geomin.service.MailService;

@Controller
@Log4j
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	HomeWorkService homeworkService;

	@GetMapping("/login/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/login/regist")
	public String regist() {
		return "login/regist";
	}
	
	@GetMapping("/login/findId")
	public String findId() {
		return "login/findId";
	}
	
	@GetMapping("/login/findPw")
	public String findPw() {
		return "login/findPw";
	}
	
	@GetMapping("/login/profile")
	public String profile() {
		return "login/profile";
	}
	
	
	@PostMapping("/loginAction")
	public String loginAction(@RequestParam("userId") String user_id,
	    @RequestParam("userPw") String user_pw,            
	    Model model, HttpSession session) {

	    UserVO userVo = new UserVO();
	    userVo.setUser_id(user_id);
	    userVo.setUser_pw(user_pw);

	    userVo = userService.login(userVo);
	    
	    if (userVo != null) {
	        // 인증 성공

	        session.setAttribute("userVo", userVo);
	        session.setAttribute("userId", userVo.getUser_id());

	        // 학습그룹에 가입되어 있는지 확인
	        int isGroupMember = homeworkService.groupLogin(user_id);

	        // 'user_type'에 따라 다른 경로로 리다이렉트
	        if ("2".equals(userVo.getUser_type())) {
	            if (isGroupMember > 0) {
	            	System.out.println("isGroupMember : " +isGroupMember);
	                // user_type이 2이고 그룹에 속한 경우
	                log.info("User is a group member, redirecting to /homework/homework_send");
	                return "redirect:/homework/homework_send?user_id=" + user_id;
	            } else {
	                // user_type이 2이고 그룹에 속하지 않은 경우
	                log.info("User is not a group member, redirecting to /homework/study_group_join");
	                return "redirect:/homework/study_group_join";
	            }
	        } else {
	            log.info("User is not of type 2, redirecting to /main/main");
	            return "redirect:/main/main"; // 그 외의 경우 기본 홈 페이지로 리다이렉트
	        }

	    } else {
	        // 로그인 실패
	        model.addAttribute("errorMSG", "잘못된 아이디 또는 비밀번호 입니다.");
	        return "login/login";
	    }
	}

	
	@PostMapping("/login/regist")
	@ResponseBody
	public Map<String, Object> register(@RequestBody UserVO userVo) {
	    try {
	    	
	    	System.out.println("userVo : " + userVo);
	    	
	    	
	        // 회원가입 서비스 호출
	        int res = userService.insert(userVo);
	        if (res > 0) {
	            // 회원가입 성공 시 success 메시지를 반환
	            return responseMapMessage("success", "회원가입이 완료되었습니다.");
	        } else {
	            // 회원가입 실패 시 fail 메시지를 반환
	            return responseMapMessage("fail", "회원가입에 실패하였습니다. 다시 확인하세요.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return responseMapMessage("fail", "등록 중 예외사항이 발생하였습니다.");
	    }
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 세션 정보 삭제
		session.invalidate();
		return "redirect:/login/login";
	}

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
	
	@PostMapping("/login/idCheck")
	@ResponseBody
	// 넘겨줄때도 JSON 문자열로 반환 할겁니다.
	public  Map<String, Object> idCheck(@RequestBody UserVO userVo){
		
		int res = userService.idCheck(userVo);
		
		// decode(count(*),0,1,0), 0 이면 메세지 나오도록 수정함
		Map<String, Object> response = new HashMap<>();
		
		if(res == 0) {
			response.put("message", "사용 가능한 아이디 입니다.");
			response.put("result", true);
		} else {
			response.put("message", "이미 사용 중인 아이디 입니다.");
			response.put("result", false);
		}
		return response;
	}
	
	 @PostMapping("/login/findId")
	    public String findId(@RequestParam("email") String email, Model model) {
	        List<UserVO> user = userService.findId(email);
	        model.addAttribute("userList", user);
	        return "login/findId";
	    }
	 
	 @PostMapping("/findPwAction")
	 @ResponseBody
	 public Map<String, Object> findPwAction(@RequestBody UserVO userVo) {
	     // userEmail과 userName을 사용하여 회원 정보를 조회하여 유효성을 검사하고, 회원 정보가 맞으면 이메일로 임시 비밀번호를 전송
	     // 회원 정보가 맞지 않다면 에러 메시지를 반환
		 
	     // 사용자 정보를 확인하는 로직은 데이터베이스에서 이메일과 이름으로 회원 정보를 조회하여 확인합니다.
	     // 이 부분은 MemberService의 메서드를 호출하여 처리하도록 합니다.
	     boolean isUserInfoValid = userService.checkUser(userVo);
	     
	     if (isUserInfoValid) {
	         // 임시 비밀번호 생성
	         String temporaryPassword = RandomPassword(8); // 8자리 임시 비밀번호 생성
	         
	         // 회원 정보 업데이트
	        
	         
	         userVo.setUser_pw(temporaryPassword); // 암호화된 비밀번호 설정
	         System.out.println("userVo : " + userVo);

	         int updateResult = userService.updatePw(userVo);
	         
	         Map<String, Object> response = new HashMap<>();
	         if(updateResult > 0) {
	        	 response.put("check", true);
	         } else {
	        	 response.put("check", false);
	         }
	         
	         // 임시 비밀번호를 메일로 발송
	         mailService.findPwSendMail(userVo.getUser_id(), userVo.getEmail(), userVo.getUser_name(), temporaryPassword);
	         
	         return response;
	     } else {
	    	 Map<String, Object> response = new HashMap<>();
	    	 response.put("check", false);
	    	 return response;
	     }
	     
	 }
	 

	 private String RandomPassword(int length) {
	     String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
	     StringBuilder randomPassword = new StringBuilder(length);
	     ThreadLocalRandom random = ThreadLocalRandom.current();

	     for (int i = 0; i < length; i++) {
	         int randomIndex = random.nextInt(chars.length());
	         randomPassword.append(chars.charAt(randomIndex));
	     }

	     return randomPassword.toString();
	 }
	 
	 @PostMapping("/passwordEditAction")
	 @ResponseBody
	 public Map<String, Object> passwordEditAction(@RequestBody UserVO userVo) {
	     try {
	         // 새 비밀번호 암호화
	         userVo.setUser_pw(encoder.encode(userVo.getUser_pw()));

	         // 비밀번호 업데이트 서비스 호출
	         int updateResult = userService.passwordEdit(userVo);
	         
	         System.out.println("userVo : " + userVo);
	         
	         Map<String, Object> response = new HashMap<>();
	         response.put("check", updateResult > 0);
	         return response;
	     } catch (Exception e) {
	         e.printStackTrace();
	         Map<String, Object> response = new HashMap<>();
	         response.put("check", false);
	         return response;
	     }
	 }
}
