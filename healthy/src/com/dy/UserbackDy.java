package com.dy;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.bean.Chat;
import com.bean.Menu;
import com.bean.Userback;
import com.util.PageManager;

public class UserbackDy {
	public String selectUserback(final Map map){
		final Userback userback=(Userback)map.get("userback");
		String sql= new SQL(){{
			SELECT("*");
			FROM("userback");
			if(userback.getStatus()!=null){
				WHERE("status =#{userback.status}");
			}
			if(userback.getContent()!=null&& userback.getContent()!=""){
				WHERE("content like concat('%',#{userback.content},'%')");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectUserbackCount(final Userback userback){
		return new SQL(){{
			SELECT("count(*)");
			FROM("userback");
			if(userback.getStatus()!=null){
				WHERE("status =#{status}");
			}
			if(userback.getContent()!=null && userback.getContent()!="" ){
				WHERE("content like concat('%',#{content},'%')");
			}
		}}.toString();
	}
}
