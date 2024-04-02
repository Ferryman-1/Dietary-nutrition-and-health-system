package com.dy;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;

import com.bean.CollectChat;
import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.util.PageManager;

public class CollectChatDy {
	public String selectCollectChat(final Map map){
		final CollectChat collectChat=(CollectChat)map.get("collectChat");
		final Menu menu=(Menu) map.get("menu");
		String sql= new SQL(){{
			SELECT("*");
			FROM("collectchat,chat");
			WHERE("collectchat.chat_id = chat.id");
			if(collectChat.getChat_id()!=null){
				WHERE("chat_id=#{collectchat.chat_id}");
			}
		}}.toString();
		PageManager pm=(PageManager)map.get("pm");
		int pageNow=pm.getPageNow();
		int pageSize=pm.getPageSize();
		sql=sql+" limit "+(pageNow-1)*pageSize+","+pageSize;
		return sql;
	}
	
	public String selectCollectChatCount(final CollectChat collectChat){
		return new SQL(){{
			SELECT("count(*)");
			FROM("collectchat");
			if(collectChat.getUser_id()!=null){
				WHERE("user_id=#{user_id}");
			}
		}}.toString();
	}
	
	
}
