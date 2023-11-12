package com.lib.fin.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceControl {

	@GetMapping("attendanceHome")
	public String getAttendance()throws Exception{
		return "attendance/attendanceHome";
	}
	@PostMapping("./add")
	public String setGtw_time()throws Exception{
		return "attendance/attendanceHome";
	}
}
