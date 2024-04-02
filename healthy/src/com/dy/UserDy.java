package com.dy;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.bean.User;
import com.util.PageManager;


public class UserDy {
	public String selectUserCount(final User user){
		return new SQL(){{
			SELECT("count(*)");
			FROM("user");
			if(user.getUsername()!=null){
				WHERE("username like concat('%',#{username},'%')");
			}
			
		}}.toString();
	}
	
	public String selectUser(final Map map){	
		final User user = (User) map.get("user");
		String sql =  new SQL(){{
			SELECT("*");
			FROM("user");
			if(user.getUsername()!=null){
				WHERE("username like concat('%',#{user.username},'%')");
			}
		}}.toString();
		//∑÷“≥–≈œ¢
		PageManager pm = (PageManager)map.get("pm");
		int pageNow = pm.getPageNow();
		int pageSize = pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
}
