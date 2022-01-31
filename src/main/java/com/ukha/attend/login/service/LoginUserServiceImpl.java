package com.ukha.attend.login.service;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.login.dao.UserDao;
import com.ukha.attend.login.dto.GPIDto;

@Service
public class LoginUserServiceImpl implements LoginUserService{
	
	@Autowired
	private UserDao userDao;
	
	// 로그인 체크
	@Override
	public String loginCheck(HttpServletRequest request, HttpServletResponse response) {
		
		String inputId = request.getParameter("loginId");
		String inputPw = request.getParameter("loginPassword");
//		String autoLoginCheck = request.getParameter("autoLoginCheck");
						
		GPIDto userDto = new GPIDto();
		
		try {
			userDto = userDao.getLogin(inputId);
			
			if(userDto != null){
				
				String encPw = userDto.getPw();
				int pwd_fail_num = userDto.getPwd_fail_num();
				
				if(pwd_fail_num > 5){ // db 오류횟수가 5회 이상이라면
					return "OVERPWDFAIL";
				}
				
				// 파람으로 넘어온 pw와 비교 --> 현재 디코딩 과정 생략
				if(inputPw.equals(encPw)){
					
					/* 세션에 로그인정보 저장 */
					// 세션을 가져온다. (가져올 세션이 없다면 생성한다.)		
			        HttpSession httpSession = request.getSession(true); 		
			        // "USER"로 sessionVO를 세션에 바인딩한다.
			        httpSession.setAttribute("id", inputId); // *만약 다른정보가 필요하면 HashMap으로 넣자*
			        
//			        if("true".equals(autoLoginCheck)){ // 자동로그인 설정 되어있으면 쿠키에 반영구 저장_따로 로그아웃을 하지않는이상 보존
//			        	
//			        	Cookie cook = new Cookie("savedId", inputId);
//			        	
//			        	cook.setMaxAge(60);
//			        	
//			        	response.addCookie(cook);
//			        	
//			        }
			        
					return "SUCCESS";
					
				} else { // 불일치시 
					// 비밀번호 오류횟수 +1
					int n = userDao.incrementPwdFailNum(inputId);
					
					return "NOTMATCH";
				}
			} else {
				return "NOTEXIST";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "ERROR";
		}
	}

}
