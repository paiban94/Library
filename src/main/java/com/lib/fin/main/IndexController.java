package com.lib.fin.main;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@GetMapping("/")
	public String getIndex() {
		//로그인 시 권한 확인
		SecurityContext context = SecurityContextHolder.getContext();

		Authentication b = context.getAuthentication();
		return "/index";
	}

	@GetMapping("/member/assets/img/logo.png")
	public String getIndex1() {
		SecurityContext context = SecurityContextHolder.getContext();

		Authentication b = context.getAuthentication();
		return "/index";
	}
}