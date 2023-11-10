package com.lib.fin.board.announcement;


import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;
import org.apache.tomcat.util.file.ConfigurationSource.Resource;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lib.fin.board.BoardFileVO;
import com.lib.fin.board.BoardVO;
import com.lib.fin.board.LikeVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.FileVO;
import com.lib.fin.commons.Pager;
import com.lib.fin.member.MemberService;
import com.lib.fin.member.MemberVO;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class AnnouncementController {

	@Autowired
	private AnnouncementServiceImp announcementService;

	@Autowired
	private MemberService memberService;

	@Value("${app.upload}")
	private String serverFilePath;
	
	@Value("${app.board.announce}")
	private String directory;

	@GetMapping("announcement")
	public ModelAndView goAnnouncement(@AuthenticationPrincipal MemberVO memberVO, Pager pager, ModelAndView mv)
			throws Exception {

		List<BoardVO> list = announcementService.getList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("board/announcement/announcementlist");
		return mv;
	}



	@GetMapping("annDetail")
	public ModelAndView goAnnouncementDetail(@AuthenticationPrincipal MemberVO memberVO, AnnouncementVO announcementVO,
			ModelAndView mv, HttpSession session) throws Exception {

		mv.setViewName("board/announcement/anndetail");
		AnnouncementVO boardVO = announcementService.getDetail(announcementVO);

		Boolean isViewed = (Boolean) session.getAttribute("viewed_" + boardVO.getBoard_no());

		if (isViewed == null || !isViewed) {
			announcementService.increaseViews(boardVO);
			session.setAttribute("viewed_" + boardVO.getBoard_no(), true);
		}

		
		List<BoardFileVO> filelist = announcementService.getFileDetail(announcementVO);

		List<CommentVO> comments = announcementService.getComments(boardVO.getBoard_no());
		if (boardVO.getReg_id().equals(memberVO.getEmp_no())) {
			mv.addObject("ready", "A");
		} else {
			mv.addObject("ready", "B");
		}
		mv.addObject("files", filelist);
		mv.addObject("data", boardVO);
		mv.addObject("comments", comments);

		return mv;
	}
	
	@GetMapping("fileDown/{file_no}")
	public void getFileDown(@PathVariable Long file_no, HttpServletResponse response) throws Exception {
	    log.info("Download file with ID: {}", file_no);

	    BoardFileVO boardFileVO = announcementService.getFileInfo(file_no);
	    String fileName = boardFileVO.getFile_name();
	    
	    
	    String filePath = serverFilePath+directory+"/" + fileName;

	    File file = new File(filePath);
	    InputStream in = new FileInputStream(file);

	    response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
	    response.setContentLength((int) file.length());
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileName, "UTF-8") + "\"");
	    response.setHeader("Content-Transfer-Encoding", "binary");

	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	    response.getOutputStream().close();
	}

	
	
	@GetMapping("addAnn")
	public String goAddAnn(@AuthenticationPrincipal MemberVO memberVO, Model model) throws Exception {
		model.addAttribute("member", memberVO);
		return "board/announcement/annadd";
	}

	@PostMapping("addAnn")
	public String addAnnouncementWritten(@AuthenticationPrincipal MemberVO memberVO, AnnouncementVO announcementVO,
			List<MultipartFile> files1) throws Exception {

		announcementVO.setReg_id(memberVO.getEmp_no());
		int result = announcementService.addWriting(announcementVO, files1);

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
	public String setUpdate(AnnouncementVO announcementVO, Model model) throws Exception {
		announcementVO = announcementService.getDetail(announcementVO);
		model.addAttribute("board", announcementVO);
		return "board/announcement/annmodify";
	}

	@PostMapping(value = "modifyBoard")
	public String modifyBoard(AnnouncementVO announcementVO, Model model) throws Exception {
		int result = announcementService.setUpdate(announcementVO);
		return "redirect:./announcement";
	}

	@ResponseBody
	@PostMapping("likeAnnouncement/{board_no}")
	public ResponseEntity<String> likeAnnouncement(@PathVariable Long board_no,
			@AuthenticationPrincipal MemberVO memberVO) throws Exception {
		String reg_id = memberVO.getEmp_no();
		if (!announcementService.hasLiked(board_no, reg_id)) {
			LikeVO likeVO = new LikeVO();
			likeVO.setBoard_no(board_no);
			likeVO.setReg_id(reg_id);
			announcementService.likeAnnouncement(board_no);
			announcementService.saveLike(likeVO);
			return new ResponseEntity<>("Liked", HttpStatus.OK);
		}
		return new ResponseEntity<>("Already Liked", HttpStatus.BAD_REQUEST);
	}

	@ResponseBody
	@PostMapping("unlikeAnnouncement/{board_no}")
	public ResponseEntity<String> unlikeAnnouncement(@PathVariable Long board_no,
			@AuthenticationPrincipal MemberVO memberVO) throws Exception {
		String reg_id = memberVO.getEmp_no();
		if (announcementService.hasLiked(board_no, reg_id)) {
			LikeVO likeVO = new LikeVO();
			likeVO.setBoard_no(board_no);
			likeVO.setReg_id(reg_id);
			announcementService.unlikeAnnouncement(board_no);
			announcementService.deleteLike(likeVO);
			return new ResponseEntity<>("Unliked", HttpStatus.OK);
		}
		return new ResponseEntity<>("Not Liked", HttpStatus.BAD_REQUEST);
	}



}