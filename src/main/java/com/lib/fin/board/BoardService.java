package com.lib.fin.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.announcement.AnnouncementVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.FileVO;
import com.lib.fin.commons.Pager;

public interface BoardService {

	public List<BoardVO> getList(Pager pager) throws Exception;


	public int getTotalAnnouncementCount() throws Exception;

	public int addWriting(BoardVO boardVO, List<MultipartFile> list) throws Exception;

	public BoardVO getDetail(BoardVO boardVO) throws Exception;

	public int setUpdate(BoardVO boardVO) throws Exception;

	public int setDelete(BoardVO boardVO) throws Exception;

	public FileVO getFileDetail(FileVO fileVO) throws Exception;

	public int addComment(CommentVO comment) throws Exception;

	public List<CommentVO> getComments(Long board_no) throws Exception;

// 게시글 좋아요 증가

	public void likeAnnouncement(Long board_no) throws Exception;

	public void unlikeAnnouncement(Long board_no) throws Exception;
}
