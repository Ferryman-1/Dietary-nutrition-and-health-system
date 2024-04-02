package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.MenuType;
import com.bean.Up;
import com.bean.UpChat;
import com.dao.UpChatDao;
import com.dao.UpDao;

@Service("upChatService")
public class UpChatService {
	@Resource(name="upChatDao")
	UpChatDao upChatDao;
	
	public List<UpChat> selectUpChat(Map map){
		return upChatDao.selectUpChat(map);
	} 
	
	public int selectUpChatcount(UpChat upChat){
		return upChatDao.selectUpChatCount(upChat);
	}
	
	public int selectAllUpChatCount(int menu_id){
		return upChatDao.selectAllUpChatCount(menu_id);
	}
	
	public List<UpChat> selectAllupChat(){
		return upChatDao.selectAllupChat();
	}
	
	public UpChat selectUpChatById(int id){
		return upChatDao.selectUpChatById(id);
	}
	
	public int addUpChat(UpChat upChat){
		return upChatDao.InsertUpChat(upChat);
	}
	
	
	
	public int deleteUpChatById(int id){
		return upChatDao.deleteUpChatById(id);
	}

	public List<UpChat> selectUpChatByUserId(int id) {
		// TODO Auto-generated method stub
		return upChatDao.selectUpChatByUserId(id);
	}
}
