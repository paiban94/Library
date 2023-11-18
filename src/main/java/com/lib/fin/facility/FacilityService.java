package com.lib.fin.facility;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;
@Service
public interface FacilityService {


	public List<FacilityVO> getFacilityList()throws Exception;
	
	public List<FacilityVO> getPaginatedList(int page, int pageSize) throws Exception;

	public int getTotalFacilityCount()throws Exception;

	public int setFacilityAdd(FacilityVO facilityVO) throws Exception;
		
	public int setFacilityUpdate(FacilityVO facilityVO) throws Exception;
	
	public int setFacilityDelete(FacilityVO facilityVO) throws Exception;
	

}
