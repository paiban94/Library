package com.lib.fin.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface BoardService {
	
	public List<BoardVO> getList()throws Exception;
	
	public int addWriting(BoardVO boardVO, List<MultipartFile> list)throws Exception;
	
	public BoardVO getDetail(BoardVO boardVO)throws Exception;
	
	public int setUpdate (BoardVO boardVO)throws Exception;
	
	public int setDelete(BoardVO boardVO)throws Exception;
	
	public FileVO getFileDetail(FileVO fileVO)throws Exception;

}
