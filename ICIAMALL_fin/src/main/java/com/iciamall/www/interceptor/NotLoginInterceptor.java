package com.iciamall.www.interceptor;

import javax.servlet.http.*;

import org.springframework.security.core.*;
import org.springframework.security.core.context.*;
import org.springframework.web.servlet.handler.*;

// 로그인 안했는지 확인하는 인터셉터
public class NotLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		// Authentication의 경우 "anonymousUser" 문자열을 가진다
		if(authentication.getPrincipal().toString().equals("anonymousUser")==false) {
			throw new IllegalAccessException("잘못된 접근입니다");
		}
		
		return true;
	}
}
