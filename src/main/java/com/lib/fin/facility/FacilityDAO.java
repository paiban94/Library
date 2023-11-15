package com.lib.fin.facility;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lib.fin.commons.Pager;

import lombok.extern.slf4j.Slf4j;
@Mapper

public interface FacilityDAO {

	public int getCount(Pager pager)throws Exception;
	
	public int setFacilityAdd(FacilityVO facilityVO) throws Exception;
		
	public List<FacilityVO> getFacilitylist() throws Exception;
	
	public int setFacilityUpdate(FacilityVO facilityVO) throws Exception;
	
	public int setFacilityDelete(FacilityVO facilityVO) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public int getTotalFacilityCount()throws Exception;
	
	public List<FacilityVO> getPaginatedList(int startRow, int pageSize)throws Exception;
}
