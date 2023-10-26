package com.lib.fin.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class FileMappringConfig implements WebMvcConfigurer {

		//local file 위치
		@Value("${app.upload.mapping}")
		private String filePath;
		
		//요청 URL 경로
		@Value("${app.url.path}")
		private String urlPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//요청 URL /files//**
		registry.addResourceHandler(urlPath)
		
		//Local file 위치
			.addResourceLocations(filePath);
		
	}
	
	
	
	

}
