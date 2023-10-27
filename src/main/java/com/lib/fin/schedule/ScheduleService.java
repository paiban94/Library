package com.lib.fin.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
import java.util.Map;
import java.util.HashMap;

@Service
public class ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public List<ScheduleVO> showSchedule()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		return scheduleDAO.showSchedule(map);

	}
	
	public void addSchedule(ScheduleVO scheduleVO)throws Exception{
		scheduleDAO.addSchedule(scheduleVO);
	}
  }

