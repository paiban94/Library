package com.lib.fin.facility;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;
@Service
public interface FacilityService {


	
	public int setFacilityAdd(FacilityVO facilityVO) throws Exception;
		
	public int getTotalFacilityCount()throws Exception;
	
	public List<FacilityVO> getFacilityList(Pager pager) throws Exception;
	
	public int setFacilityUpdate(FacilityVO facilityVO) throws Exception;
	
	public int setFacilityDelete(FacilityVO facilityVO) throws Exception;
	


}
