package com.bean;

import java.util.Date;

public class Reply {
	Integer id;
	Integer comment_id;
	String reply_content;
	Integer user_id;
	Date reply_time;
	Integer last_id;
	Comment comment;
	User user;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer commentId) {
		comment_id = commentId;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String replyContent) {
		reply_content = replyContent;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date replyTime) {
		reply_time = replyTime;
	}
	public Integer getLast_id() {
		return last_id;
	}
	public void setLast_id(Integer lastId) {
		last_id = lastId;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
