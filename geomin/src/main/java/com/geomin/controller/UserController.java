package com.geomin.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.geomin.service.UserService;
import com.geomin.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	BCryptPasswordEncoder encoder;

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "regist";
	}
       
	@PostMapping("/loginAction")
	public String loginAction(@RequestParam("userId") String user_id, 
			@RequestParam("userPw") String user_pw,			
			Model model, HttpSession session) {

		UserVO userVo = new UserVO();
		userVo.setUser_id(user_id);
		userVo.setUser_pw(user_pw);

		System.out.println("user_id : " + user_id);
		System.out.println("user_pw : " + user_pw);
		userVo = userService.login(userVo);
        
        if (userVo != null) {
           	// 인증 성공: 세션에 사용자 정보를 저장하고 home 페이지로 리다이렉트합니다.
            
            // 로그인 성공
        	    
           session.setAttribute("userVo", userVo);
           session.setAttribute("userId", userVo.getUser_id());
           return "/main";

		} else {
			// 로그인 실패
			model.addAttribute("errorMSG", "잘못된 아이디 또는 비밀번호 입니다.");
			return "/login";
		}
	}
	
	@PostMapping("/regist")
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

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
}
