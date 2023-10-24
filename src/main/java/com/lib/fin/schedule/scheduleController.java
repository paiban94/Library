package com.lib.fin.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule/*")
@Slf4j
public class scheduleController {


	
	//일정보기
			@RequestMapping(value = "calendar", method = RequestMethod.GET)
			public ModelAndView getScheduleList(ModelAndView mv, HttpServletRequest request) {
				String viewpage = "calendar";
				List<scheduleVO> schedule = null;
				try {
					schedule = scheduleService.getSchedule();
					request.setAttribute("scheduleList", schedule);
				} catch (Exception e) {
					e.printStackTrace();
				}
				mv.setViewName(viewpage);
				return mv;
			}
}
