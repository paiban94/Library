package com.lib.fin.board;

import java.util.List;

import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class LikeVO extends CommonVO{
	
	private Long board_no;
}
