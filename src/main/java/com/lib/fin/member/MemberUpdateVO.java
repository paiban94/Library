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
public class MemberUpdateVO {
	
	@NotBlank(message = "비밀번호를 입력하세요")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{6,12}", message = "비밀번호는 6~12자 영문 소문자, 숫자, 특수문자를 하나 이상 포함해야 합니다.")
	
	private String newPassword;
	
	private String newPasswordCheck;
	
	
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String newEmail;
	
	private Date birth;
	@NotBlank(message = "핸드폰 번호를 입력하세요")
	private String newPhone;
}
