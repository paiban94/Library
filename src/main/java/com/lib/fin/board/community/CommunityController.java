package com.lib.fin.board.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.announcement.AnnouncementVO;
import com.lib.fin.commons.Pager;

@Controller
@RequestMapping("/board/*")
public class CommunityController {
	
	
	@Autowired
    private	CommunityService communityService;
	
	@GetMapping("community")
	public ModelAndView goCommunity(Pager pager,ModelAndView mv) throws Exception{
		
		List<BoardVO> list =  communityService.getList(pager);
		mv.addObject("list", list);
		mv.setViewName("board/community/communitylist");
		
		return mv;
	}
	
	@GetMapping("communityDetail")
	public ModelAndView goCommunityDetail(CommunityVO communityVO, ModelAndView mv) throws Exception{
		
		BoardVO boardVO = communityService.getDetail(communityVO);
		mv.setViewName("board/community/communitydetail");
		mv.addObject("data", boardVO);
		return mv;
	}
	
	@GetMapping("addCommunity")
	public String goAddCommunity()throws Exception {
		
		
		return "board/community/communityadd";
	}
	
	@PostMapping("addCommunity")
	public String addCommunity(CommunityVO communityVO,List<MultipartFile> list) throws Exception{
		
		
				
		return "redirect:./communitylist";
	}
}
