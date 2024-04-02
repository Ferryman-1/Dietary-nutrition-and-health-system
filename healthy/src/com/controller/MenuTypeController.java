package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;
import com.bean.User;
import com.service.MenuService;
import com.service.MenuTypeService;
import com.service.TypeService;
import com.util.PageManager;
import com.util.WordToHtml;

@Controller
public class MenuTypeController {
	@Resource(name="menuService")
	MenuService menuService;
	@Resource(name="menutypeService")
	MenuTypeService menutypeService;
	
	@RequestMapping("/addMenuType")
	public String addMenuType(Menu menu,Model model,MenuType menuType,HttpSession session){
		Integer[] type_id;
		//type_id=menu.getType_id();
		//menuType.setMenu_id(menu.getId());
		//for(int i=0;i<menu.getType_id().length;i++){
		//	menuType.setType_id(type_id[i]);
		///	menutypeService.addMenuType(menuType);
		//}
		
		return "redirect:selectMenu";
	}
	

	
}
