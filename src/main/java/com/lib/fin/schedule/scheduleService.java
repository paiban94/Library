package com.lib.fin.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("scheduleService")
public class scheduleService {

	@Autowired
	private static scheduleDAO scheduleDAO;
	
	public static List<scheduleVO> getSchedule() throws Exception {
		return scheduleDAO.getSchedule();
	}
  }

