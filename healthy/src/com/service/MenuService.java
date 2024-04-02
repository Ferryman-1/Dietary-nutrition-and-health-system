package com.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Menu;
import com.bean.MenuType;
import com.bean.User;
import com.dao.MenuDao;

@Service("menuService")
public class MenuService {
	@Resource(name="menuDao")
	MenuDao menuDao;
	
	public List<Menu> selectMenu(Map map){
		return menuDao.selectMenu(map);
	}
	
	public int selectMenuCount(Menu menu,MenuType menuType){
		return menuDao.selectMenuCount(menu,menuType);
	}
	
	public Menu selectMenuById(int id){
		return menuDao.selectMenuById(id);
	}
	
	public List<Menu> selectMenuByTypeId(int id){
		return menuDao.selectMenuByTypeId(id);
	}
	
	public int deleteMenuById(int id){
		return menuDao.deleteMenuById(id);
	}
	
	public int addMenu(Menu menu){
		int i=menuDao.addMenu(menu);
		System.out.println("service====="+menu.getId()+"====");
		
		return i;
	}
	
	public int updateMenu(Menu menu){
		return menuDao.updateMenu(menu);
	}

	public List<Menu> selectMenu1(Menu menu) {
		
	 return menuDao.selectMenu1(menu);
	}
	public List<Menu> selectMenu2(Map map){
		return menuDao.selectMenu2(map);
		
	}

	public List<Menu> selectAllMenu() {
		// TODO Auto-generated method stub
		return menuDao.selectAllMenu();
	}

	public void deleteMenuByIds(int[] ids) {
		for(int i=0;i<ids.length;i++){
			menuDao.deleteMenuById(ids[i]);
		}
		
	}
	
	public static void deleteDir(String path){
        File file = new File(path);
        File[] list = file.listFiles();
        for(File f:list){
            if(f.isDirectory()){
                deleteDir(f.getPath());
            }else{
                f.delete();
            }
        }
        boolean deleted = file.delete();
        System.out.println(deleted);
    }
	
}
