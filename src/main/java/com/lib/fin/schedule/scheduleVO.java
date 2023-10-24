package com.lib.fin.schedule;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class scheduleVO {
	
	private int schedule_No;
	private String emp_No;
	private int schedule_start_time;
	private int schedule_end_time;
	private String schedule_contents;
	private String schedule_title;
	private String schedule_kind;
	private String reg_Id;
	private String mod_Id;
	private Date reg_date;
	private Date mod_date;
	private String use_yn;
}
