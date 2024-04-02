package com.dy;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.bean.Chat;
import com.bean.Comment2;
import com.bean.Menu;
import com.util.PageManager;

public class Comment2Dy {
	public String selectComment2(final Map map){
		final Comment2 comment2=(Comment2)map.get("comment2");
		String sql= new SQL(){{
			SELECT("*");
			FROM("comment2");
			if(comment2.getContent()!=null&& comment2.getContent()!=""){
				WHERE("content like concat('%',#{comment2.content},'%')");
			}
			ORDER_BY("comment_time ASC");
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectComment2Count(final Comment2 comment2){
		return new SQL(){{
			SELECT("count(*)");
			FROM("comment2");
			if(comment2.getContent()!=null && comment2.getContent()!="" ){
				WHERE("content like concat('%',#{content},'%')");
			}
		}}.toString();
	}
}
