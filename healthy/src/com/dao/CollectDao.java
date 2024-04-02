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

import com.bean.Collect;
import com.bean.Menu;
import com.bean.Up;
import com.dy.CollectDy;
import com.dy.MenuDy;
import com.dy.UpDy;

@Repository("collectDao")
public interface CollectDao {
	@SelectProvider(type=CollectDy.class,method="selectCollect")
	@Results({
		@Result(property="menu",column="menu_id",one=@One(select="com.dao..MenuDao.selectMenuById",fetchType=FetchType.LAZY)),
		@Result(property="user",column="user_id",one=@One(select="com.dao.UserDao.selectUserById",fetchType=FetchType.LAZY))
	})
	public List<Collect> selectCollect(Map map);

	@SelectProvider(type=CollectDy.class,method="selectCollectCount")
	public int selectCollectCount(Collect collect);
	
	@Select("select count(*) from collect where menu_id = #{menu_id}")
	int selectAllCollectCount(int menu_id);
	
	@Select("select * from collect")
	public List<Collect> selectAllcollect();
	
	@Select("select * from collect where id=#{id}")
	Collect selectCollectById(int id);
	 
	@Insert("insert into Collect (menu_id,user_id) values(#{menu_id},#{user_id})")
	int InsertCollect(Collect collect);
	

	@Delete("delete from collect where id=#{id}")
	int deleteCollectById(int id);
	
	@Select("select * from collect where menu_id=#{id}")
	List<Up> selectCollectUserByMenuId(Integer id);
	
	@Select("select *  from collect where user_id=#{id}")
	List<Collect> selectCollectByUserId(int id);
}
