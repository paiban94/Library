package com.lib.fin.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/book/*")
public class BookControl {
	@GetMapping("booklist")
	public String getBooklist() throws Exception {
		return "book/booklist";
	}
}
