package com.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.HealthyInfo;
import com.bean.User;
import com.dao.HealthyInfoDao;

@Service("healthyInfoService")
public class HealthyInfoService {
	@Resource(name="healthyInfoDao")
	HealthyInfoDao healthyInfoDao;
	
	public List<HealthyInfo> selectAllHealthyInfo(int type_id){
		return healthyInfoDao.selectAllHealthyInfo(type_id);
	}
	
	public int updateHealthyInfo(HealthyInfo healthyInfo){
		return healthyInfoDao.updateHealthyInfo(healthyInfo);
	}
	
	public HealthyInfo selectHealthyinfoById(int id){
		return healthyInfoDao.selectHealthyinfoById(id);
	}
	
	public int deleteHealthyinfoById(int id){
		return healthyInfoDao.deleteHealthyinfoById(id);
	}
	
	public int addHealthyinfo(HealthyInfo healthyInfo){
		return healthyInfoDao.InsertHealthyInfo(healthyInfo);
	}
	
}
