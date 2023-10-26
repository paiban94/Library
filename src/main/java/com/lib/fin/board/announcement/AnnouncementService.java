package com.lib.fin.board.announcement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.FileVO;


@Service
public class AnnouncementService implements BoardService{
	
	@Autowired
	private AnnouncementDAO announcementDAO;

	@Override
	public List<BoardVO> getList() throws Exception {
		return announcementDAO.getList();
	}

	@Override
	public int addWriting(BoardVO boardVO, List<MultipartFile> list) throws Exception {
		int result= announcementDAO.addWriting(boardVO);
		return result;
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		
		return announcementDAO.getDetail(boardVO);
	}

	@Override
	public int setUpdate(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
