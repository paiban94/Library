<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<div class="row mx-3 text-center">
												<div class="col-lg-12">
												<table class="table table-bordered">
													<tr>
														<th class="table-light" style="width: 12%">제목</th>
														<td>${docVO.doc_title}</td>
													</tr>
													<tr>
														<th class="table-light">작성일자</th>
														<td>${docVO.start_date}</td>
													</tr>
													<tr>
														<th class="table-light">작성자</th>
														<td>${docVO.name}</td>
													</tr>
													<tr>
														<th class="table-light"">총금액</th>
														
														<td>
														${docVO.adtn_info1}
															
														</td>
													</tr>
												
							
													<tr >
														<td colspan="2"> <div><textarea id="summernote"></textarea></div></td>
														
													</tr>
												</table>	
												</div>
												
											</div>