package com.lib.fin.attendance;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lib.fin.member.MemberVO;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceControl {

	@GetMapping("attendanceHome")
	public String getAttendance(AttendanceVO attendanceVO)throws Exception{
		return "attendance/attendanceHome";
	}
	@PostMapping("./add")
	public String setGtw_time(@AuthenticationPrincipal MemberVO memberVO)throws Exception{
		return "attendance/attendanceHome";
	}
}
