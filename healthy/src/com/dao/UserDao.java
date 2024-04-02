package com.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import com.bean.User;
import com.dy.UserDy;

@Repository("userDao")
public interface UserDao {
	@Select("select * from user where password=#{password} and loginname=#{loginname} and role=#{role}")
	public User login(User user);
	
	@SelectProvider(type=UserDy.class,method="selectUser")
	@Results({
		@Result(property="type",column="type_id",one=@One(select="com.dao.TypeDao.selectTypeById",fetchType=FetchType.LAZY))
	})
	List<User> selectUser(Map map);
	
	@SelectProvider(type=UserDy.class,method="selectUserCount")
	int selectUserCount(User user);

	@Select("select * from user where id=#{id}")
	User selectUserById(int id);
	
	@Insert("insert into user (username,loginname,password,sex,age,image_name,role,sign)values(#{username},#{loginname},#{password},#{sex},#{age},#{image_name},#{role},#{sign})")
	int InsertUser(User user);
	
	@Update("update user set sex=#{sex},age=#{age},username=#{username},loginname=#{loginname},sign=#{sign} where id=#{id}")
	int updateUser(User user);
	
	@Update("update user set image_name=#{image_name},username=#{username},password=#{password},sex=#{sex},age=#{age},sign=#{sign} where id=#{id}")
	int updateUser2(User user);
	
	@Delete("delete from user where id=#{id}")
	int deleteUserById(int id);
	
	@Select("select *  from user")
	public List<User> selectAllUser();

}
