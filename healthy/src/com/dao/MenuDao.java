package com.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import com.bean.*;
import com.dy.MenuDy;
@Repository("menuDao")
public interface MenuDao {
	
	
	@SelectProvider(type=MenuDy.class,method="selectMenu")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(column="id",property="menutype",many=@Many(select="com.dao.MenuTypeDao.selectTypeByMenuId") ),
		@Result(column="id",property="up",many=@Many(select="com.dao.UpDao.selectUpUserByMenuId") ),
		@Result(column="id",property="collect",many=@Many(select="com.dao.CollectDao.selectCollectUserByMenuId") )
	})
	public List<Menu> selectMenu(Map map);
	
	@SelectProvider(type=MenuDy.class,method="selectMenu2")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(column="id",property="menutype",many=@Many(select="com.dao.MenuTypeDao.selectTypeByMenuId") )
	})
	public List<Menu> selectMenu2(Map map);

	
	@SelectProvider(type=MenuDy.class,method="selectMenuCount")
	public int selectMenuCount(Menu menu,MenuType menuType);
	
	@Select("select *  from menu where id=#{id}")
	public Menu selectMenuById(int id);
	
	
	
	@Select("select * from menu where id in(select menu_id from menutype where type_id = #{id})")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(column="id",property="up",many=@Many(select="com.dao.UpDao.selectUpUserByMenuId") ),
		@Result(column="id",property="collect",many=@Many(select="com.dao.CollectDao.selectCollectUserByMenuId") )
	})
	public List<Menu> selectMenuByTypeId(int id);
	
	@Delete("delete from menu where id=#{id}")
	public int deleteMenuById(int id);
	
	@Insert("insert into menu(image_name,menu_name,htm_name,word_name,show1,addTime) values(#{image_name},#{menu_name},#{htm_name},#{word_name},#{show1},#{addTime})")
	@Options(useGeneratedKeys = true,keyProperty="id",keyColumn="id")
	public int addMenu(Menu menu);
	
	@Update("update menu set menu_name=#{menu_name},image_name=#{image_name},word_name=#{word_name},addTime=#{addTime},htm_name=#{htm_name},show1=#{show1} where id=#{id} ")
	public int updateMenu(Menu menu);

	
	@Results({
		@Result(column="id",property="menutype",many=@Many(select="com.dao.MenuTypeDao.selectTypeByMenuId") )
	})
	@Select("select *  from menu")
	public List<Menu> selectMenu1(Menu menu);
	
	@Select("select *  from menu")
	public List<Menu> selectAllMenu();


	
}
