package com.lib.fin.approval;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ApprovalDAOTest {

	@Autowired
	private ApprovalDAO approvalDAO;
	
	Date date = new Date(2023102);
	

		@Test
		void setUpdateTest()throws Exception{
			ApprovalDocVO approvalDocVO = new ApprovalDocVO();
			approvalDocVO.setEmp_no("20231");
			approvalDocVO.setGrp_cd("A001");
			approvalDocVO.setApproval_state("A002");
			approvalDocVO.setDoc_title("제목");
			approvalDocVO.setDoc_contents("내용");
			approvalDocVO.setStart_date(date);
			approvalDocVO.setTemp_save("n");
			approvalDocVO.setReg_id("20231");
			approvalDocVO.setMod_id("20231");
			approvalDocVO.setUse_yn("y");
			
			int result = approvalDAO.setDraft(approvalDocVO);
			
			assertNotEquals(0, result);
			
		}
	}


