package com.lib.fin.board.announcement;

import java.sql.Date;
import java.util.List;

import com.lib.fin.board.BoardVO;
import com.lib.fin.board.comment.CommentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AnnouncementVO extends BoardVO {
	
	private String board_kind;
	private List<CommentVO> comments;
}
