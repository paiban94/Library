package com.lib.fin.board.comment;

import java.util.List;

public interface CommentService {

    public List<CommentVO> getCommentsByBoardId(Long boardId);
    
    public int addComment(CommentVO comment);
    
}
