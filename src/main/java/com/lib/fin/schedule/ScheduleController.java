package com.lib.fin.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule/*")
@Slf4j
public class ScheduleController {

	private ScheduleService scheduleService;
	
	//일정보기
			@GetMapping("calendar")
			public ModelAndView getScheduleList(ModelAndView mv, HttpServletRequest request) {
				String viewpage = "calendar";
				List<ScheduleVO> scheduleList;
				
				try {
					scheduleList = scheduleService.getSchedule();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				mv.setViewName(viewpage);
				return mv;
			}
			@GetMapping("schedulelist")
			public void getSchedulelist() {}
		}

