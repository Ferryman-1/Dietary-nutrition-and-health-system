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

import com.bean.Menu;
import com.bean.MenuType;
import com.bean.Type;
import com.bean.Up;
import com.bean.User;
import com.service.CollectService;
import com.service.MenuService;
import com.service.MenuTypeService;
import com.service.TypeService;
import com.service.UpService;
import com.service.UserService;
import com.util.PageManager;
import com.util.WordToHtml;

@Controller
public class MenuController {
	@Resource(name="menuService")
	MenuService menuService;
	@Resource(name="typeService")
	TypeService typeService;
	
	@Resource(name="menutypeService")
	MenuTypeService menutypeService;

	@Resource(name="wordToHtml")
	WordToHtml wordToHtml;
	
	@Resource(name="upService")
	UpService upService;
	
	@Resource(name="userService")
	UserService userService;
	
	@Resource(name="collectService")
	CollectService collectService;
	
	@RequestMapping(value="/selectMenu")
	public String selectMenu(MenuType menuType,Menu menu,Integer pageNow,HttpServletRequest request,Model model,HttpSession session){
		/*menuType.setType_id(menu.getType_id());*/
		if(pageNow==null) pageNow=1;
		
		int totalSize=menuService.selectMenuCount(menu,menuType);
		PageManager pm=new PageManager(pageNow,5,totalSize);
		Map map=new HashMap();
		map.put("menu", menu);
		map.put("pm",pm);
		map.put("menuType",menuType);
		
		List<Menu> menuList=menuService.selectMenu(map);
		
		for(int i = 0; i < menuList.size(); i ++){
			int ids = menuList.get(i).getId();
			int count = upService.selectAllUpCount(ids);  
			System.out.println("点赞总数"+count);
			menuList.get(i).setUpSum(count);
			int count2 = collectService.selectAllCollectCount(ids);
			menuList.get(i).setCollectSum(count2);
			System.out.println("收藏总数"+count2);
		}
		
		model.addAttribute("menuList",menuList);
				
		model.addAttribute("menu",menu);
		model.addAttribute("pm",pm);
		model.addAttribute("menuType",menuType);
		
		List<Type> typeList=typeService.selectAllType();
		model.addAttribute("typeList",typeList);
		
		
		User user=(User) session.getAttribute("user");
		if(user!=null&&user.getRole()==1){
			return "menu/menu_select";
		}else{
			return "menu/menu";}
		
	}
	
	@RequestMapping(value="/selectMenuById")
	public String selectMenuById(Model model,Menu menu,HttpSession session ){
		Menu u=(Menu)session.getAttribute("menu");
		Menu menu2=menuService.selectMenuById(u.getId());
		model.addAttribute("menu2", menu2);
		return "index";
		
	}
	
	@RequestMapping(value="/selectMenuByTypeId")
	public String selectMenuByTypeId(Model model,Menu menu,HttpSession session,Map map){
		int id=1;
		List<Menu> menuList2=menuService.selectMenuByTypeId(id);
		
		
		List<Up> upList=upService.selectAllup();
		model.addAttribute("upList",upList);
		
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		for(int i = 0; i < menuList2.size(); i ++){
			int ids = menuList2.get(i).getId();
			int count = upService.selectAllUpCount(ids);  
			System.out.println("点赞总数"+count);
			menuList2.get(i).setUpSum(count);
			int count2 = collectService.selectAllCollectCount(ids);
			menuList2.get(i).setCollectSum(count2);
			System.out.println("收藏总数"+count2);
		}
		model.addAttribute("menuList2",menuList2);
		model.addAttribute("id",id);
		return "index";
		
	}
	
