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

import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.dy.MenuDy;
import com.dy.UpChatDy;
import com.dy.UpDy;

@Repository("upChatDao")
public interface UpChatDao {
	@SelectProvider(type=UpChatDy.class,method="selectUpChat")
	@Results({
		@Result(property="chat",column="chat_id",one=@One(select="com.dao.ChatDao.selectChatById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<UpChat> selectUpChat(Map map);

	@SelectProvider(type=UpChatDy.class,method="selectUpChatCount")
	public int selectUpChatCount(UpChat upChat);
	
	@Select("select count(*) from upChat where chat_id = #{chat_id}")
	int selectAllUpChatCount(int menu_id);
	
	@Select("select * from upChat")
	public List<UpChat> selectAllupChat();
	
	@Select("select * from upChat where id=#{id}")
	UpChat selectUpChatById(int id);
	 
	@Insert("insert into upChat(chat_id,user_id) values(#{chat_id},#{user_id})")
	int InsertUpChat(UpChat upChat);
	
	
	
	@Delete("delete from upChat where id=#{id}")
	int deleteUpChatById(int id);
	
	@Select("select * from upChat where chat_id=#{id}")
	List<UpChat> selectUpChatUserByChatId(Integer id);
	
	@Select("select * from upChat where user_id=#{id}")
	public List<UpChat> selectUpChatByUserId(int id);
}
