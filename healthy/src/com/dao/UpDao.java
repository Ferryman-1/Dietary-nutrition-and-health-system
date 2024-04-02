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
import com.dy.MenuDy;
import com.dy.UpDy;

@Repository("upDao")
public interface UpDao {
	@SelectProvider(type=UpDy.class,method="selectUp")
	@Results({
		@Result(property="menu",column="menu_id",one=@One(select="com.dao..MenuDao.selectMenuById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<Up> selectUp(Map map);

	@SelectProvider(type=UpDy.class,method="selectUpCount")
	public int selectUpCount(Up up);
	
	@Select("select count(*) from up where menu_id = #{menu_id}")
	int selectAllUpCount(int menu_id);
	
	@Select("select * from up")
	public List<Up> selectAllup();
	
	@Select("select * from up where id=#{id}")
	Up selectUpById(int id);
	 
	@Insert("insert into up(menu_id,user_id) values(#{menu_id},#{user_id})")
	int InsertUp(Up up);

	
	@Delete("delete from up where id=#{id}")
	int deleteUpById(int id);
	
	@Select("select * from up where menu_id=#{id}")
	List<Up> selectUpUserByMenuId(Integer id);
	
	@Select("select *  from up where user_id=#{id}")
	List<Up> selectUpByUserId(int id);
	
	
}
