package com.lib.fin.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardVO {
	
	private Long board_No;
	private String board_Title;
	private String board_Contents;
	private String board_Writer;
	private Date board_Date;
	private Long board_Hit;
}
