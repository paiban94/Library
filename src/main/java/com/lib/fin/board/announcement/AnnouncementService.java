package com.lib.fin.board.announcement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.LikeVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.FileVO;
import com.lib.fin.commons.Pager;
import com.lib.fin.member.MemberVO;

public interface AnnouncementService {

	public List<BoardVO> getList(Pager pager) throws Exception;

	//public List<AnnouncementVO> getPaginatedList(Map<String, Object> params) throws Exception;

		public int getTotalAnnouncementCount() throws Exception;

		public int addWriting(AnnouncementVO boardVO, List<MultipartFile> list) throws Exception;
		
		public MemberVO getBoardwriter(BoardVO boardVO) throws Exception;

		public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception;

		public int setUpdate(AnnouncementVO boardVO) throws Exception;

		public int setDelete(AnnouncementVO boardVO) throws Exception;

		public FileVO getFileDetail(FileVO fileVO) throws Exception;

		public int addComment(CommentVO comment) throws Exception;

		public List<CommentVO> getComments(Long board_no) throws Exception;


		// 게시글 좋아요 증가

		public void likeAnnouncement(Long board_no) throws Exception;

		public void unlikeAnnouncement(Long board_no)throws Exception;
		
		// 좋아요 기록 저장
		public void saveLike(LikeVO likeVO) throws Exception;

		// 이미 좋아요를 누른 기록이 있는지 확인
		public boolean hasLiked(Long board_no, String reg_id) throws Exception;

		// 좋아요 기록 삭제
		public void deleteLike(LikeVO likeVO) throws Exception;
		
		public void increaseViews(Long board_no) throws Exception;

}