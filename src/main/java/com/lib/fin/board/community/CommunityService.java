package com.lib.fin.board.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.FileVO;


import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class CommunityService implements BoardService{
	
	
	@Override
	public List<BoardVO> getList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addWriting(BoardVO boardVO, List<MultipartFile> list) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getDetail(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
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
