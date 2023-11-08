package com.lib.fin.board.announcement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.BoardVO;
import com.lib.fin.board.LikeVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.FileManager;
import com.lib.fin.commons.FileVO;
import com.lib.fin.commons.Pager;
import com.lib.fin.member.MemberVO;

@Service
public class AnnouncementServiceImp implements AnnouncementService {

	@Autowired
	private AnnouncementDAO announcementDAO;

	@Value("${app.upload}")
	private String filePath;

	@Value("${app.board.announce}")
	private String announceName;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<BoardVO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(announcementDAO.getTotal(pager));
		List<BoardVO> list = announcementDAO.getList(pager);
		for (BoardVO boardVO : list) {
			
			System.out.println("=====Test id : "+boardVO.getReg_id());
			MemberVO memberVO = announcementDAO.getBoardwriter(boardVO);
			boardVO.setBoard_wirter(memberVO.getName() + " " + memberVO.getEmp_position());
		}
		return list;
	}

	@Override
	public int getTotalAnnouncementCount() throws Exception {
		return announcementDAO.getTotalAnnouncementCount();
	}

	@Override
	public int addWriting(AnnouncementVO boardVO, List<MultipartFile> list) throws Exception {
		int result = announcementDAO.addWriting(boardVO);
		return result;
	}

	@Override
	public MemberVO getBoardwriter(BoardVO boardVO) throws Exception {
		return announcementDAO.getBoardwriter(boardVO);
	}

	@Override
	public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception {
		boardVO = announcementDAO.getDetail(boardVO);
		MemberVO memberVO = announcementDAO.getBoardwriter(boardVO);
		boardVO.setBoard_wirter(memberVO.getName() + " " + memberVO.getEmp_position());
		System.out.println("detail : person2" + boardVO.getBoard_wirter());
		return boardVO;
	}

	@Override
	public int setUpdate(AnnouncementVO boardVO) throws Exception {
		return announcementDAO.setUpdate(boardVO);
	}

	@Override
	public int setDelete(AnnouncementVO boardVO) throws Exception {

		return announcementDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addComment(CommentVO comment) throws Exception {
		int result = announcementDAO.addComment(comment);
		return result;
	}

	@Override
	public List<CommentVO> getComments(Long board_no) throws Exception {
		return announcementDAO.getComments(board_no);
	}

	@Override
	public void likeAnnouncement(Long board_no) throws Exception {
	    announcementDAO.likeAnnouncement(board_no);
		
	}

	@Override
	public void unlikeAnnouncement(Long board_no) throws Exception {
		  announcementDAO.unlikeAnnouncement(board_no);
		
	}

	@Override
	public void saveLike(LikeVO likeVO) throws Exception {
		 announcementDAO.saveLike(likeVO);
		
	}

	@Override
	public boolean hasLiked(Long board_no, String reg_id) throws Exception {
		return announcementDAO.hasLiked(board_no, reg_id) != null;
	}

	@Override
	public void deleteLike(LikeVO likeVO) throws Exception {
		 announcementDAO.deleteLike(likeVO);
		
	}
	@Override
	public void increaseViews(Long board_no) throws Exception {
	    announcementDAO.increaseViews(board_no);
	}


}