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
import com.bean.Menu;
import com.bean.Up;
import com.bean.UpChat;
import com.bean.User;
import com.service.ChatService;
import com.service.MenuService;
import com.service.UpChatService;
import com.service.UpService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class UpChatController {
	@Resource(name="upChatService")
	UpChatService upChatService;
	
	@Resource(name="chatService")
	ChatService chatService;
	
	@Resource(name="userService")
	UserService userService;
	
	
	
	@RequestMapping(value="/addUpChat")
	public String addUpChat(Model model,int chat_id,HttpSession session){
		UpChat upChat = new UpChat();
		User user=(User) session.getAttribute("user");
		
		upChat.setUser_id(user.getId());
		upChat.setChat_id(chat_id);
		upChatService.addUpChat(upChat);
		
		return "redirect:selectChat";
		
	}
	
	@RequestMapping(value="/addUpChat1")
	public String addUpChat1(Model model,int chat_id,HttpSession session){
		UpChat upChat = new UpChat();
		User user=(User) session.getAttribute("user");
		
		upChat.setUser_id(user.getId());
		upChat.setChat_id(chat_id);
		upChatService.addUpChat(upChat);
		model.addAttribute("id", chat_id);
		return "redirect:selectChatById";
		
	}
	
	@RequestMapping(value="/deleteUpChatById")
	public String deleteUpChatById(int id,Model model,HttpSession session){
		int i=upChatService.deleteUpChatById(id);
		if(i==0){
			model.addAttribute("msg", "È¡ÏûµãÔÞÊ§°Ü");
			return "fail";
		}else{
				return "redirect:selectChat";
			
		}
		
	}
	
	@RequestMapping(value="/deleteUpChatById1")
	public String deleteUpChatById1(int id,int chat_id,Model model,HttpSession session){
		int i=upChatService.deleteUpChatById(id);
		if(i==0){
			model.addAttribute("msg", "È¡ÏûµãÔÞÊ§°Ü");
			return "fail";
		}else{
			model.addAttribute("id", chat_id);
				return "redirect:selectChatById";
			
		}
		
	}
	
	@RequestMapping(value="/deleteUpChatById3")
	public String deleteUpChatsById3(int id,Model model,HttpSession session){
		int i=upChatService.deleteUpChatById(id);
		if(i==0){
			model.addAttribute("msg", "È¡ÏûµãÔÞÊ§°Ü");
			return "fail";
		}else{
			  User user=(User) session.getAttribute("user");
			  int uid=user.getId();
			  model.addAttribute("id", uid);
				return "redirect:selectUpChatByUserId";
			
		}
		
	}
	
	@RequestMapping("/selectUpChatByUserId")
	public String selectUpChatByUserId(int id,UpChat upChat,Integer pageNow,Model model,HttpSession session){
		List<UpChat> upChatList1 = upChatService.selectUpChatByUserId(id);
		List<Chat> chatList=chatService.selectAllChat();
		model.addAttribute("chatList", chatList);
		model.addAttribute("upChatList1", upChatList1);
		return "up/upchat";
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
			model.addAttribute("msg", "É¾³ýÊ§°Ü");
			return "fail";
		}else{
				return "redirect:selectMenu";
			
		}
		
	}

	@RequestMapping(value="/deleteMenuById1")
	public String deleteMenuById1(int id,Model model,HttpSession session){
		int i=menuService.deleteMenuById(id);
		if(i==0){
			model.addAttribute("msg", "É¾³ýÊ§°Ü");
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
			model.addAttribute("msg","ÐÞ¸ÄÊ§°Ü");
			return "fail";
		}
		
		
	}*/
}
