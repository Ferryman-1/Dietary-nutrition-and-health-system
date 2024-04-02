package com.dy;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;

import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.util.PageManager;

public class UpChatDy {
	public String selectUpChat(final Map map){
		final UpChat upChat=(UpChat)map.get("upChat");
		final Menu menu=(Menu) map.get("menu");
		String sql= new SQL(){{
			SELECT("*");
			FROM("upChat,chat");
			WHERE("upChat.chat_id = chat.id");
			if(upChat.getChat_id()!=null){
				WHERE("chat_id=#{upChat.chat_id}");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectUpChatCount(final UpChat upChat){
		return new SQL(){{
			SELECT("count(*)");
			FROM("upChat");
			if(upChat.getUser_id()!=null){
				WHERE("user_id=#{user_id}");
			}
		}}.toString();
	}
	
	
}
