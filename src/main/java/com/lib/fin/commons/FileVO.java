package com.lib.fin.commons;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {

	private Long file_no;
	private String file_name;
	private String file_path;
	private String reg_id;
	private String mod_id;
	private Date reg_date;
	private Date mod_date;
	private String use_yn;
}
