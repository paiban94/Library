package com.lib.fin.attendance;

import org.springframework.stereotype.Service;

@Service
public class AttendanceService {
	
	private AttendanceDAO attendanceDAO;
	
	public int setGtw_time(AttendanceVO attendanceVO)throws Exception{
		return attendanceDAO.setGtw_time(attendanceVO);
	};
}
