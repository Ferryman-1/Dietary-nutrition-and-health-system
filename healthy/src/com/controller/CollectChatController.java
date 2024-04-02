package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Chat;
import com.bean.Collect;
import com.bean.CollectChat;
import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.bean.User;
import com.service.ChatService;
import com.service.CollectChatService;
import com.service.MenuService;
import com.service.UpChatService;
import com.service.UpService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class CollectChatController {
	@Resource(name="collectChatService")
	CollectChatService collectChatService;
	
	@Resource(name="chatService")
	ChatService chatService;
	
	@Resource(name="userService")
	UserService userService;
	
	@RequestMapping(value="/addCollectChat")
	public String addCollectChat(Model model,Integer chat_id,HttpSession session){
		CollectChat collectChat = new CollectChat();
		User user=(User) session.getAttribute("user");
		
		collectChat.setUser_id(user.getId());
		collectChat.setChat_id(chat_id);
		collectChatService.addCollectChat(collectChat);
		
		return "redirect:selectChat";
		
	}
	
	@RequestMapping(value="/addCollectChat1")
	public String addCollectChat1(Model model,Integer chat_id1,HttpSession session){
		CollectChat collectChat = new CollectChat();
		User user=(User) session.getAttribute("user");
		
		collectChat.setUser_id(user.getId());
		collectChat.setChat_id(chat_id1);
		collectChatService.addCollectChat(collectChat);
		
		model.addAttribute("id", chat_id1);
		return "redirect:selectChatById";
		
	}
	
	@RequestMapping(value="/deleteCollectChatById")
	public String deleteCollectChatById(Integer id,Model model,HttpSession session){
		int i=collectChatService.deleteCollectChatById(id);
		if(i==0){
			model.addAttribute("msg", "»°œ˚ ’≤ÿ ß∞‹");
			return "fail";
		}else{
				return "redirect:selectChat";
			
		}
		
	}
	
	@RequestMapping(value="/deleteCollectChatById1")
	public String deleteCollectChatById1(Integer id,Integer chat_id,Model model,HttpSession session){
		int i=collectChatService.deleteCollectChatById(id);
		if(i==0){
			model.addAttribute("msg", "»°œ˚ ’≤ÿ ß∞‹");
			return "fail";
		}else{
			model.addAttribute("id", chat_id);
				return "redirect:selectChatById";
			
		}
		
	}
	
	@RequestMapping(value="/deleteCollectChatById3")
	public String deleteCollectChatById3(int id,Model model,HttpSession session){
		int i=collectChatService.deleteCollectChatById(id);
		if(i==0){
			model.addAttribute("msg", "»°œ˚µ„‘ﬁ ß∞‹");
			return "fail";
		}else{
			  User user=(User) session.getAttribute("user");
			  int uid=user.getId();
			  model.addAttribute("id", uid);
				return "redirect:selectCollectChatByUserId";
			
		}
		
	}
	
	@RequestMapping("/selectCollectChatByUserId")
	public String selectCollectChatByUserId(int id,CollectChat collectChat,Integer pageNow,Model model,HttpSession session){
		List<CollectChat> collectChatList1 = collectChatService.selectCollectChatByUserId(id);
		List<Chat> chatList=chatService.selectAllChat();
		model.addAttribute("chatList", chatList);
		model.addAttribute("collectChatList1", collectChatList1);
		return "collect/collectchat";
	}
	/*@RequestMapping(value="/selectMenuById")
	public String selectMenuById(Model model,Menu menu,HttpSession session ){
		Menu u=(Menu)session.getAttribute("menu");
		Menu menu2=menuService.selectMenuById(u.getId());
		model.addAttribute("menu2", menu2);
		return "index";
		
	}
	
	@RequestMapping(value="/selectMenuByTypeId")
	public String selectMenuByTypeId(Model model,User user,HttpSession session ){
		int id=1;
		List<Menu> menuList2=menuService.selectMenuByTypeId(id);
		
		model.addAttribute("menuList2",menuList2);
		model.addAttribute("id", id);
		return "index";
		
	}
	
	@RequestMapping(value="/selectMenuByTypeId1")
	public String selectMenuByTypeId1(Model model,int id,HttpSession session ){
		List<Menu> menuList2=menuService.selectMenuByTypeId(id);
		model.addAttribute("menuList2",menuList2);
		model.addAttribute("id", id);
		return "index";
		
	}
	
	
	@RequestMapping(value="/deleteMenuById")
	public String deleteMenuById(int id,Model model,HttpSession session){
		int i=menuService.deleteMenuById(id);
		if(i==0){
			model.addAttribute("msg", "…æ≥˝ ß∞‹");
			return "fail";
		}else{
				return "redirect:selectMenu";
			
		}
		
	}

	@RequestMapping(value="/deleteMenuById1")
	public String deleteMenuById1(int id,Model model,HttpSession session){
		int i=menuService.deleteMenuById(id);
		if(i==0){
			model.addAttribute("msg", "…æ≥˝ ß∞‹");
			return "fail";
		}else{
			
				return "redirect:quitMenu";
			
		}
		
	}
	
	
	@RequestMapping(value="/addMenuView")
	public String addMenuView(Model model){
		List<MenuType> menutypeList=menutypeService.selectAllMenuType();
		model.addAttribute("menutypeList",menutypeList);
		List<Type> typeList=typeService.selectAllType();
		model.addAttribute("typeList",typeList);
		return "menu/menu_add";
		
	}
	
	@RequestMapping(value="/updateMenuView")
	public String updateMenuView(int id,Model model){
		Menu menu=menuService.selectMenuById(id);
		model.addAttribute("menu",menu);
		return "menu/menu_update";
		
	}
	
	@RequestMapping(value="/updateMenu")
	public String updateMenu(Menu menu,Model model,HttpSession session){
		int i=menuService.updateMenu(menu);
		if(i==1){

			return "redirect:selectMenu";
			
		}else{
			model.addAttribute("msg","–ﬁ∏ƒ ß∞‹");
			return "fail";
		}
		
		
	}*/
}
