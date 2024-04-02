package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Collect;
import com.bean.Menu;
import com.bean.Up;
import com.bean.User;
import com.service.CollectService;
import com.service.MenuService;
import com.service.UpService;
import com.service.UserService;
@Controller
public class CollectController {
	@Resource(name="collectService")
	CollectService collectService;
	
	@Resource(name="upService")
	UpService upService;
	
	@Resource(name="menuService")
	MenuService menuService;
	
	@Resource(name="userService")
	UserService userService;
	
	@RequestMapping(value="/addCollect")
	public String addCollect(Model model,int menu_id,HttpSession session){
		Collect collect = new Collect();
		User user=(User) session.getAttribute("user");
		
		collect.setUser_id(user.getId());
		collect.setMenu_id(menu_id);
		collectService.addCollect(collect);
		
		return "redirect:selectMenuByTypeId";
		
	}
	
	@RequestMapping(value="/addCollect1")
	public String addCollect1(Model model,int menu_id,HttpSession session){
		Collect collect = new Collect();
		User user=(User) session.getAttribute("user");
		
		collect.setUser_id(user.getId());
		collect.setMenu_id(menu_id);
		collectService.addCollect(collect);
		
		return "redirect:selectMenu";
		
	}
	
	@RequestMapping(value="/deleteCollectById")
	public String deleteCollectById(int id,Model model,HttpSession session){
		int i=collectService.deleteCollectById(id);
		if(i==0){
			model.addAttribute("msg", "取消收藏失败");
			return "fail";
		}else{
				return "redirect:selectMenu";
			
		}
		
	}
	
	@RequestMapping(value="/deleteCollectById1")
	public String deleteCollectById1(int id,Model model,HttpSession session){
		int i=collectService.deleteCollectById(id);
		if(i==0){
			model.addAttribute("msg", "取消收藏失败");
			return "fail";
		}else{
				return "redirect:selectMenuByTypeId";
			
		}
		
	}
	
	@RequestMapping(value="/deleteCollectById3")
	public String deleteCollectById3(int id,Model model,HttpSession session){
		int i=collectService.deleteCollectById(id);
		if(i==0){
			model.addAttribute("msg", "取消点赞失败");
			return "fail";
		}else{
			  User user=(User) session.getAttribute("user");
			  int uid=user.getId();
			  model.addAttribute("id", uid);
				return "redirect:selectCollectByUserId";
			
		}
		
	}
	
	@RequestMapping("/selectCollectByUserId")
	public String selectCollectByUserId(int id,Collect collect,Integer pageNow,Model model,HttpSession session){
		List<Collect> collectList1 = collectService.selectCollectByUserId(id);
		List<Menu> menuList=menuService.selectAllMenu();
		
		for(int i = 0; i < menuList.size(); i ++){
			int ids = menuList.get(i).getId();
			int count = upService.selectAllUpCount(ids);  
			System.out.println("点赞总数"+count);
			menuList.get(i).setUpSum(count);
			int count2 = collectService.selectAllCollectCount(ids);
			menuList.get(i).setCollectSum(count2);
			System.out.println("收藏总数"+count2);
		}
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("collectList1", collectList1);
		return "collect/collect";
	}
	
}

