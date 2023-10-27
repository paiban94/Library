package com.lib.fin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/dept/*")
@Slf4j
public class DeptController {

	@Autowired
	DeptService deptService;
	
	
	@RequestMapping	("/getDeptInfo")
	public void getDeptInfo(ServletRequest r, ServletResponse s) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		
        
		List<Map<String,Object>> deptList= deptService.getDeptInfo();
		
		
		
		resultMap.put("deptList", deptList);
		JSONObject resultJson = new JSONObject(resultMap);
		
		s.getWriter().write(resultJson.toJSONString());
	}

}
