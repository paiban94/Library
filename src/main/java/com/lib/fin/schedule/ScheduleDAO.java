package com.lib.fin.schedule;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import com.lib.fin.schedule.ScheduleVO;

@Repository
@Slf4j
public class ScheduleDAO {
	@Autowired
	private SqlSession sql;
	
	private final String NAMESPACE="com.lib.fin.schedule.ScheduleDAO.";
	

	public List<ScheduleVO> showSchedule(Map<String,Object> map)throws Exception{
		return sql.selectList(NAMESPACE+"showSchedule",map);
		
	}
	
	public void addSchedule(ScheduleVO scheduleVO)throws Exception{
		sql.insert(NAMESPACE+"addSchedule",scheduleVO);
	}
	
}
