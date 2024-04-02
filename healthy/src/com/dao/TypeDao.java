package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.bean.Menu;
import com.bean.Type;

@Repository("typeDao")
public interface TypeDao {
	
	@Select("select *  from type where id=#{id}")
	public Type selectTypeById(int id);
	
	@Select("select *  from type")
	public List<Type> selectAllType();
	
	
}