	@RequestMapping(value="/selectMenuByTypeId1")
	public String selectMenuByTypeId1(Model model,int id,HttpSession session ){
		List<Menu> menuList2=menuService.selectMenuByTypeId(id);
		
		
		List<Up> upList=upService.selectAllup();
		model.addAttribute("upList",upList);
		
		List<User> userList=userService.selectAllUser();
		model.addAttribute("userList",userList);
		for(int i = 0; i < menuList2.size(); i ++){
			int ids = menuList2.get(i).getId();
			int count = upService.selectAllUpCount(ids);  
			System.out.println("点赞总数"+count);
			menuList2.get(i).setUpSum(count);
			int count2 = collectService.selectAllCollectCount(ids);
			menuList2.get(i).setCollectSum(count2);
			System.out.println("收藏总数"+count2);
		}
		model.addAttribute("menuList2",menuList2);
		model.addAttribute("id",id);
		return "index";
		
	}
	
	
	@RequestMapping(value="/deleteMenuById")
	public String deleteMenuById(int id,Model model,HttpSession session){
		Menu menu=menuService.selectMenuById(id);
		
		String path=session.getServletContext().getRealPath("\\menu\\word\\");
		String filename1=menu.getHtm_name();
		String filename2=menu.getWord_name();
		menu.setHtm_name(filename1);
		menu.setWord_name(filename2);
		String fullFilePath1= path + File.separator + filename1;
		String fullFilePath2= path + File.separator + filename2;
		String fullFilePath3 = path + File.separator + menu.getImage_name()+".files";
		File deleteFile1 = new File(fullFilePath1);
		File deleteFile2 = new File(fullFilePath2);
		File deleteFile3 = new File(fullFilePath3);
		if (deleteFile1.exists() && deleteFile1.isFile()) {
			deleteFile1.delete(); 
	       	System.out.println("旧文件"+filename1+"已删除");
	     }
	    if (deleteFile2.exists() && deleteFile2.isFile()) {
	        deleteFile2.delete(); 
	        System.out.println("旧文件"+filename2+"已删除");
	     }	
	    if (deleteFile3.exists() ) {
      	  MenuService.deleteDir(fullFilePath3);
      	
      	System.out.println("旧文件"+fullFilePath3+"已删除");
      }
		
	    menutypeService.deleteMenuTypeByMenuId(id);
	    
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
		
		Menu menu=menuService.selectMenuById(id);
		
		String path=session.getServletContext().getRealPath("\\menu\\word\\");
		String filename1=menu.getHtm_name();
		String filename2=menu.getWord_name();
		menu.setHtm_name(filename1);
		menu.setWord_name(filename2);
		String fullFilePath1= path + File.separator + filename1;
		String fullFilePath2= path + File.separator + filename2;
		String fullFilePath3 = path + File.separator + menu.getImage_name()+".files";
		File deleteFile1 = new File(fullFilePath1);
		File deleteFile2 = new File(fullFilePath2);
		File deleteFile3 = new File(fullFilePath3);
		if (deleteFile1.exists() && deleteFile1.isFile()) {
			deleteFile1.delete(); 
	       	System.out.println("旧文件"+filename1+"已删除");
	     }
	    if (deleteFile2.exists() && deleteFile2.isFile()) {
	        deleteFile2.delete(); 
	        System.out.println("旧文件"+filename2+"已删除");
	     }	
	    if (deleteFile3.exists() ) {
      	  MenuService.deleteDir(fullFilePath3);
      	
      	System.out.println("旧文件"+fullFilePath3+"已删除");
      }
	    
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
	

	
	@RequestMapping("/addMenu")
	public String addMenu(Menu menu,MenuType menuType,Model model,@RequestParam("file") MultipartFile file,HttpSession session){
		Date date=new Date();
		menu.setAddTime(date);
		if (!file.isEmpty()){
			//把文件上传到news\word文件夹下
			String path=session.getServletContext().getRealPath("\\menu\\word\\");
			String filename=file.getOriginalFilename();
			String fileType=filename.substring(filename.indexOf("."));
			//上传的word文件名
			String newFilename=new Long(new Date().getTime()).toString()+fileType;
			//得到转换的htm文件名，存到数据库
			String htmName=newFilename.substring(0,newFilename.indexOf("."))+".htm";
			String img=newFilename.substring(0,newFilename.indexOf("."));
			menu.setWord_name(newFilename);
			menu.setHtm_name(htmName);
			menu.setImage_name(img);
			File filepath=new File(path,newFilename);
			if (!filepath.getParentFile().exists()){
				filepath.getParentFile().mkdirs();
			}
			try {
				file.transferTo(new File(path+"\\"+newFilename));
				path=path+"\\";
				String wordPath=path+newFilename;
				wordToHtml.change(wordPath, path);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			model.addAttribute("msg", "文件为空");
			return "fail";
		}
		model.addAttribute("menu",menu);
		menuService.addMenu(menu);
		System.out.println("controller====="+menu.getId()+"====");
		
		Integer[] type_id;
		type_id=menu.getType_id();
		menuType.setMenu_id(menu.getId());
		for(int i=0;i<menu.getType_id().length;i++){
			menuType.setType_id(type_id[i]);
			menutypeService.addMenuType(menuType);
		}	
		return "redirect:selectMenu";
	}
	

	@RequestMapping(value="/updateMenuView")
	public String updateMenuView(int id,Model model){
		List<MenuType> menutypeList=menutypeService.selectTypeByMenuId(id);
		model.addAttribute("menutypeList",menutypeList);
		List<Type> typeList=typeService.selectAllType();
		model.addAttribute("typeList",typeList);
		Menu menu=menuService.selectMenuById(id);
		model.addAttribute("menu",menu);
		return "menu/menu_update";
		
	}
	
	
	
	@RequestMapping(value="/updateMenu")
	public String updateMenu(Menu menu,MenuType menuType,Model model,@RequestParam("file") MultipartFile file,HttpSession session){
		Menu menu1=menuService.selectMenuById(menu.getId());
		String filename1=menu1.getWord_name();
		String filename2=menu1.getHtm_name();
		Date date=menu1.getAddTime();
		
		if (!file.isEmpty()){
			
			String path=session.getServletContext().getRealPath("\\menu\\word\\");
			
			menu1.setWord_name(filename1);
			menu1.setHtm_name(filename2);
			String fullFilePath = path + File.separator + filename1;
			String fullFilePath2 = path + File.separator + filename2;
			String fullFilePath1 = path + File.separator + menu1.getImage_name()+".files";
			File deleteFile = new File(fullFilePath);
			File deleteFile1 = new File(fullFilePath1);
			File deleteFile2 = new File(fullFilePath2);
			System.out.println(fullFilePath);
			System.out.println(filename1);
	        if (deleteFile.exists() && deleteFile.isFile()) {
	        	deleteFile.delete(); 
	        	System.out.println("旧文件"+filename1+"已删除");
	        }
	        if (deleteFile2.exists() && deleteFile2.isFile()) {
	        	deleteFile2.delete(); 
	        	
	        	System.out.println("旧文件"+filename2+"已删除");
	        }
	        if (deleteFile1.exists() ) {
	        	  MenuService.deleteDir(fullFilePath1);
	        	
	        	System.out.println("旧文件"+fullFilePath1+"已删除");
	        }
	        
	      
		
			//把文件上传到news\word文件夹下
			//String path=session.getServletContext().getRealPath("\\menu\\word\\");
			String filename=file.getOriginalFilename();
			String fileType=filename.substring(filename.indexOf("."));
			//上传的word文件名
			String newFilename=new Long(new Date().getTime()).toString()+fileType;
			//得到转换的htm文件名，存到数据库
			String htmName=newFilename.substring(0,newFilename.indexOf("."))+".htm";
			String img=newFilename.substring(0,newFilename.indexOf("."));
			menu.setWord_name(newFilename);
			menu.setHtm_name(htmName);
			menu.setImage_name(img);
			menu.setAddTime(date);
			File filepath=new File(path,newFilename);
			if (!filepath.getParentFile().exists()){
				filepath.getParentFile().mkdirs();
			}
			try {
				file.transferTo(new File(path+"\\"+newFilename));
				path=path+"\\";
				String wordPath=path+newFilename;
				wordToHtml.change(wordPath, path);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			menu.setWord_name(filename1);
			menu.setHtm_name(filename2);
			menu.setImage_name(menu1.getImage_name());
			menu.setAddTime(date);
		}
		
		menutypeService.deleteMenuTypeByMenuId(menu.getId());
		Integer[] type_id;
		type_id=menu.getType_id();
		menuType.setMenu_id(menu.getId());
		for(int j=0;j<menu.getType_id().length;j++){
			menuType.setType_id(type_id[j]);
			menutypeService.addMenuType(menuType);
		}
		
		model.addAttribute("menu",menu);
		int i=menuService.updateMenu(menu);
		if(i==1){

			return "redirect:selectMenu";
			
		}else{
			model.addAttribute("msg","修改失败");
			return "fail";
		}
		
		
		
	}
	
	@RequestMapping(value="/deleteMenuByIds")
	public String deleteMenuByIds(int[] ids,Model model,HttpSession session){
		
		for(int i=0;i<ids.length;i++){
			Menu menu=menuService.selectMenuById(ids[i]);
			
			String path=session.getServletContext().getRealPath("\\menu\\word\\");
			String filename1=menu.getHtm_name();
			String filename2=menu.getWord_name();
			menu.setHtm_name(filename1);
			menu.setWord_name(filename2);
			String fullFilePath1= path + File.separator + filename1;
			String fullFilePath2= path + File.separator + filename2;
			String fullFilePath3 = path + File.separator + menu.getImage_name()+".files";
			File deleteFile1 = new File(fullFilePath1);
			File deleteFile2 = new File(fullFilePath2);
			File deleteFile3 = new File(fullFilePath3);
			if (deleteFile1.exists() && deleteFile1.isFile()) {
				deleteFile1.delete(); 
		       	System.out.println("旧文件"+filename1+"已删除");
		     }
		    if (deleteFile2.exists() && deleteFile2.isFile()) {
		        deleteFile2.delete(); 
		        System.out.println("旧文件"+filename2+"已删除");
		     }	
		    if (deleteFile3.exists() ) {
	      	  MenuService.deleteDir(fullFilePath3);
	      	
	      	System.out.println("旧文件"+fullFilePath3+"已删除");
	      }
		}
		menuService.deleteMenuByIds(ids);	
		return "redirect:selectMenu";
		
	}
	
	@RequestMapping(value="/menudDetail")
	public String menudetail(String htm_name,Model model){
		model.addAttribute("htm_name",htm_name);
		System.out.println(htm_name);
		return "menu/word/menu_detail";
		
	}
}
