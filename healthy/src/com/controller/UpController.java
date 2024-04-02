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

import com.bean.Menu;
import com.bean.Up;
import com.bean.User;
import com.service.CollectService;
import com.service.MenuService;
import com.service.UpService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class UpController {
	@Resource(name="upService")
	UpService upService;
	
	@Resource(name="menuService")
	MenuService menuService;
	
	@Resource(name="userService")
	UserService userService;
	
	@Resource(name="collectService")
	CollectService collectService;
	
	
	
	@RequestMapping(value="/addUp")
	public String addUp(Model model,int menu_id,HttpSession session){
		Up up = new Up();
		User user=(User) session.getAttribute("user");
		
		up.setUser_id(user.getId());
		up.setMenu_id(menu_id);
		upService.addUp(up);
		
		return "redirect:selectMenuByTypeId";
		
	}
	
	@RequestMapping(value="/addUp1")
	public String addUp1(Model model,int menu_id,HttpSession session){
		Up up = new Up();
		User user=(User) session.getAttribute("user");
		
		up.setUser_id(user.getId());
		up.setMenu_id(menu_id);
		upService.addUp(up);
		
		return "redirect:selectMenu";
		
	}
	
	@RequestMapping(value="/deleteUpById1")
	public String deleteUpById1(int id,Model model,HttpSession session){
		int i=upService.deleteUpById(id);
		if(i==0){
			model.addAttribute("msg", "取消点赞失败");
			return "fail";
		}else{
				return "redirect:selectMenuByTypeId";
			
		}
		
	}
	
	@RequestMapping(value="/deleteUpById")
	public String deleteUpById(int id,Model model,HttpSession session){
		int i=upService.deleteUpById(id);
		if(i==0){
			model.addAttribute("msg", "取消点赞失败");
			return "fail";
		}else{
				return "redirect:selectMenu";
			
		}
		
	}
	
	@RequestMapping(value="/deleteUpById3")
	public String deleteUpById3(int id,Model model,HttpSession session){
		int i=upService.deleteUpById(id);
		if(i==0){
			model.addAttribute("msg", "取消点赞失败");
			return "fail";
		}else{
			  User user=(User) session.getAttribute("user");
			  int uid=user.getId();
			  model.addAttribute("id", uid);
				return "redirect:selectUpByUserId";
			
		}
		
	}
	
	@RequestMapping("/selectUpByUserId")
	public String selectUpByUserId(int id,Up up,Integer pageNow,Model model,HttpSession session){
		
	  
		List<Up> upList1 = upService.selectUpByUserId(id);
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
		model.addAttribute("upList1", upList1);
		return "up/up";
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
			model.addAttribute("msg", "删除失败");
			return "fail";
		}else{
				return "redirect:selectMenu";
			
		}
		
	}

	@RequestMapping(value="/deleteMenuById1")
	public String deleteMenuById1(int id,Model model,HttpSession session){
		int i=menuService.deleteMenuById(id);
		if(i==0){
			model.addAttribute("msg", "删除失败");
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
			model.addAttribute("msg","修改失败");
			return "fail";
		}
		
		
	}*/
}
