package com.lib.fin.approval;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

@Mapper
public interface ApprovalDAO {
	
	public int setDraft(ApprovalDocVO approvalDocVO)throws Exception;


}
