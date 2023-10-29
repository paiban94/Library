package com.lib.fin.schedule;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lib.fin.commons.CommonVO;
import java.util.ArrayList;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ScheduleVO extends CommonVO {
	
	private int schedule_no;
	private String emp_no;
	private Date schedule_start_time;
	private Date schedule_end_time;
	private String schedule_contents;
	private String schedule_title;
	private String schedule_kind;

	@Autowired
	private List<ScheduleVO> schedulelist = new ArrayList<>();
}
