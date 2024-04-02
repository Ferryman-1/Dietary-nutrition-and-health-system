package com.bean;

import java.util.Date;
import java.util.List;

public class Chat {
	Integer id;
	String image_name;
	String title;
	String content;
	Integer user_id;
	Date addTime;
	User user;
	
	Integer upSum;
	Integer collectSum;
	Integer commentSum;
	
	List<UpChat> upChat;
	List<CollectChat> collectChat;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String imageName) {
		image_name = imageName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUpSum() {
		return upSum;
	}
	public void setUpSum(Integer upSum) {
		this.upSum = upSum;
	}
	public Integer getCollectSum() {
		return collectSum;
	}
	public void setCollectSum(Integer collectSum) {
		this.collectSum = collectSum;
	}
	public List<UpChat> getUpChat() {
		return upChat;
	}
	public void setUpChat(List<UpChat> upChat) {
		this.upChat = upChat;
	}
	public List<CollectChat> getCollectChat() {
		return collectChat;
	}
	public void setCollectChat(List<CollectChat> collectChat) {
		this.collectChat = collectChat;
	}
	public Integer getCommentSum() {
		return commentSum;
	}
	public void setCommentSum(Integer commentSum) {
		this.commentSum = commentSum;
	}
	
	
	
}
