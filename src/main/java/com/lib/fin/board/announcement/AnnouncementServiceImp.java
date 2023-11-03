package com.lib.fin.board.announcement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.FileVO;
import com.lib.fin.board.comment.CommentVO;


@Service
public class AnnouncementServiceImp implements AnnouncementService{
	
	@Autowired
	private AnnouncementDAO announcementDAO;

	@Override
	public List<AnnouncementVO> getList() throws Exception {
		return announcementDAO.getList();
	}

	@Override
	public int addWriting(AnnouncementVO boardVO, List<MultipartFile> list) throws Exception {
		int result= announcementDAO.addWriting(boardVO);
		return result;
	}

	@Override
	public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception {
		
		return announcementDAO.getDetail(boardVO);
	}

	@Override
	public int setUpdate(AnnouncementVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(AnnouncementVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addComment(CommentVO comment)  throws Exception{
		int result = announcementDAO.addComment(comment);
		return result;
	}

	@Override
	public List<CommentVO> getComments(Long board_no)  throws Exception{
		return announcementDAO.getComments(board_no);
	}

	@Override
	public int increaseLike(Long boardNo) throws Exception {
		return announcementDAO.increaseLike(boardNo);
		
	}


}
