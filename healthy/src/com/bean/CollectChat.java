package com.bean;

public class CollectChat {
	Integer id;
	Integer chat_id;
	Integer user_id;
	Chat chat;
	User user;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getChat_id() {
		return chat_id;
	}
	public void setChat_id(Integer chatId) {
		chat_id = chatId;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	public Chat getChat() {
		return chat;
	}
	public void setChat(Chat chat) {
		this.chat = chat;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
