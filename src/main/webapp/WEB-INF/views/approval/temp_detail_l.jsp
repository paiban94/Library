<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
											<div class="row mx-3 text-center">
												<div class="col-lg-12">
												<table class="table table-bordered">
													<tr>
														<th class="table-light" style="width: 12%">제목</th>
														<td> ${docVO.doc_title}</td>
													</tr>
													<tr>
														<th class="table-light">휴가종류</th>
														<td> ${docVO.adtn_info1}</td>
													</tr>
													<tr>
														<th class="table-light">기간 및 일시</th>
														<td>${docVO.start_date} ~ ${docVO.end_date} </td>
													</tr>
													<tr>
														<th class="table-light"">반차</th>
														<td>
															${docVO.adtn_info2}
														</td>
													</tr>
													<tr>
														<th class="table-light">연차일수</th>
														<td></td>
													</tr>
									
													<tr >
														<td colspan="2"> 
															${docVO.doc_contents}
														</td>
														
													</tr>
												</table>	
												</div>
												
											</div>
										<!-- 본문 end  -->