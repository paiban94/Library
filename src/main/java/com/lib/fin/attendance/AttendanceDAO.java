package com.lib.fin.attendance;

import org.apache.ibatis.annotations.Mapper;
import java.util.Map;
@Mapper
public interface AttendanceDAO {

	int insertStartWork(String emp_no);
	
	AttendanceVO checkWorkTime(Map<String, Object> param);
	
	int updateEndWork(Map<String, Object> param);
	
	int updateDayWorkTime(Map<String, Object> param);
	
	int updateStartWork(Map<String, Object> param);
	
	int updateDayWorkTimeHalf(Map<String, Object> param);
}
