package com.lib.fin.board.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {

    public List<CommentVO> getCommentsByBoardId(Long boardId);
    
    public int addComment(CommentVO comment);
}
