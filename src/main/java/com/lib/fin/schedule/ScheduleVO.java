package com.lib.fin.schedule;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lib.fin.commons.CommonVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter

public class ScheduleVO extends CommonVO {
	
	private int schedule_No;
	private String emp_No;
	private int schedule_start_time;
	private int schedule_end_time;
	private String schedule_contents;
	private String schedule_title;
	private String schedule_kind;

	@Autowired
	private List<ScheduleVO> schedulelist;
}
