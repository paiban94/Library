package com.lib.fin.board;

import java.util.List;

import com.lib.fin.commons.FileVO;



public interface BoardDAO {

	
	public List<BoardVO> getList()throws Exception;
	
	public int addWriting(BoardVO boardVO)throws Exception;
	
	public int fileAdd(FileVO fileVO)throws Exception;
	
	public BoardVO getDetail(BoardVO boardVO)throws Exception;
	
	public int setUpdate (BoardVO boardVO)throws Exception;
	
	public int setHitUpdate (BoardVO boardVO)throws Exception;
	
	public int setDelete(BoardVO boardVO)throws Exception;
	
	public FileVO getFileDetail(FileVO fileVO)throws Exception;
	
	;
	
}
