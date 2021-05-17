package com.iciamall.www.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.iciamall.www.service.*;

@Controller
public class UserController {
	@Autowired
	private NoticeService  nservice;
	
	@GetMapping({"/","/home"})
	public ModelAndView page(@RequestParam(defaultValue = "1") Integer pageno) {
		return new ModelAndView("page").addObject("page", nservice.list(pageno));
	}
	
	@GetMapping({"/user/join"})
	public ModelAndView join() {
		return new ModelAndView("user/join");
	}
	
	@GetMapping({"/user/login"})
	public ModelAndView login() {
		return new ModelAndView("user/login");
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/user/info"})
	public ModelAndView info() {
		return new ModelAndView("user/info");
	}
	
	 
}
