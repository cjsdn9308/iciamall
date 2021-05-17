package com.iciamall.www.controller;

import java.security.*;
import java.util.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.iciamall.www.dao.*;
import com.iciamall.www.dto.*;
import com.iciamall.www.entity.*;
import com.iciamall.www.service.*;

import lombok.*;

@Controller
public class BoardController {
	@Autowired
	private BoardService  service;
	@Autowired
	private NoticeService  nservice;

	
	@GetMapping({"/board/qna"})
	public ModelAndView qna(@RequestParam(defaultValue = "1") Integer pageno) {
		return new ModelAndView("board/qna").addObject("page", service.list(pageno));		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/board/qna_write"})
	public ModelAndView qna_write() {
		return new ModelAndView("board/qna_write");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping({"/board/qna_write"})
	public ModelAndView write(@ModelAttribute @Valid BoardDto.Write dto, BindingResult bindingResult, 
			Principal principal) throws BindException {
		if(bindingResult.hasErrors())
			throw new BindException(bindingResult);
		int bno = service.write(dto, principal.getName());
		return new ModelAndView("redirect:/board/qna");
	}
	
	@GetMapping({"/board/qnaread"})
	public ModelAndView qnaread(@NonNull Integer bno, Principal principal) {
		String username = (principal==null)? null : principal.getName();
		BoardDto.Read dto = service.easyRead(bno, username);
		return new ModelAndView("board/qnaread").addObject("board", dto);		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board/qna_delete")
	public ModelAndView qnadelete(@NonNull Integer bno, Principal principal) {
		// 글 삭제 
		// - 글을 삭제할 것인가? 첨부파일, 댓글, 글 모두 삭제 
		// - 비활성화할 것인가? 글 읽기를 하면 "삭제된 글입니다"라고 내용을 출력. 댓글은 정상적으로 출력
		service.delete(bno, principal.getName());
		return new ModelAndView("redirect:/board/qna");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board/qna_update")
	public ModelAndView qnaupdate(BoardDto.Update dto, Principal principal) {
		service.update(dto, principal.getName());
		return new ModelAndView("redirect:/board/qnaread?bno=" + dto.getBno());
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/comments", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CommentDto.Rest> writeComment(@Valid CommentDto.Write dto, BindingResult bindingResult, Principal principal) throws BindException {
		if(bindingResult.hasErrors())
			throw new BindException(bindingResult);
		return ResponseEntity.ok(service.writeComment(dto, principal.getName()));
	}
	
	
	
	
	
	
	@GetMapping({"/board/notice"})
	public ModelAndView notice(@RequestParam(defaultValue = "1") Integer pageno) {
		return new ModelAndView("board/notice").addObject("page", nservice.list(pageno));
	}
	
	@GetMapping({"/board/notice_write"})
	public ModelAndView notice_write() {
		return new ModelAndView("board/notice_write");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping({"/board/notice_write"})
	public ModelAndView write(@ModelAttribute @Valid NoticeDto.Write dto, BindingResult bindingResult, 
			Principal principal) throws BindException {
		if(bindingResult.hasErrors())
			throw new BindException(bindingResult);
		int bno = nservice.write(dto, principal.getName());
		return new ModelAndView("redirect:/board/notice");
	}
	
	@GetMapping({"/board/noticeread"})
	public ModelAndView noticeread(@NonNull Integer bno, Principal principal) {
		String username = (principal==null)? null : principal.getName();
		NoticeDto.Read dto = nservice.easyRead(bno, username);
		return new ModelAndView("board/noticeread").addObject("notice", dto);		
	}
	
	@PostMapping("/board/notice_delete")
	public ModelAndView noticedelete(@NonNull Integer bno, Principal principal) {
		// 글 삭제 
		// - 글을 삭제할 것인가? 첨부파일, 댓글, 글 모두 삭제 
		// - 비활성화할 것인가? 글 읽기를 하면 "삭제된 글입니다"라고 내용을 출력. 댓글은 정상적으로 출력
		nservice.delete(bno, principal.getName());
		return new ModelAndView("redirect:/board/notice");
	}
}



