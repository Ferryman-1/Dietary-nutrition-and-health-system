package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Collect;
import com.bean.MenuType;
import com.bean.Up;
import com.dao.CollectDao;
import com.dao.UpDao;

@Service("collectService")
public class CollectService {
	@Resource(name="collectDao")
	CollectDao collectDao;
	
	public List<Collect> selectCollect(Map map){
		return collectDao.selectCollect(map);
	} 
	
	public int selectCollectcount(Collect collect){
		return collectDao.selectCollectCount(collect);
	}
	
	public int selectAllCollectCount(int menu_id){
		return collectDao.selectAllCollectCount(menu_id);
	}
	
	public List<Collect> selectAllCollect(){
		return collectDao.selectAllcollect();
	}
	
	public Collect selectCollectById(int id){
		return collectDao.selectCollectById(id);
	}
	
	public int addCollect(Collect collect){
		return collectDao.InsertCollect(collect);
	}
	
	
	
	public int deleteCollectById(int id){
		return collectDao.deleteCollectById(id);
	}
	
	public List<Collect> selectCollectByUserId(int id) {
		
		return collectDao.selectCollectByUserId(id) ;
	}
}

