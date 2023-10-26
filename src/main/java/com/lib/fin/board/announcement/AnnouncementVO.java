package com.lib.fin.board.announcement;

import java.sql.Date;

import com.lib.fin.board.BoardVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class AnnouncementVO extends BoardVO{
	
	private String board_Type;
	private String board_Kind;
}
