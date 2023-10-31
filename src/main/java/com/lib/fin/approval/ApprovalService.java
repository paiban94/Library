package com.lib.fin.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.commons.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalService {
	
	@Value("${app.upload}")
	private String filePath;
	
	@Value("${app.approval.draft}")
	private String approvalName;
	
	
	
	@Autowired
	private FileManager fileManager;
	
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	public int setDraft(ApprovalDocVO approvalDocVO,ApprovalHisVO approvalHisVO ,MultipartFile[] files)throws Exception{
		
		String path = this.filePath+this.approvalName;
		int result= approvalDAO.setDraft(approvalDocVO);
		
		log.info("===============path: {} =========",path);
		log.info("===============path: {} =========",filePath);
		log.info("===============path: {} =========",approvalName);
		
		
		
		if(files != null) {
			for(MultipartFile multipartFile: files) {
				
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				ApprovalFileVO approvalFileVO = new ApprovalFileVO();
				String fileName = fileManager.save(path, multipartFile);
				approvalFileVO.setDoc_no(approvalDocVO.getDoc_no());
				approvalFileVO.setFile_name(fileName);
				approvalFileVO.setFile_path(path);
				result = approvalDAO.setFileAdd(approvalFileVO);
				
				
			}
			
		}
			
		return result;
	}

}
