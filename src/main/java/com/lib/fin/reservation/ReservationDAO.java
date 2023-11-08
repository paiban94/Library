package com.lib.fin.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface ReservationDAO {

	public int setReservationAdd(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> getReservation(ReservationVO reservationVO) throws Exception;
	
	public int setReservationUpdate(ReservationVO reservationVO) throws Exception;
	
	public int setReservationDelete(ReservationVO reservationVO) throws Exception;
	
	public List<Map<String, Object>> getReservationList() throws Exception;
}
