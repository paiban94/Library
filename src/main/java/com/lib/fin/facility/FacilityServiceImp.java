package com.lib.fin.facility;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lib.fin.commons.Pager;
@Service
public class FacilityServiceImp implements FacilityService {
	
	@Autowired
	private FacilityDAO facilityDAO;
	@Override
	public List<FacilityVO> getFacilityList(Pager pager)throws Exception{
		pager.makeRowNum();
		pager.makePageNum(facilityDAO.getTotal(pager));
		List<FacilityVO> list = facilityDAO.getFacilitylist(pager);
		for (FacilityVO facilityVO : list) {			
		
		
		}
		return list;
	}
	@Override
	public int getTotalFacilityCount() throws Exception{
		return facilityDAO.getTotalFacilityCount();
	}
	@Override
	public int setFacilityAdd(FacilityVO facilityVO) throws Exception{
		return facilityDAO.setFacilityAdd(facilityVO);
	};
	@Override
	public int setFacilityUpdate(FacilityVO facilityVO) throws Exception{
		return facilityDAO.setFacilityUpdate(facilityVO);
	};
	@Override
	public int setFacilityDelete(FacilityVO facilityVO) throws Exception{
		return facilityDAO.setFacilityDelete(facilityVO);
	}

	
}
