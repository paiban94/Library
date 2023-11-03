package com.lib.fin.member;

import com.lib.fin.commons.CommonVO;
import com.lib.fin.commons.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class MemberFileVO extends CommonVO{
	private String img_file;
	private String emp_no;
	private String img_file_name;
	private String img_file_path;
	private String img_role;
}
