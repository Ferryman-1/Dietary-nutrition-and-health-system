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

import com.bean.Chat;
import com.bean.Menu;
import com.bean.User;
import com.dy.ChatDy;
import com.dy.MenuDy;

@Repository("chatDao")
public interface ChatDao {
	
	@SelectProvider(type=ChatDy.class,method="selectChat")
	@Results({	
		@Result(id = true, property = "id", column = "id"),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY)),
		@Result(column="id",property="upChat",many=@Many(select="com.dao.UpChatDao.selectUpChatUserByChatId")),
		@Result(column="id",property="collectChat",many=@Many(select="com.dao.CollectChatDao.selectCollectChatUserByChatId"))
	})
	public  List<Chat> selectChat(Map map);
	
	@SelectProvider(type=ChatDy.class,method="selectChatCount")
	public int selectChatCount(Chat chat);
	
	@Insert("insert into chat(image_name,content,user_id,title,addTime) values(#{image_name},#{content},#{user_id},#{title},#{addTime})")
	public int addChat(Chat chat);
	
	@Select("select * from chat where id=#{id}")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY)),
		@Result(column="id",property="upChat",many=@Many(select="com.dao.UpChatDao.selectUpChatUserByChatId")),
		@Result(column="id",property="collectChat",many=@Many(select="com.dao.CollectChatDao.selectCollectChatUserByChatId"))
	})
	public Chat selectChatById(int id);
	
	@Delete("delete from chat where id=#{id}")
	public int deleteChatById(int id);
	
	@Update("update chat set title=#{title},content=#{content},image_name=#{image_name} where id=#{id} ")
	public int updateChat(Chat chat);
	
	@Select("select * from chat")
	public List<Chat> selectAllChat();
	
	@Select("select * from chat where user_id=#{id}")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY)),
		@Result(column="id",property="upChat",many=@Many(select="com.dao.UpChatDao.selectUpChatUserByChatId")),
		@Result(column="id",property="collectChat",many=@Many(select="com.dao.CollectChatDao.selectCollectChatUserByChatId"))
	})
	public List<Chat> selectChatByUserId(Integer id);
	
	
}
