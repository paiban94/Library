package com.lib.fin.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
@Service
public class ScheduleService {
	private final ScheduleDAO scheduleDAO = new ScheduleDAO();
	
	public List<ScheduleVO> showSchedule()throws Exception{
		return scheduleDAO.showSchedule();
	}
	
	public void addSchedule(ScheduleVO scheduleVO)throws Exception{
		scheduleDAO.addSchedule(scheduleVO);
	}
  }

