package com.lib.fin.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String getIndex() {
		return "index";
	}
	

	@GetMapping("/abc")
	public void getabc() {
		
	}
}