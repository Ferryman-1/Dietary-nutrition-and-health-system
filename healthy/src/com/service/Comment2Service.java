package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Collect;
import com.bean.Comment2;
import com.bean.MenuType;
import com.bean.Up;
import com.dao.CollectDao;
import com.dao.Comment2Dao;
import com.dao.UpDao;

@Service("comment2Service")
public class Comment2Service {
	@Resource(name="comment2Dao")
	Comment2Dao comment2Dao;
	
	public List<Comment2> selectComment2(Map map){
		return comment2Dao.selectComment2(map);
	} 
	
	public int selectComment2count(Comment2 comment2){
		return comment2Dao.selectComment2Count(comment2);
	}
	
	public int selectAllComment2Count(int chat_id){
		return comment2Dao.selectAllComment2Count(chat_id);
	}
	
	public List<Comment2> selectAllComment2(){
		return comment2Dao.selectAllComment2();
	}
	
	public List<Comment2> selectComment2ById(int id){
		return  comment2Dao.selectComment2ById(id);
	}
	
	public Comment2 selectComment2ById1(int id){
		return comment2Dao.selectComment2ById1(id);
	}
	
	public int addComment2(Comment2 comment2){
		return comment2Dao.InsertComment2(comment2);
	}
	
	public int updateComment2(Comment2 comment2){
		return comment2Dao.updateComment2(comment2);
	}
	
	public int deleteComment2ById(int id){
		return comment2Dao.deleteComment2ById(id);
	}
}
