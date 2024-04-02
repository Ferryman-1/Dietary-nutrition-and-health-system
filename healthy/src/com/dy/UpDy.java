package com.dy;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;

import com.bean.Menu;
import com.bean.Up;
import com.util.PageManager;

public class UpDy {
	public String selectUp(final Map map){
		final Up up=(Up)map.get("up");
		final Menu menu=(Menu) map.get("menu");
		String sql= new SQL(){{
			SELECT("*");
			FROM("up,menu");
			WHERE("up.menu_id = menu.id");
			if(up.getMenu_id()!=null){
				WHERE("menu_id=#{up.menu_id}");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectUpCount(final Up up){
		return new SQL(){{
			SELECT("count(*)");
			FROM("up");
			if(up.getUser_id()!=null){
				WHERE("user_id=#{user_id}");
			}
		}}.toString();
	}
	
	
}
