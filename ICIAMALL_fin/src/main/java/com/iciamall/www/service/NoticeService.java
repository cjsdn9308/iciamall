package com.iciamall.www.service;

import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.iciamall.www.dao.*;
import com.iciamall.www.dto.*;
import com.iciamall.www.entity.*;
import com.iciamall.www.exception.*;
import com.iciamall.www.util.*;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private PagingUtil pagingUtil;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private UserDao userDao;

	private DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	private DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");

	public Page list(Integer pageno) {
		int count = noticeDao.count();
		List<Notice> noticeList = noticeDao.findAll(pagingUtil.getRownum(pageno, count));
		Page page = pagingUtil.getPage(pageno, count);

		List<BoardDto.ListView> list = new ArrayList<BoardDto.ListView>();
		for (Notice notice: noticeList) {
			BoardDto.ListView dto = modelMapper.map(notice, BoardDto.ListView.class);
			dto.setWriteTimeString(formatter2.format(notice.getWriteTime()));
			dto.setCommentCnt(dto.getCommentCnt());
			list.add(dto);
		}

		page.setList(list);
		return page;
	}

	public NoticeDto.Read easyRead(Integer bno, String username) {
		Notice result = noticeDao.findByBno(bno);
		NoticeDto.Read dto = modelMapper.map(result, NoticeDto.Read.class);

		// 로그인했고 글쓴 사람이 아니라면 조회수 증가
		if(username!=null && result.getWriter().equals(username) == false) {
			int readCnt = result.getReadCnt() + 1;
			noticeDao.update(Notice.builder().bno(bno).readCnt(readCnt).build());
			result.setReadCnt(readCnt);
		}

		// 댓글 가져오기
		// 댓글이 10개이하면 댓글의 개수(board.getCommentCnt())만큼 읽어온다. nextCommentPage는 0
		// 댓글이 10개이상이면 10개 읽어온다. nextCommentPage는 2
		if (result.getCommentCnt() > 0) {
			int commentCnt = result.getCommentCnt();
			int endRowNum = commentCnt > 10 ? 10 : commentCnt;
			int nextCommentPage = commentCnt > endRowNum ? 2 : 0;
			dto.setNextCommentPage(nextCommentPage);

			List<Comment> cList = commentDao.findFirstPage(endRowNum, bno);
			List<CommentDto.Read> comments = new ArrayList();
			for (Comment c : cList) {
				CommentDto.Read r = modelMapper.map(c, CommentDto.Read.class);
				r.setWriteTimeString(formatter2.format(c.getWriteTime()));
				r.setIsWriter(c.getWriter().equals(username));
				comments.add(r);
			}
			dto.setComments(comments);
		}

		return dto;
	}

	@Transactional
	public int write(NoticeDto.Write dto, String username) {
		Notice notice = Notice.builder().title(dto.getTitle()).content(dto.getContent()).writer(username).build();
		// 글을 저장한다(글번호 모름) -> dao의 <selectKey>에 의해 시퀀스값이 board 객체에 저장된다
		noticeDao.insert(notice);
		return notice.getBno();
	}

	@Transactional
	public void delete(Integer bno, String username) {
		// 글이 있는가
		Notice notice = noticeDao.findByBno(bno);
		// 글쓴 사람이 맞는가
		if (notice.getWriter().equals(username) == false)
			throw new BoardJob.IllegalAccessException();
		// DB에서 글 삭제
		noticeDao.delete(bno);

	}

	@Transactional
	public void update(NoticeDto.Update dto, String username) {
		Notice notice = noticeDao.findByBno(dto.getBno());
		if (notice.getWriter().equals(username) == false)
			throw new BoardJob.IllegalAccessException();
		Notice param = Notice.builder().bno(dto.getBno()).title(dto.getTitle()).build();
		param.setContent(dto.getContent());
		noticeDao.update(param);
	}

	public CommentDto.Rest writeComment(CommentDto.Write dto, String username) {
		Notice notice = noticeDao.findByBno(dto.getBno());
		// 예외가 발생하지 않을 거야 -> get()으로 꺼낸다 -> 만약 null이면 NoSuchElementException 발생
		Comment comment = modelMapper.map(dto, Comment.class);
		comment.setWriter(username);
		commentDao.insert(comment);
		noticeDao.update(Notice.builder().bno(dto.getBno()).commentCnt(notice.getCommentCnt()+1).build());
		
		
		int endRowNum = notice.getCommentCnt()>10 ? 10 : notice.getCommentCnt();
		int nextCommentPage = notice.getCommentCnt()>10 ? 2 : 0;
		return new CommentDto.Rest(commentDao.findFirstPage(endRowNum, dto.getBno()), nextCommentPage);
	}
}
