package com.lib.fin.commons;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO extends CommonVO {

	private Long file_no;
	private String file_name;
	private String file_oriName;
}
