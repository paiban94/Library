package com.lib.fin.commons;

import java.io.File;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	

		public String save(String path, MultipartFile multipartFile)throws Exception{

			
			File file = new File(path);
			
			if(!file.exists()) {
				
				file.mkdirs();
			}
			
			String fileName = multipartFile.getOriginalFilename();

			file = new File(file, fileName);

			multipartFile.transferTo(file);
			
			
			return fileName;
			
		}

}
