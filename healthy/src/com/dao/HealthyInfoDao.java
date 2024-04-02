package com.dao;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.bean.HealthyInfo;

@Repository("healthyInfoDao")
public interface HealthyInfoDao {
	@Select("select * from healthyinfo where type_id=#{type_id}")
	@Results({
		@Result(id = true, property = "id", column = "id"),
		@Result(id = true, property = "type_id", column = "type_id"),
		@Result(column="type_id",property="type",many=@Many(select="com.dao.TypeDao.selectTypeById") )	
		})
	List<HealthyInfo> selectAllHealthyInfo(int type_id);
	
	@Update("update healthyinfo set value=#{value},name=#{name} where id=#{id}")
	int updateHealthyInfo(HealthyInfo healthyInfo);
	
	@Select("select * from healthyinfo where id=#{id}")
	HealthyInfo selectHealthyinfoById(int id);
	
	
	@Delete("delete from healthyinfo where id=#{id}")
	int deleteHealthyinfoById(int id);
	
	@Insert("insert into healthyinfo(value,name,type_id)values(#{value},#{name},#{type_id})")
	int InsertHealthyInfo(HealthyInfo healthyInfo);
}
