package com.lib.fin.attendance;

import java.sql.Timestamp;

import com.lib.fin.commons.CommonVO;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class AttendanceVO extends CommonVO{

	private int atd_no;
	private String emp_no;
	private Timestamp gtw_time;
	private Timestamp lw_time;
	private Timestamp attendanceDate;
}
