package com.lib.fin.schedule;

import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import java.util.ArrayList;
import javax.inject.Inject;

@Repository
@Slf4j
public class ScheduleDAO {
	@Inject
	private SqlSession sql;
	
	private final String NAMESPACE="com.lib.fin.schedule.ScheduleDAO";
	

	public List<ScheduleVO> showSchedule()throws Exception{
		return sql.selectList(NAMESPACE+".showSchedule");
	}
	
	public void addSchedule(ScheduleVO scheduleVO)throws Exception{
		sql.insert(NAMESPACE+".addSchedule",scheduleVO);
	}
	
}
