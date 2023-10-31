package com.lib.fin.schedule;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("schedule")
	public String getSchedule() throws Exception{
		 
		 return "schedule/schedule";
	}
	
	@PostMapping("add")
	public String setScheduleAdd(HttpServletRequest request, ScheduleVO scheduleVO)throws Exception{ 
			        
		 int result = scheduleService.setScheduleAdd(scheduleVO);
		
		 return "redirect:./schedule";
	}
	
	@GetMapping("scheduleList")
	@ResponseBody
	public List<ScheduleVO> getEvents(ScheduleVO scheduleVO) throws Exception{
	    List<ScheduleVO> events = scheduleService.getScheduleList(scheduleVO);
	    
	    return events;
	}
	
	
	@PostMapping("update")
	public String setScheduleUpdate(ScheduleVO scheduleVO)throws Exception{;
		 
		int result = scheduleService.setScheduleUpdate(scheduleVO);
		return "redirect:./schedule";
	}
	
	@PostMapping("delete")
	public String setScheduleDelete(ScheduleVO scheduleVO) throws Exception{
		int result = scheduleService.setScheduleDelete(scheduleVO);
		return "redirect:./schedule";
	}
	

}