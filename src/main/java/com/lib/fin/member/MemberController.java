package com.lib.fin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("member/*")
@Slf4j
public class MemberController {
	//회원가입 페이지 출력 요청
	@GetMapping("join")
	public String memJoin () throws Exception {
		return "/" ;
	}

}
