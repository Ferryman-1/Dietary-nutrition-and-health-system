package com.dy;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.bean.Menu;
import com.bean.MenuType;
import com.bean.User;
import com.util.PageManager;

public class MenuDy {
	
	public String selectMenu(final Map map){
		final Menu menu=(Menu)map.get("menu");
		final MenuType menuType=(MenuType) map.get("menuType");
		String sql= new SQL(){{
			SELECT("menu.menu_name,menu.show1,menu.image_name,menu.word_name,menu.id,menu.htm_name,menu.addTime");
			FROM("menu,menutype");
			WHERE("menu.id=menutype.menu_id");
			if(menuType.getType_id()!=null){
				
				WHERE("menutype.type_id=#{menuType.type_id}");
			}
			GROUP_BY("menutype.menu_id");
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectMenuCount(final Menu menu,final MenuType menuType){
		return new SQL(){{
			SELECT("count(distinct menutype.menu_id)");
			FROM("menu,menutype");
			WHERE("menu.id=menutype.menu_id");
			if(menuType.getType_id()!=null){
				WHERE(" menutype.type_id=#{1.type_id}");
			}
			
		}}.toString();
	}
	
	public String selectMenu2(final Map map){
		final Menu menu=(Menu)map.get("menu");
		final MenuType menuType=(MenuType) map.get("menuType");
		String sql= new SQL(){{
			SELECT("*");
			FROM("menu");
			
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	
}
