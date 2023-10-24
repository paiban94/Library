package com.lib.fin.member;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	private String emp_no;

	@NotBlank(message = "비밀번호를 입력하세요")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\\\W)(?=\\\\S+$).{6,12}", message = "비밀번호는 6~12자 영문 소문자, 숫자, 특수문자를 사용하세요.")
	private String password;
	
	private String passwordCheck;
	
	@NotBlank(message = "이름을 입력하세요.")
	private String name;
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	
	private String birth;
	
	private String phone;
	
	private String emp_team;
	
	private String emp_position;
	
	private int remain_holiday;
	
	private String authority;
				   
	private Date emp_in_date;
	
	private Date emp_out_date;
	
	private Date reg_date;
	
	private String reg_id;
	
	private Date mod_date;
	
	private String mod_id;
	
	private String use_yn;
}
