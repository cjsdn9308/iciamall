package com.iciamall.www.service;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.scheduling.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.iciamall.www.dao.*;
import com.iciamall.www.dto.*;
import com.iciamall.www.entity.*;
import com.iciamall.www.exception.*;

import lombok.*;

@RequiredArgsConstructor
@Service
public class UserRestService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@Transactional
	public void join(UserDto.Join dto) {
		User user = modelMapper.map(dto, User.class);
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setEnabled(1);
		userDao.insert(user);
		authorityDao.insert(user.getUsername(), "ROLE_USER");
	}
	
	@Transactional(readOnly=true)
	public void idAvailableCheck(String username) {
		if(userDao.findById(username)!=null)
			throw new JobRestFailException("사용중인 아이디입니다");
	}

	@Transactional(readOnly=true)
	public void emailAvailableCheck(String email) {
		User user = userDao.findByEmail(email);
		if(user!=null)
			throw new JobRestFailException("사용중인 이메일입니다");
	}
}
