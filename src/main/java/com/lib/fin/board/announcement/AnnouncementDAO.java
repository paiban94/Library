package com.lib.fin.board.announcement;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lib.fin.board.BoardDAO;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.FileVO;
import com.lib.fin.board.comment.CommentVO;

@Mapper
public interface AnnouncementDAO {

	public List<AnnouncementVO> getList() throws Exception;

	public int addWriting(AnnouncementVO boardVO) throws Exception;

	public int fileAdd(FileVO fileVO) throws Exception;

	public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception;

	public int setUpdate(AnnouncementVO boardVO) throws Exception;

	public int setHitUpdate(AnnouncementVO boardVO) throws Exception;

	public int setDelete(AnnouncementVO boardVO) throws Exception;

	public FileVO getFileDetail(FileVO fileVO) throws Exception;

	/**
	 * comment
	 */

	public int addComment(CommentVO comment) throws Exception;

	public List<CommentVO> getComments(Long board_no) throws Exception;

	/**
	 * like부분
	 * @return 
	 **/
	public int increaseLike(Long boardNo) throws Exception;

}
