package com.lib.fin.commons;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class CommonJava {
	
	  public static HashMap<String, Object> getParameterMap(HttpServletRequest request){



	        HashMap<String, Object> parameterMap = new HashMap<String, Object>();

	           Enumeration enums = request.getParameterNames();

	           

	           while(enums.hasMoreElements()){

	              String paramName = (String)enums.nextElement();

	              String[] parameters = request.getParameterValues(paramName);
	               System.out.println("========paramName :"+paramName);
	               System.out.println("========paramNValue :"+ request.getParameter(paramName));
	               
	        

	              if(parameters.length > 1){

	                 parameterMap.put(paramName, parameters);

	              }else{

	                 parameterMap.put(paramName, parameters[0]);

	              }

	           }

	        

	           return parameterMap;

	        }

}
