package com.lib.fin.board.announcement;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.board.community.CommunityVO;
import com.lib.fin.commons.CommonJava;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class AnnouncementController {

	@Autowired
	private AnnouncementServiceImp announcementService;

	
//	@ResponseBody
//	@GetMapping("announcementlist")
//	public List<AnnouncementVO> getList() throws Exception {
//
//		return announcementService.getList();
//	}
	@ResponseBody
	@GetMapping("announcementlist")
	public List<AnnouncementVO> getList(@RequestParam("page") int page, @RequestParam("pageSize") int pageSize, HttpServletRequest ret) throws Exception {

		Map<String, Object> params = CommonJava.getParameterMap(ret);
		pageSize = Integer.valueOf((String) params.getOrDefault("rows", "20")) ;
		
		   List<AnnouncementVO> paginatedList = announcementService.getPaginatedList(page, pageSize);
		    return paginatedList;
	}


	@GetMapping("announcement")
	public ModelAndView goAnnouncement(ModelAndView mv) throws Exception {

		List<AnnouncementVO> list = announcementService.getList();
		mv.addObject("list", list);
		mv.setViewName("board/announcement/announcementlist");

		return mv;
	}

	@GetMapping("annDetail")
	public ModelAndView goAnnouncementDetail(AnnouncementVO announcementVO, ModelAndView mv) throws Exception {

		log.info("=================annDetail===================");
		AnnouncementVO boardVO = announcementService.getDetail(announcementVO);
		List<CommentVO> comments = announcementService.getComments(boardVO.getBoard_no());
		
		mv.setViewName("board/announcement/anndetail");
		mv.addObject("data", boardVO);
		mv.addObject("comments", comments);

		return mv;
	}

	@GetMapping("addAnn")
	public String goAddAnn() throws Exception {
		return "board/announcement/annadd";
	}

	@PostMapping("addAnn")
	public String addAnnouncementWritten(AnnouncementVO announcementVO, List<MultipartFile> list) throws Exception {

		int result = announcementService.addWriting(announcementVO, list);

		return "redirect:./announcement";
	}

	@PostMapping("addComment")
	public String addComment(CommentVO comment) throws Exception {
		announcementService.addComment(comment);
		return "redirect:./annDetail?board_no=" + comment.getBoard_no();
	}
	
	
	@PostMapping(value = "deleteBoard", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> setDelete(@RequestBody AnnouncementVO announcementVO) throws Exception {
	    System.out.println("vo String : " + announcementVO.getBoard_no());
	    int result = announcementService.setDelete(announcementVO);
	    
	    if (result > 0) {
	        return new ResponseEntity<>("삭제 되었습니다", HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>("삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	@GetMapping(value = "updateBoard")
    public String setUpdate(AnnouncementVO announcementVO, Model model) throws Exception{
		announcementVO = announcementService.getDetail(announcementVO);
		model.addAttribute("board", announcementVO);
        return "board/announcement/annmodify";
    }
	
	@PostMapping(value = "modifyBoard")
    public String modifyBoard(AnnouncementVO announcementVO, Model model) throws Exception{
		int result = announcementService.setUpdate(announcementVO);
        return "redirect:./announcement";
    }
    
	@ResponseBody
	@PostMapping("likeAnnouncement/{board_no}")
    public String likeAnnouncement(@PathVariable Long board_no) throws Exception{
        announcementService.likeAnnouncement(board_no);
        return "Liked";
    }
    
    @ResponseBody
    @PostMapping("unlikeAnnouncement/{board_no}")
    public String unlikeAnnouncement(@PathVariable Long board_no)throws Exception {
        announcementService.unlikeAnnouncement(board_no);
        return "Unliked";
    }
    
  

}