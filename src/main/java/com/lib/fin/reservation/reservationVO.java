package com.lib.fin.reservation;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class reservationVO {

	private int res_No;
	private int facility_No;
	private String emp_No;
	private String grp_cd;
	private Date res_start_time;
	private Date res_end_time;
	private String res_purpose;
	private String reg_Id;
	private String mod_Id;
	private Date reg_date;
	private Date mod_date;
}
