package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Chat;
import com.bean.Menu;
import com.bean.Userback;
import com.dao.ChatDao;
import com.dao.MenuDao;
import com.dao.UserbackDao;

@Service("userbackService")
public class UserbackService {
	@Resource(name="userbackDao")
	UserbackDao userbackDao;
	
	public  List<Userback> selectUserback(Map map){
		return userbackDao.selectUserback(map);
	}

	public int selectUserbackCount(Userback userback){
		return userbackDao.selectUserbackCount(userback);
	}

	public int addUserback(Userback userback) {
		return userbackDao.addUserback(userback);
	}

	public Userback selectUserbackById(int id) {
		// TODO Auto-generated method stub
		return userbackDao.selectUserbackById(id);
	}

	public int deleteUserbackById(int id) {
		// TODO Auto-generated method stub
		return userbackDao.deleteUserbackById(id);
	}

	public int updateUserback(Userback userback) {
		// TODO Auto-generated method stub
		return userbackDao.updateUserback(userback);
	}

	public List<Userback> selectUserbackByUserId(Integer id) {
		// TODO Auto-generated method stub
		return userbackDao.selectUserbackByUserId(id);
	}
}
