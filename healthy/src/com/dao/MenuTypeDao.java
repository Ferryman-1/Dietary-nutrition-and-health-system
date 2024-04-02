package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;

@Repository("menutypeDao")
public interface MenuTypeDao {
	
	
	
	@Select("select *  from menutype")
	public List<MenuType> selectAllMenuType();
	
	@Insert("insert into menutype(type_id,menu_id) values(#{type_id},#{menu_id})")	
	public int addMenuType(MenuType menuType);
	
	@Select("select * from menutype where type_id=#{id}")
	List<MenuType> selectMenuByTypeId(int id);
	
	@Select("select * from menutype where menu_id=#{id}")
	List<MenuType> selectTypeByMenuId(int id);
	
	@Delete("delete from menutype where menu_id=#{id}")
	public int deleteMenuTypeByMenuId(Integer id);

}
