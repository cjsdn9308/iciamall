package com.iciamall.www.security;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.servlet.mvc.support.*;

import com.iciamall.www.dao.*;
import com.iciamall.www.entity.*;

import lombok.*;


@RequiredArgsConstructor
@Component("loginFailureHandler")
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	@Autowired
	private final UserDao dao;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		HttpSession session = request.getSession();
		String url = "/user/login";
		if(exception instanceof InternalAuthenticationServiceException) 
			session.setAttribute("msg", "아이디를 확인하세요");

		
		new DefaultRedirectStrategy().sendRedirect(request, response, url);
	}
}





