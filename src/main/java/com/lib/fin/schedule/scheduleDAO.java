package com.lib.fin.schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("scheduleDAO")
public class scheduleDAO {
	@Autowired
	private SqlSession sql;
	
	private final String spacename="com.lib.fin.schedule.scheduleDAO";
	
	public List<scheduleVO> getSchedule() throws Exception {
		List<scheduleVO> schedule = null;
		schedule = sql.selectList("Schdule.scheduleList");
		return schedule;
		
	}
}
