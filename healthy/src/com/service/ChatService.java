package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Chat;
import com.bean.Menu;
import com.dao.ChatDao;
import com.dao.MenuDao;

@Service("chatService")
public class ChatService {
	@Resource(name="chatDao")
	ChatDao chatDao;
	
	public  List<Chat> selectChat(Map map){
		return chatDao.selectChat(map);
	}

	public int selectChatCount(Chat chat){
		return chatDao.selectChatCount(chat);
	}

	public int addChat(Chat chat) {
		return chatDao.addChat(chat);
	}

	public Chat selectChatById(int id) {
		// TODO Auto-generated method stub
		return chatDao.selectChatById(id);
	}

	public int deleteChatById(int id) {
		// TODO Auto-generated method stub
		return chatDao.deleteChatById(id);
	}

	public int updateChat(Chat chat) {
		// TODO Auto-generated method stub
		return chatDao.updateChat(chat);
	}

	public List<Chat> selectAllChat() {
		// TODO Auto-generated method stub
		return chatDao.selectAllChat();
	}

	public List<Chat> selectChatByUser_Id(Integer id) {
		// TODO Auto-generated method stub
		return chatDao.selectChatByUserId(id);
	}

	public void deleteChatByIds(int[] ids) {
		for(int i=0;i<ids.length;i++){
			chatDao.deleteChatById(ids[i]);
		}
		
	}
}
