package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sun.misc.Request;

import com.bean.Chat;
import com.bean.Comment2;
import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;
import com.bean.User;
import com.service.ChatService;
import com.service.Comment2Service;
import com.service.MenuService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class Comment2Controller {
	@Resource(name="chatService")
	ChatService chatService;
	@Resource(name="userService")
	UserService userService;
	@Resource(name="comment2Service")
	Comment2Service comment2Service;
	
	@RequestMapping(value="/selectComment2")
	public String selectComment2(Comment2 comment2,Integer pageNow,Model model,HttpSession session){
		if(pageNow==null) pageNow=1;
		int totalSize=comment2Service.selectComment2count(comment2);
		PageManager pm=new PageManager(pageNow,5,totalSize);
		Map map=new HashMap();
		map.put("comment2", comment2);
		map.put("pm",pm);
		
		List<Comment2> commentList=comment2Service.selectComment2(map);
		
		model.addAttribute("commentList",commentList);
		model.addAttribute("comment2",comment2);
		model.addAttribute("pm",pm);
		
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		User user=(User) session.getAttribute("user");
		
		if(user!=null&&user.getRole()==1){
			return "comment/comment_select";
		}else{
		return "comment/comment";}
		
	}
	

	
	@RequestMapping("/addComment2")
	public String addComment2(HttpServletRequest re,Comment2 comment2,HttpSession session,Integer chat_id,Model model){
		Date date=new Date();
		comment2.setComment_time(date);
		User user=(User) session.getAttribute("user");
		comment2.setChat_id(chat_id);
		comment2.setUser_id(user.getId());
		String content = re.getParameter("content"); 
		comment2.setContent(content);
		
		int i = comment2Service.addComment2(comment2);
		if(i == 1){
			Integer id = comment2.getChat_id();
			model.addAttribute("id",id);
			return "redirect:selectChatById";
		}else{
			model.addAttribute("msg","·¢±íÆÀÂÛÊ§°Ü£¡");
			return "fail";
		}
	}
	
	@RequestMapping("/addComment23")
	public String addComment23(HttpServletRequest re,Comment2 comment2,HttpSession session,Integer chat_id,Model model){
		Date date=new Date();
		comment2.setComment_time(date);
		User user=(User) session.getAttribute("user");
		comment2.setChat_id(chat_id);
		comment2.setUser_id(user.getId());
		String content = re.getParameter("content"); 
		comment2.setContent(content);
		
		int i = comment2Service.addComment2(comment2);
		if(i == 1){
			Integer id = comment2.getChat_id();
			model.addAttribute("id",id);
			return "redirect:selectChatById3";
		}else{
			model.addAttribute("msg","·¢±íÆÀÂÛÊ§°Ü£¡");
			return "fail";
		}
	}
	
	
	@RequestMapping(value="/deleteComment2ById")
	public String deleteComment2ById(int id,Model model,HttpSession session){
		Comment2 comment2=new Comment2();
		comment2=(Comment2) comment2Service.selectComment2ById1(id);
		int i = comment2Service.deleteComment2ById(id);
		if(i == 1){
			Integer chid = comment2.getChat_id();
			model.addAttribute("id",chid);
			return "redirect:selectChatById";
		}else{
			model.addAttribute("msg","É¾³ýÆÀÂÛÊ§°Ü£¡");
			return "fail";
		}
		
	}
	
	/*@RequestMapping(value="/addChatView")
	public String addChatView(Model model,HttpSession session){
		User user=(User) session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		return "chat/chat_add";
		
	}
	
	
	
	
	
	@RequestMapping(value="/selectChatById")
	public String selectChatById(int id,Model model){
		Chat chat=chatService.selectChatById(id);
		
			model.addAttribute("chat", chat);
			return "chat/chat_content";
		
		
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
				return "redirect:selectChat";
			
		}
		
	}
	
	@RequestMapping(value="/updateChatView")
	public String updateChatView(int id,Model model){
		
		Chat chat=chatService.selectChatById(id);
		model.addAttribute("chat",chat);
		return "chat/chat_update";
		
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

			return "redirect:selectChat";
			
		}else{
			model.addAttribute("msg","ÐÞ¸ÄÊ§°Ü");
			return "fail";
		}
		
		
		
	}*/
}
