package com.iciamall.www.controller;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.iciamall.www.dto.*;
import com.iciamall.www.service.*;

import lombok.*;


@RestController
public class UserRestController {
	@Autowired
	private UserRestService service;

	@PostMapping("/users/new")
	public ResponseEntity<Void> join(@Valid UserDto.Join dto, BindingResult bindingResult) throws BindException {
		if(bindingResult.hasErrors())
			throw new BindException(bindingResult);
		service.join(dto);
		return ResponseEntity.ok(null);
	}
	
	
	@GetMapping("/users/user/username")
	public ResponseEntity<?> idAvailableCheck(@RequestParam String username) {
		service.idAvailableCheck(username);
		return ResponseEntity.ok(null);
	}
	
	@GetMapping("/users/user/email")
	public ResponseEntity<?> emailAvailableCheck(@RequestParam String email) {
		service.emailAvailableCheck(email);
		return ResponseEntity.ok(null);
	}
	

}
