package com.lib.fin.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.schedule.ScheduleService;
import com.lib.fin.schedule.ScheduleVO;

@Controller
@RequestMapping("/reservation/*")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("getReservation")
	public ModelAndView getReservation() throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> listMap = new HashMap<>();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/reservation/reservation");
		List<Map<String, Object>> events = reservationService.getReservationList();
		
		JSONObject json = new JSONObject();
		json.put("List", events );
		
		
		mv.addObject("List" ,json);
		
		
		
		
		return mv;
		      
		 
	}
	
	@PostMapping("add")
	public String setReservationAdd(HttpServletRequest request, ReservationVO reservationVO)throws Exception{ 
			        
		 int result = reservationService.setReservationAdd(reservationVO);
		
		 return "redirect:./getReservation";
	}
	
	@GetMapping("reservationList")
	@ResponseBody
	public JSONObject getEvents(ReservationVO reservationVO) throws Exception{
		JSONObject resultJson = new JSONObject();

	    return resultJson;
	}
	
	
	@PostMapping("update")
	public String setReservationUpdate(ReservationVO reservationVO)throws Exception{;
		 
		int result = reservationService.setReservationUpdate(reservationVO);
		return "redirect:./reservation";
	}
	
	@PostMapping("delete")
	public String setReservationDelete(ReservationVO reservationVO) throws Exception{
		int result = reservationService.setReservationDelete(reservationVO);
		return "redirect:./reservation";
	}
	
}
