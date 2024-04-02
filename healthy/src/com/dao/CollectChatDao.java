package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import com.bean.CollectChat;
import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.dy.CollectChatDy;
import com.dy.MenuDy;
import com.dy.UpChatDy;
import com.dy.UpDy;

@Repository("collectChatDao")
public interface CollectChatDao {
	@SelectProvider(type=CollectChatDy.class,method="selectCollectChat")
	@Results({
		@Result(property="chat",column="chat_id",one=@One(select="com.dao.ChatDao.selectChatById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<CollectChat> selectCollectChat(Map map);

	@SelectProvider(type=CollectChatDy.class,method="selectCollectChatCount")
	public int selectCollectChatCount(CollectChat collectChat);
	
	@Select("select count(*) from collectchat where chat_id = #{chat_id}")
	int selectAllCollectChatCount(int menu_id);
	
	@Select("select * from collectchat")
	public List<CollectChat> selectAllcollectChat();
	
	@Select("select * from collectchat where id=#{id}")
	CollectChat selectCollectChatById(int id);
	 
	@Insert("insert into collectchat(chat_id,user_id) values(#{chat_id},#{user_id})")
	int InsertCollectChat(CollectChat collectChat);
	
	
	@Delete("delete from collectchat where id=#{id}")
	int deleteCollectChatById(int id);
	
	@Select("select * from collectchat where chat_id=#{id}")
	List<CollectChat> selectCollectChatUserByChatId(Integer id);
	
	@Select("select * from collectchat where user_id=#{id}")
	public List<CollectChat> selectCollectChatByUserId(int id);
}
