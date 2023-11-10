<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
     <input type="hidden" id="grp_cd" name="grp_cd" value="H">
<div class="row mx-3 text-center">
												<div class="col-lg-12">
												<table class="table table-bordered">
													<tr>
														<th class="table-light" style="width: 12%">제목</th>
														<td>
															<input type="text" class="form-control w-75" id="title" name="doc_title">
														</td>
													</tr>
													<tr>
														<th class="table-light">휴가종류</th>
														<td>
															<select class="form-select" aria-label="Default select example" name="adtn_info1">
															  <option value="B">연차</option>
															  <option value="A">조퇴</option>
															</select>
														</td>
													</tr>
													<tr>
														<th class="table-light">기간 및 일시</th>
														<td>
														<div style="display: flex; gap: 10px;">
														    <input type="date" class="form-control w-25" id="startDate" name="start_date">
														    <span>~</span>
														    <input type="date" class="form-control w-25" id="endDate" name="end_date">
														</div>
														</td>
													</tr>
													<tr>
														<th class="table-light"">반차</th>
														<td>
														<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="adtn_info2" id="inlineRadio1" value="option1">
														  <label class="form-check-label" for="inlineRadio1">오전</label>
														</div>
														<div class="form-check form-check-inline">
														  <input class="form-check-input" type="radio" name="adtn_info2" id="inlineRadio2" value="option2">
														  <label class="form-check-label" for="inlineRadio2">오후</label>
														</div>
															
														</td>
													</tr>
													<tr>
														<th class="table-light">연차일수  </th>
														
														<td>잔여연차: <span id="id1"><sec:authentication property="principal.remain_holiday" /></span>  신청연차:<span id="id2"></span> </td>
													</tr>
											
													<tr >
															<td colspan="2">
																<div>
																	<textarea id="summernote" name="doc_contents"></textarea>
																</div>
															</td>
														
													</tr>
												</table>	
												</div>
												
											</div>
											
											<script>
												$("#endDate").change(function(){
													console.log("ddd")
													
													const date1 = new Date($("#startDate").val());
													const date2 = new Date($("#endDate").val());
													
													const diffDate = date2.getTime()- date1.getTime();
													
													let d = diffDate /(1000*60*60*24);
													
													$("#id2").html(d);
													
													let remain = $("#id1").text() - d;
													
													$("#id1").text(remain);
													
													
												})
					
											</script>