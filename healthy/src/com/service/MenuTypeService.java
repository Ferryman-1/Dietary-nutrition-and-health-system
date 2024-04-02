package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;
import com.dao.MenuTypeDao;




@Service("menutypeService")
public class MenuTypeService{
	
	@Resource(name="menutypeDao")
	MenuTypeDao menutypeDao;
	

	public List<MenuType> selectAllMenuType(){
		return menutypeDao.selectAllMenuType();
	} 
	
	public int addMenuType(MenuType menuType){
		return menutypeDao.addMenuType(menuType);
	}

	public List<MenuType> selectTypeByMenuId(int id) {
		// TODO Auto-generated method stub
		return menutypeDao.selectTypeByMenuId(id);
	}

	public int  deleteMenuTypeByMenuId(Integer id) {
		return menutypeDao.deleteMenuTypeByMenuId(id);
		
	}
}
