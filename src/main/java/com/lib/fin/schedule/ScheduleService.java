package com.lib.fin.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("scheduleService")
public class ScheduleService {

	private static final ScheduleDAO scheduleDAO = new ScheduleDAO();
	
	public static  List<ScheduleVO> getSchedule() throws Exception {
		return scheduleDAO.getSchedule(null);
	}
  }

