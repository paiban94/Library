package com.lib.fin.board.announcement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.FileVO;
import com.lib.fin.board.comment.CommentVO;

public interface AnnouncementService {

	public List<AnnouncementVO> getList() throws Exception;
	
	public List<AnnouncementVO> getPaginatedList(int page, int pageSize) throws Exception;
	
	public int getTotalAnnouncementCount() throws Exception;

	public int addWriting(AnnouncementVO boardVO, List<MultipartFile> list) throws Exception;

	public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception;

	public int setUpdate(AnnouncementVO boardVO) throws Exception;

	public int setDelete(AnnouncementVO boardVO) throws Exception;

	public FileVO getFileDetail(FileVO fileVO) throws Exception;

	public int addComment(CommentVO comment) throws Exception;

	public List<CommentVO> getComments(Long board_no) throws Exception;

	// 게시글 좋아요 증가

	public void likeAnnouncement(Long board_no) throws Exception;

	public void unlikeAnnouncement(Long board_no)throws Exception;

}