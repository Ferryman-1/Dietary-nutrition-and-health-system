package com.bean;

import java.util.Date;

public class Comment {
	Integer id;
	Integer menu_id;
	Integer user_id;
	Date comment_time;
	String content;
	Menu menu;
	User user;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menuId) {
		menu_id = menuId;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date commentTime) {
		comment_time = commentTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
