package com.lib.fin.board.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDAO commentDAO; 

	@Override
	public List<CommentVO> getCommentsByBoardId(Long boardId) {
		
		return null;
	}

	@Override
	public int addComment(CommentVO comment) {
		
		return 0;
	}

}
