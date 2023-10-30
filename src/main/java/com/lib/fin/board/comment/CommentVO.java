package com.lib.fin.board.comment;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import com.lib.fin.commons.CommonVO;


@Getter
@Setter
@ToString
public class CommentVO extends CommonVO{

	private Long comment_no;
	private Long board_no;
	private String comment_content;
	
}
