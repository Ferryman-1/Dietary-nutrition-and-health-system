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
import com.bean.Userback;
import com.dy.ChatDy;
import com.dy.MenuDy;
import com.dy.UserbackDy;

@Repository("userbackDao")
public interface UserbackDao {
	
	@SelectProvider(type=UserbackDy.class,method="selectUserback")
	@Results({		
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public  List<Userback> selectUserback(Map map);
	
	@SelectProvider(type=UserbackDy.class,method="selectUserbackCount")
	public int selectUserbackCount(Userback userback);
	
	@Insert("insert into userback(content,email,user_id,userback_time) values(#{content},#{email},#{user_id},#{userback_time})")
	public int addUserback(Userback userback);
	
	@Select("select * from userback where id=#{id}")
	@Results({
		@Result(id = true, property = "user_id", column = "user_id"),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public Userback selectUserbackById(int id);
	
	@Delete("delete from userback where id=#{id}")
	public int deleteUserbackById(int id);
	
	@Update("update userback set status=#{status},reply=#{reply} where id=#{id} ")
	public int updateUserback(Userback userback);
	
	@Select("select * from userback where user_id=#{id}")
	@Results({
		
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<Userback> selectUserbackByUserId(Integer id);
	
	
}
