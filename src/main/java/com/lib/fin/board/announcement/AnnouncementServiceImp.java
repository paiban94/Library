package com.lib.fin.board.announcement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.board.FileVO;
import com.lib.fin.board.comment.CommentVO;
import com.lib.fin.commons.FileManager;

@Service
public class AnnouncementServiceImp implements AnnouncementService {

	@Autowired
	private AnnouncementDAO announcementDAO;

	@Value("${app.upload}")
	private String filePath;

	@Value("${app.approval.announce}")
	private String announceName;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<AnnouncementVO> getList() throws Exception {
		return announcementDAO.getList();
	}

	@Override
	public List<AnnouncementVO> getPaginatedList(Map<String, Object> params) throws Exception {
		int page = (int) params.get("page");
		int pageSize = (int) params.get("pageSize");
		int startRow = (page - 1) * pageSize;

		params.put("startRow", startRow);
		System.out.println("=======search  :");
		List<AnnouncementVO> ar = announcementDAO.getPaginatedList(params);
		System.out.println("=====return List size " + ar.size());
		return ar;
	}

	@Override
	public int getTotalAnnouncementCount() throws Exception {
		return announcementDAO.getTotalAnnouncementCount();
	}

	@Override
	public int addWriting(AnnouncementVO boardVO, List<MultipartFile> list) throws Exception {
		int result = announcementDAO.addWriting(boardVO);
		return result;
	}

	@Override
	public AnnouncementVO getDetail(AnnouncementVO boardVO) throws Exception {

		return announcementDAO.getDetail(boardVO);
	}

	@Override
	public int setUpdate(AnnouncementVO boardVO) throws Exception {
		return announcementDAO.setUpdate(boardVO);
	}

	@Override
	public int setDelete(AnnouncementVO boardVO) throws Exception {

		return announcementDAO.setDelete(boardVO);
	}

	@Override
	public FileVO getFileDetail(FileVO fileVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addComment(CommentVO comment) throws Exception {
		int result = announcementDAO.addComment(comment);
		return result;
	}

	@Override
	public List<CommentVO> getComments(Long board_no) throws Exception {
		return announcementDAO.getComments(board_no);
	}

	@Override
	public void likeAnnouncement(Long board_no) throws Exception {
		announcementDAO.likeAnnouncement(board_no);

	}

	@Override
	public void unlikeAnnouncement(Long board_no) throws Exception {
		announcementDAO.unlikeAnnouncement(board_no);

	}

}