package com.lib.fin.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	

	@GetMapping("/d")
	public void getd() {

		
	}


	@GetMapping("/test")
	public String test() {
		return "test";
	}

	@GetMapping("/ksg")
	public void ksg() {
		

	}

}