package com.service;



import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.User;
import com.dao.UserDao;

@Service("userService")
public class UserService {
	@Resource(name="userDao")
	UserDao userDao;
	
	public User login(User user){
		return userDao.login(user);
	}

	public List<User> selectAllUser(){
		return userDao.selectAllUser();
	}
	
	public List<User> selectUser(Map map){
		return userDao.selectUser(map);
	}
	
	public int selectUserCount(User user){
		return userDao.selectUserCount(user);
	}
	
	public User selectUserById(int id){
		return userDao.selectUserById(id);
	}
	
	public int addUser(User user){
		return userDao.InsertUser(user);
	}
	
	public int updateUser(User user){
		return userDao.updateUser(user);
	}
	
	public int updateUser2(User user){
		return userDao.updateUser2(user);
	}
	
	public int deleteUserById(int id){
		return userDao.deleteUserById(id);
	}
	
	public void deleteUsers(int ids[]){
		for(int i=0;i<ids.length;i++){
			userDao.deleteUserById(ids[i]);
		}
	}



}
