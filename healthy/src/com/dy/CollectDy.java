package com.dy;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;

import com.bean.Collect;
import com.bean.Up;
import com.util.PageManager;

public class CollectDy {
	public String selectCollect(final Map map){
		final Collect collect=(Collect)map.get("collect");
		String sql= new SQL(){{
			SELECT("*");
			FROM("collect");
			if(collect.getUser_id()!=null){
				WHERE("user_id=#{collect.user_id}");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectCollectCount(final Collect collect){
		return new SQL(){{
			SELECT("count(*)");
			FROM("collect");
			if(collect.getUser_id()!=null){
				WHERE("user_id=#{user_id}");
			}
		}}.toString();
	}
	
	
}
