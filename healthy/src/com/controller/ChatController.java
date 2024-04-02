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
import com.bean.Comment2;
import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;
import com.bean.User;
import com.service.ChatService;
import com.service.CollectChatService;
import com.service.Comment2Service;
import com.service.MenuService;
import com.service.UpChatService;
import com.service.UpService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class ChatController {
	@Resource(name="chatService")
	ChatService chatService;
	@Resource(name="userService")
	UserService userService;
	@Resource(name="upChatService")
	UpChatService upChatService;
	@Resource(name="collectChatService")
	CollectChatService collectChatService;
	
	@Resource(name="comment2Service")
	Comment2Service comment2Service;
	
	@RequestMapping(value="/selectChat")
	public String selectChat(Chat chat,Integer pageNow,Model model,HttpSession session){
		if(pageNow==null) pageNow=1;
		int totalSize=chatService.selectChatCount(chat);
		PageManager pm=new PageManager(pageNow,5,totalSize);
		Map map=new HashMap();
		map.put("chat", chat);
		map.put("pm",pm);
		List<Chat> chatList=chatService.selectChat(map);
		
		for(int i = 0; i < chatList.size(); i ++){
			int ids = chatList.get(i).getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chatList.get(i).setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chatList.get(i).setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chatList.get(i).setCommentSum(count3);
		}
		
		model.addAttribute("chatList",chatList);
		model.addAttribute("chat",chat);
		model.addAttribute("pm",pm);
		
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		User user=(User) session.getAttribute("user");
		if(user!=null&&user.getRole()==1){
			return "chat/chat_select";
		}else{
		return "chat/chat";}
		
	}
	

	@RequestMapping(value="/addChatView")
	public String addChatView(Model model,HttpSession session){
		User user=(User) session.getAttribute("user");
		if(user!=null&&user.getRole()==1){
		
			return "chat/chat_add";
		}else{
			return "chat/chat_add1";
		}
		
		
	}
	
	@RequestMapping("/addChat")
	public String addChat(Chat chat,MultipartFile file,Model model,HttpSession session){
		if (!file.isEmpty()){
		Date date=new Date();
		chat.setAddTime(date);
		String path=session.getServletContext().getRealPath("\\img\\lt\\");
		String filename=file.getOriginalFilename();
		String fileType=filename.substring(filename.indexOf("."));
		String newFilename=new Long(new Date().getTime()).toString()+fileType;
		chat.setImage_name(newFilename);
		File filepath=new File(path,newFilename);
		if (!filepath.getParentFile().exists()){
			filepath.getParentFile().mkdirs();
		}
		int i = 0;
		try {
			file.transferTo(new File(path+"\\"+newFilename));
			i = chatService.addChat(chat);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "Ìí¼ÓÎÄµµÊ§°Ü");
			return "fail";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "Ìí¼ÓÎÄµµÊ§°Ü");
			return "fail";
		}
		return "redirect:selectChat";
		}else{
			
			return "redirect:addChat";
		}
	
			
		
	
		
	}
	
	
	
	@RequestMapping(value="/selectChatById")
	public String selectChatById(Integer id,Model model,HttpSession session){
			
			Chat chat=chatService.selectChatById(id);
			
			int ids = chat.getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chat.setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chat.setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chat.setCommentSum(count3);
			
			
			model.addAttribute("chat", chat);
			
			List<Comment2> commentList=comment2Service.selectComment2ById(id);
			model.addAttribute("commentList", commentList);
			
			User user=(User) session.getAttribute("user");
			if(user!=null&&user.getRole()==1){
			
				return "chat/chat_content4";
			}else{
				return "chat/chat_content";
			}
			
			
		
		
	}
	
	@RequestMapping(value="/selectChatById1")
	public String selectChatById1(Integer id,Model model){
			
			Chat chat=chatService.selectChatById(id);
			
			int ids = chat.getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chat.setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chat.setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chat.setCommentSum(count3);
		
			
			
			model.addAttribute("chat", chat);
			return "chat/chat_content1";
		
		
	}
	
	@RequestMapping(value="/selectChatById2")
	public String selectChatById2(Integer id,Model model){
			
			Chat chat=chatService.selectChatById(id);
			
			int ids = chat.getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chat.setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chat.setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chat.setCommentSum(count3);
			
			
			model.addAttribute("chat", chat);
			return "chat/chat_content2";
		
		
	}
	
	@RequestMapping(value="/selectChatById3")
	public String selectChatById3(Integer id,Model model){
			
			Chat chat=chatService.selectChatById(id);
			
			int ids = chat.getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chat.setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chat.setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chat.setCommentSum(count3);
			
			List<Comment2> commentList=comment2Service.selectComment2ById(id);
			model.addAttribute("commentList", commentList);
			
			model.addAttribute("chat", chat);
			return "chat/chat_content3";
		
		
	}
	

	
	@RequestMapping(value="/selectChatByUserId")
	public String selectChatByUserId(Integer id,Model model){
			
			List<Chat> chatList=chatService.selectChatByUser_Id(id);
			for(int i = 0; i < chatList.size(); i ++){
				
			int ids = chatList.get(i).getId();
			int count = upChatService.selectAllUpChatCount(ids);  
			chatList.get(i).setUpSum(count);
			int count2 = collectChatService.selectAllCollectChatCount(ids);
			chatList.get(i).setCollectSum(count2);
			int count3 = comment2Service.selectAllComment2Count(ids);
			chatList.get(i).setCommentSum(count3);
			
			}
			
			
			
			model.addAttribute("chatList", chatList);
			
			
			
			List<User> userList=userService.selectAllUser();
			model.addAttribute("userList",userList);
			return "chat/chatuser";
		
		
	}
	
	
	@RequestMapping(value="/deleteChatById")
	public String deleteChatById(int id,Model model,HttpSession session){
		Chat chat=chatService.selectChatById(id);
		
		String path=session.getServletContext().getRealPath("\\img\\lt\\");
		String filename1=chat.getImage_name();
		chat.setImage_name(filename1);
		String fullFilePath1= path + File.separator + filename1;
		File deleteFile1 = new File(fullFilePath1);
		if (deleteFile1.exists() && deleteFile1.isFile()) {
			deleteFile1.delete(); 
	       	System.out.println("¾ÉÎÄ¼þ"+filename1+"ÒÑÉ¾³ý");
	     }
	    
		int i=chatService.deleteChatById(id);
		if(i==0){
			model.addAttribute("msg", "É¾³ýÊ§°Ü");
			return "fail";
		}else{
			User user=(User) session.getAttribute("user");
			if(user!=null&&user.getRole()==1){
			
				return "redirect:selectChat";
			}else{
				model.addAttribute("id", user.getId());
				return "redirect:selectChatByUserId";
			}
			
				
			
		}
		
	}
	
	@RequestMapping(value="/updateChatView")
	public String updateChatView(int id,Model model,HttpSession session){
		
		Chat chat=chatService.selectChatById(id);
		model.addAttribute("chat",chat);
		
		User user=(User) session.getAttribute("user");
		if(user!=null&&user.getRole()==1){
		
			return "chat/chat_update";
		}else{
			return "chat/chat_update1";
		}
		
		
		
	}
	
	
	
	@RequestMapping(value="/updateChat")
	public String updateChat(Chat chat,Model model,@RequestParam("file") MultipartFile file,HttpSession session){
		Chat chat1=chatService.selectChatById(chat.getId());
		String filename1=chat1.getImage_name();
		if (!file.isEmpty()){
			
			String path=session.getServletContext().getRealPath("\\img\\lt\\");
			
			chat1.setImage_name(filename1);
	
			String fullFilePath = path + File.separator + filename1;
			File deleteFile = new File(fullFilePath);
			System.out.println(fullFilePath);
			System.out.println(filename1);
	        if (deleteFile.exists() && deleteFile.isFile()) {
	        	deleteFile.delete(); 
	        	
	        	System.out.println("¾ÉÎÄ¼þ"+filename1+"ÒÑÉ¾³ý");
	        }
			String filename=file.getOriginalFilename();
			String fileType=filename.substring(filename.indexOf("."));
		
			String newFilename=new Long(new Date().getTime()).toString()+fileType;
			chat.setImage_name(newFilename);
			File filepath=new File(path,newFilename);
			if (!filepath.getParentFile().exists()){
				filepath.getParentFile().mkdirs();
			}
			try {
				file.transferTo(new File(path+"\\"+newFilename));
				
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			chat.setImage_name(filename1);
		}
		
		
		model.addAttribute("chat",chat);
		int i=chatService.updateChat(chat);
		if(i==1){
			User user=(User) session.getAttribute("user");
			if(user!=null&&user.getRole()==1){
			
				return "redirect:selectChat";
			}else{
				model.addAttribute("id", user.getId());
				return "redirect:selectChatByUserId";
			}
			
			
		}else{
			model.addAttribute("msg","ÐÞ¸ÄÊ§°Ü");
			return "fail";
		}
		
		
		
	}
	
	@RequestMapping(value="/deleteChatByIds")
	public String deleteChatByIds(int[] ids,Model model,HttpSession session){
		
		for(int i=0;i<ids.length;i++){
			Chat chat=chatService.selectChatById(ids[i]);
			
			String path=session.getServletContext().getRealPath("\\img\\lt\\");
			String filename1=chat.getImage_name();
			chat.setImage_name(filename1);
			String fullFilePath1= path + File.separator + filename1;
			File deleteFile1 = new File(fullFilePath1);
			if (deleteFile1.exists() && deleteFile1.isFile()) {
				deleteFile1.delete(); 
		       	System.out.println("¾ÉÎÄ¼þ"+filename1+"ÒÑÉ¾³ý");
		     }
		}
		chatService.deleteChatByIds(ids);	
		return "redirect:selectChat";
		
	}
}
