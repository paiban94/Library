package com.lib.fin.schedule;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/schedule/*")
@Slf4j
public class ScheduleController {

	private final ScheduleService scheduleService = new ScheduleService();

	@ResponseBody
	@RequestMapping(value="/addSchedule",method=RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody ScheduleVO schedulevo)throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		
		scheduleService.addSchedule(schedulevo);
		
		return map;
	}
	
	@RequestMapping(value="/schedule")
	public String Schedule(Model model)throws Exception{
		model.addAttribute("showSchedule",scheduleService.showSchedule());
		
		return "/schedule";
		
	}
	
}
