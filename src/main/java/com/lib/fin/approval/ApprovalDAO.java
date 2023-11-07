package com.lib.fin.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface ApprovalDAO {
	
	//fileADD
	public int setFileAdd(ApprovalFileVO approvalFileVO)throws Exception;
	
	//draft Add
	public int setDraft(ApprovalDocVO approvalDocVO)throws Exception;
	
	//draft detail
	public ApprovalDocVO getDraftDetail(ApprovalDocVO approvalDocVO)throws Exception;

	//his add
	public int setApprovalHis(ApprovalHisVO approvalHisVO)throws Exception;
	
	//docLis
	public List<ApprovalDocVO> getAppDocList(String emp_no)throws Exception;

}
