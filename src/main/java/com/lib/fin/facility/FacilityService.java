package com.lib.fin.facility;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;
@Service
public class FacilityService {

	@Autowired
	private FacilityDAO facilityDAO;
	
	public int setFacilityAdd(FacilityVO facilityVO) throws Exception {
		return facilityDAO.setFacilityAdd(facilityVO);
	}
	
	public List<FacilityVO> getFacilitylist(Pager pager) throws Exception{
		return facilityDAO.getFacilitylist(pager);
	}
	
	public int setFacilityUpdate(FacilityVO facilityVO) throws Exception{
		return facilityDAO.setFacilityUpdate(facilityVO);
	}
	
	public int setFacilityDelete(FacilityVO facilityVO) throws Exception{
		return facilityDAO.setFacilityDelete(facilityVO);
	}
	

}
