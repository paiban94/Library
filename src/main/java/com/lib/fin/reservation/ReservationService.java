package com.lib.fin.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ReservationService {

	@Autowired
	private ReservationDAO reservationDAO;
	
	public int setReservationAdd(ReservationVO reservationVO) throws Exception {
		return reservationDAO.setReservationAdd(reservationVO);
	}
	
	public List<ReservationVO> getReservation(ReservationVO reservationVO) throws Exception{
		return reservationDAO.getReservation(reservationVO);
	}
	
	public int setReservationUpdate(ReservationVO reservationVO) throws Exception{
		return reservationDAO.setReservationUpdate(reservationVO);
	}
	
	public int setReservationDelete(ReservationVO reservationVO) throws Exception{
		return reservationDAO.setReservationDelete(reservationVO);
	}
	
	public List<Map<String, Object>> getReservationList() throws Exception{
		return reservationDAO.getReservationList();
	}
}
