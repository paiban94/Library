package com.lib.fin.attendance;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Map;
@Mapper
public interface AttendanceDAO {

	int insertStartWork(String emp_no);
	@Select("select count(*) from ATTENDANCE_BASE where emp_no = #{emp_no} AND #{reg_date} = #{time}")
	AttendanceVO checkWorkTime(Map<String, Object> param);
	@Update("update ATTENDANCE_BASE set lw_time = sysdate(), status = '업무종료' where emp_no = #{emp_no} AND #{mod_date} = #{time}")
	int updateEndWork(Map<String, Object> param);
	
	int updateDayWorkTime(Map<String, Object> param);
	
	int updateStartWork(Map<String, Object> param);
	
	int updateDayWorkTimeHalf(Map<String, Object> param);
	@Select("select nvl(sum(dayWorkTime),0) from ATTENDANCE_BASE where emp_no = #{emp_no} and reg_date between #{start} and #{end}+0.5 order by reg_date")
	int weekTotalTime(Map<String, Object> param);
	@Select("select nvl(sum(overtime),0) from ATTENDANCE_BASE where emp_no = #{emp_no} and reg_date between #{start} and #{end} order by reg_date")
	int selectWeekOverTime(Map<String, Object> startEndMap);
}
