package com.lib.fin.board.announcement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;

@Controller
@RequestMapping("/board/*")
public class AnnouncementController {
	
	@Autowired
    private	AnnouncementService announcementService;
	
	
	@GetMapping("announcement")
	public ModelAndView goAnnouncement(ModelAndView mv) throws Exception{
		
		List<BoardVO> list =  announcementService.getList();
		mv.addObject("list", list);
		mv.setViewName("board/announcement/announcementlist");
		
		for (BoardVO boardVO : list) {
			System.out.println(boardVO.toString());
		}
		
		return  mv;
	}
	
	@GetMapping("annDetail")
	public ModelAndView goAnnouncementDetail(AnnouncementVO announcementVO, ModelAndView mv) throws Exception{
		
		BoardVO boardVO = announcementService.getDetail(announcementVO);
		mv.setViewName("board/announcement/anndetail");
		mv.addObject("data", boardVO);
		return mv;
	}
	
	@GetMapping("addAnn")
	public String goAddAnn()throws Exception {
		return "board/announcement/annadd";
	}
	
	@PostMapping("addAnn")
	public String addAnnouncementWritten(AnnouncementVO announcementVO,List<MultipartFile> list) throws Exception{
		
		int result = announcementService.addWriting(announcementVO, list);
				
		return "redirect:./announcement";
	}

}
