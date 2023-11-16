package com.lib.fin.commons;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.lib.fin.member.MemberVO;

@Component
public class FileManagerProfile {

    public String save(String path, MultipartFile multipartFile, MemberVO memberVO) throws Exception {
    		//file 저장 후 파일명 리턴
    		//어디에?, 어떤파일을?
    		//1. 파일 객체 생성
    		File file = new File(path);

            if (!file.exists()) {
                file.mkdirs();
            }
            //2. 저장할 파일명 생성
        	//String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
            String fileName = memberVO.getEmp_no()+ "_"+ multipartFile.getOriginalFilename();
            	
            //파일을 저장
            file = new File(file, fileName);

            multipartFile.transferTo(file);

            return fileName;
        
        
    }


    
}
