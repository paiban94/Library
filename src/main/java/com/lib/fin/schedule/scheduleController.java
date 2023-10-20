package com.lib.fin.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reservation/*")
@Slf4j
public class scheduleController {

	@GetMapping("calendar")
	public void getSchedule() {
		
	}

}
