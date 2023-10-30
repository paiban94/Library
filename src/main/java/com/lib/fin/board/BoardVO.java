package com.lib.fin.board;

import java.sql.Date;

import com.lib.fin.commons.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO extends CommonVO {

	private Long board_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Long board_like;
}
