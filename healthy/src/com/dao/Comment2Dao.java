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
import com.bean.Comment2;
import com.bean.Menu;
import com.bean.Up;
import com.dy.Comment2Dy;
import com.dy.MenuDy;
import com.dy.UpDy;

@Repository("comment2Dao")
public interface Comment2Dao {
	@SelectProvider(type=Comment2Dy.class,method="selectComment2")
	@Results({
		@Result(property="chat",column="chat_id",one=@One(select="com.dao.ChatDao.selectChatById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<Comment2> selectComment2(Map map);

	@SelectProvider(type=Comment2Dy.class,method="selectComment2Count")
	public int selectComment2Count(Comment2 comment2);
	
	@Select("select count(*) from comment2 where chat_id = #{chat_id}")
	int selectAllComment2Count(int chat_id);
	
	@Select("select * from comment2")
	public List<Comment2> selectAllComment2();
	
	@Select("select * from comment2 where chat_id=#{id} order by comment_time DESC")
	@Results({
		@Result(property="chat",column="chat_id",many=@Many(select="com.dao.ChatDao.selectChatById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<Comment2> selectComment2ById(int id);
	 
	@Select("select * from comment2 where id=#{id}")
	public Comment2 selectComment2ById1(int id);
	
	@Insert("insert into comment2(chat_id,user_id,content,comment_time) values(#{chat_id},#{user_id},#{content},#{comment_time})")
	int InsertComment2(Comment2 comment2);
	
	@Update("update comment2 set chat_id=#{chat_id},user_id=#{user_id},content=#{content},comment_time=#{comment_time} where id=#{id}")
	int updateComment2(Comment2 comment2);
	
	@Delete("delete from comment2 where id=#{id}")
	int deleteComment2ById(int id);
}
