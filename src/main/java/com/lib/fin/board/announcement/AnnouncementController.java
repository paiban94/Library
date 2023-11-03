package com.lib.fin.board.announcement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.board.BoardService;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.board.community.CommunityVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class AnnouncementController {

	@Autowired
	private AnnouncementServiceImp announcementService;

	@GetMapping("announcementlist")
	@ResponseBody
	public List<AnnouncementVO> getList() throws Exception {

		return announcementService.getList();
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

    @PostMapping("likeAnnouncement")
    @ResponseBody
    public String likeAnnouncement(AnnouncementVO announcementVO) throws Exception {
    	log.info("================== Like ===================");
    	log.info("================Like number : "+announcementVO.getBoard_no().toString());
    	int result =  announcementService.increaseLike(announcementVO.getBoard_no());
        return "commons/result"; 
    }
}
