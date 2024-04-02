package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.CollectChat;
import com.bean.MenuType;
import com.bean.Up;
import com.bean.UpChat;
import com.dao.CollectChatDao;
import com.dao.UpChatDao;
import com.dao.UpDao;

@Service("collectChatService")
public class CollectChatService {
	@Resource(name="collectChatDao")
	CollectChatDao collectChatDao;
	
	public List<CollectChat> selectCollectChat(Map map){
		return collectChatDao.selectCollectChat(map);
	} 
	
	public int selectCollectChatcount(CollectChat collectChat){
		return collectChatDao.selectCollectChatCount(collectChat);
	}
	
	public int selectAllCollectChatCount(int menu_id){
		return collectChatDao.selectAllCollectChatCount(menu_id);
	}
	
	public List<CollectChat> selectAllcollectChat(){
		return collectChatDao.selectAllcollectChat();
	}
	
	public CollectChat selectCollectChatById(int id){
		return collectChatDao.selectCollectChatById(id);
	}
	
	public int addCollectChat(CollectChat collectChat){
		return collectChatDao.InsertCollectChat(collectChat);
	}
	
	
	
	public int deleteCollectChatById(int id){
		return collectChatDao.deleteCollectChatById(id);
	}

	public List<CollectChat> selectCollectChatByUserId(int id) {
		// TODO Auto-generated method stub
		return collectChatDao.selectCollectChatByUserId(id);
	}
}
