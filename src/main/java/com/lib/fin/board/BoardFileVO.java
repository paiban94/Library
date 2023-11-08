package com.lib.fin.board;

import com.lib.fin.commons.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString
public class BoardFileVO  extends FileVO{
	
	private String file_type;
}
