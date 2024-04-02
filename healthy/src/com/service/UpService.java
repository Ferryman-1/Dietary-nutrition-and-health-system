package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.MenuType;
import com.bean.Up;
import com.dao.UpDao;

@Service("upService")
public class UpService {
	@Resource(name="upDao")
	UpDao upDao;
	
	public List<Up> selectUp(Map map){
		return upDao.selectUp(map);
	} 
	
	public int selectUpcount(Up up){
		return upDao.selectUpCount(up);
	}
	
	public int selectAllUpCount(int menu_id){
		return upDao.selectAllUpCount(menu_id);
	}
	
	public List<Up> selectAllup(){
		return upDao.selectAllup();
	}
	
	public Up selectUpById(int id){
		return upDao.selectUpById(id);
	}
	
	public int addUp(Up up){
		return upDao.InsertUp(up);
	}
	
	public List<Up> selectUpByUserId(int id) {
		
		return upDao.selectUpByUserId(id) ;
	}
	
	public int deleteUpById(int id){
		return upDao.deleteUpById(id);
	}
}
