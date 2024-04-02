package com.controller;


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

import com.bean.User;
import com.bean.Userback;
import com.service.UserService;
import com.service.UserbackService;
import com.util.PageManager;

@Controller
public class UserBackController {
	@Resource(name="userService")
	UserService userService;
	@Resource(name="userbackService")
	UserbackService userbackService;
	
	
	@RequestMapping(value="/selectUserback")
	public String selectUserback(Userback userback,Integer pageNow,Model model,HttpSession session){
		if(pageNow==null) pageNow=1;
		int totalSize=userbackService.selectUserbackCount(userback);
		PageManager pm=new PageManager(pageNow,5,totalSize);
		Map map=new HashMap();
		map.put("userback", userback);
		map.put("pm",pm);
		
		List<Userback> userbackList=userbackService.selectUserback(map);
		model.addAttribute("userbackList",userbackList);
		model.addAttribute("userback",userback);
		model.addAttribute("pm",pm);
		
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		
		User user=(User) session.getAttribute("user");
		if(user!=null&&user.getRole()==1){
			return "userback/userback_select";
		}else{ 
		return "userback/userback";}
		
	}
	

	@RequestMapping("/addUserback")
	public String addUserback(HttpServletRequest re,Userback userback,Model model,HttpSession session){
		Date date=new Date();
		userback.setUserback_time(date);
		User user=(User) session.getAttribute("user");
		userback.setUser_id(user.getId());
		String email = re.getParameter("email");
		String content = re.getParameter("content"); 
		userback.setEmail(email);
		userback.setContent(content);
		
		int i = userbackService.addUserback(userback);
		if(i == 1){
			return "redirect:selectUserback";
		}else{
			model.addAttribute("msg","ÓÃ»§·´À¡Ê§°Ü£¡");
			return "fail";
		}
	}

	
	
	
	@RequestMapping(value="/selectUserbackById")
	public String selectUserbackById(Integer id,Model model){
		Userback userback=userbackService.selectUserbackById(id);
		model.addAttribute("userback", userback);
		return "userback/userback_content";
		
		
	}
	
	@RequestMapping(value="/selectUserbackByUserId")
	public String selectUserbackByUserId(Integer id,Model model){
		List<Userback> userbackList=userbackService.selectUserbackByUserId(id);
		model.addAttribute("userbackList", userbackList);
		return "userback/userbacku";
		
		
	}
	
	@RequestMapping(value="/deleteUserbackById")
	public String deleteUserbackById(int id,Model model,HttpSession session){
		Userback userback=userbackService.selectUserbackById(id);
		int i=userbackService.deleteUserbackById(id);
		if(i==0){
			model.addAttribute("msg", "É¾³ýÊ§°Ü");
			return "fail";
		}else{
				return "redirect:selectUserback";
			
		}
		
	}
	
	@RequestMapping(value="/deleteUserbackById1")
	public String deleteUserbackById1(int id,Model model,HttpSession session){
		Userback userback=userbackService.selectUserbackById(id);
		int i=userbackService.deleteUserbackById(id);
		int user_id=userback.getUser_id();
		if(i==0){
			model.addAttribute("msg", "É¾³ýÊ§°Ü");
			return "fail";
		}else{
			model.addAttribute("id", user_id);
				return "redirect:selectUserbackByUserId";
			
		}
		
	}
	
	@RequestMapping(value="/updateUserbackView")
	public String updateUserbackView(int id,Model model){
		Userback userback=userbackService.selectUserbackById(id);
		model.addAttribute("userback",userback);
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		
		return "userback/userback_update";	
	}
	
	@RequestMapping(value="/updateUserback")
	public String updateUserback(Userback userback,Model model,HttpSession session){
		
		
		int i=userbackService.updateUserback(userback);
		if(i==1){

			return "redirect:selectUserback";
			
		}else{
			model.addAttribute("msg","ÐÞ¸ÄÊ§°Ü");
			return "fail";
		}
		
		
		
	}
}
