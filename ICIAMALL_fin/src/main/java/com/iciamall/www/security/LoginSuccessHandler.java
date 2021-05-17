package com.iciamall.www.security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;
import org.springframework.stereotype.*;

import com.iciamall.www.dao.*;

import lombok.*;

@RequiredArgsConstructor
@Component("loginSuccessHandler")
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Autowired
	private final UserDao userDao;

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String username = authentication.getName();

		
		
		// RequestCache : 사용자가 가려던 목적지를 저장하는 인터페이스
		SavedRequest savedRequest = new HttpSessionRequestCache().getRequest(request, response);
		
		// 이동할 주소가 있으면 그곳으로, 없으면 루트로
		RedirectStrategy rs = new DefaultRedirectStrategy();
		if(savedRequest!=null)
			rs.sendRedirect(request, response, savedRequest.getRedirectUrl());
		else
			rs.sendRedirect(request, response, "/");
	}
}