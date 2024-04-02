package com.dy;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.bean.Chat;
import com.bean.Menu;
import com.util.PageManager;

public class ChatDy {
	public String selectChat(final Map map){
		final Chat chat=(Chat)map.get("chat");
		String sql= new SQL(){{
			SELECT("*");
			FROM("chat");
			if(chat.getTitle()!=null && chat.getTitle()!=""){
				WHERE("title like concat('%',#{chat.title},'%')");
			}
			if(chat.getContent()!=null&& chat.getContent()!=""){
				WHERE("content like concat('%',#{chat.content},'%')");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectChatCount(final Chat chat){
		return new SQL(){{
			SELECT("count(*)");
			FROM("chat");
			if(chat.getTitle()!=null && chat.getTitle()!=""){
				WHERE("title like concat('%',#{title},'%')");
			}
			if(chat.getContent()!=null && chat.getContent()!="" ){
				WHERE("content like concat('%',#{content},'%')");
			}
		}}.toString();
	}
}
