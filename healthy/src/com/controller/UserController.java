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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Chat;
import com.bean.Menu;
import com.bean.Type;
import com.bean.User;
import com.service.MenuService;
import com.service.TypeService;
import com.service.UserService;
import com.util.PageManager;

@Controller
public class UserController {
	@Resource(name="userService")
	UserService userService;
	@Resource(name="menuService")
	MenuService menuService;
	
	@Resource(name="typeService")
	TypeService typeService;
	@RequestMapping(value="/tuichu")
	public String tuichu(HttpSession session){
		session.removeAttribute("user");
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpSession session ,Model model){
		User user1 = userService.login(user);
		if(user1==null){
			model.addAttribute("msg", "��¼ʧ��");
			return "fail";
		}else{
			
			session.setAttribute("user", user1);
			if(user.getRole()==1){
				return "redirect:selectMenu";
			}else{
				int id=1;
			
			return "redirect:selectMenuByTypeId"; //redirect:selectMenuByTypeId
			}
		}
		
	}
	

	@RequestMapping(value="/register")
	public String register(HttpSession session){
		List<Type> typeList = typeService.selectAllType();
		session.setAttribute("typeList", typeList);
		return "register";
	}
	
	@RequestMapping("/addUser")
	public String addUser(User user,MultipartFile file,Model model,HttpSession session){
		//���ļ��ϴ���news\word�ļ�����
		if (!file.isEmpty()){
			
		
		String path=session.getServletContext().getRealPath("\\img\\tx\\");
		String filename=file.getOriginalFilename();
		String fileType=filename.substring(filename.indexOf("."));
		//�ϴ���word�ļ���
		String newFilename=new Long(new Date().getTime()).toString()+fileType;
		//�õ�ת����htm�ļ������浽���ݿ�
		user.setImage_name(newFilename);
		File filepath=new File(path,newFilename);
		if (!filepath.getParentFile().exists()){
			filepath.getParentFile().mkdirs();
		}
		
		
		try {
			file.transferTo(new File(path+"\\"+newFilename));
			
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "����ĵ�ʧ��");
			return "fail";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", "����ĵ�ʧ��");
			return "fail";
		}
		}
		int i = 0;
		i = userService.addUser(user);
		if(i==1){
			return "login";
		}else{
			model.addAttribute("msg", "����û�ʧ��");
			return "fail";
		}
	
		
	}
	
	@RequestMapping("/selectUserView")
	public String slectUserView(int id,Model model){
		User user = userService.selectUserById(id);
		model.addAttribute("user", user);
		return "info";
	}
	
	
	@RequestMapping("/selectUserView2")
	public String slectUserView2(int id,Model model){
		User user = userService.selectUserById(id);
		model.addAttribute("user", user);
		return "info2";
	}
	
	@RequestMapping("/selectUser")
	public String selectUser(User user,Integer pageNow,Model model,HttpSession session){
		if(pageNow==null) pageNow=1;
		int totalSize = userService.selectUserCount(user);
		PageManager pm = new PageManager(pageNow,5,totalSize);
		Map map = new HashMap();
		map.put("user", user);//��ѯ����
		map.put("pm", pm);//��ѯ��ҳ��Ϣ
		List<User> userList = userService.selectUser(map);
		model.addAttribute("userList", userList);
		model.addAttribute("user", user);
		model.addAttribute("pm", pm);
		
		List<Type> typeList = typeService.selectAllType();
	
		session.setAttribute("typeList", typeList);
		return "user/user_select";
	}
	
	
	@RequestMapping("/updateUserView")
	public String updateUserView(int id,Model model){
		User user = userService.selectUserById(id);
		model.addAttribute("user", user);
		return "user/user_update";
	}
	
	@RequestMapping("/updateUserView2")
	public String updateUserView2(int id,Model model){
		User user = userService.selectUserById(id);
		model.addAttribute("user", user);
		return "user/user_update2";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(User user,Model model){
		int i = userService.updateUser(user);
		if(i==1){
			return "redirect:selectUser";
		}else{
			model.addAttribute("msg", "�޸��û�ʧ��");
			return "fail";
		}
	}

	@RequestMapping("/updateUser2")
	public String updateUser2(User user,MultipartFile file,Model model,HttpSession session){
		User user1=userService.selectUserById(user.getId());
		String filename1=user1.getImage_name();
		
		if(!file.isEmpty()){
			
			String path = session.getServletContext().getRealPath("\\img\\tx\\");
			
			user1.setImage_name(filename1);
	
			String fullFilePath = path + File.separator + filename1;
			File deleteFile = new File(fullFilePath);
			System.out.println(fullFilePath);
			System.out.println(filename1);
	        if (deleteFile.exists() && deleteFile.isFile()) {
	        	deleteFile.delete(); 
	        	
	        	System.out.println("���ļ�"+filename1+"��ɾ��");
	        }
			
			String filename = file.getOriginalFilename();
			String fileType=filename.substring(filename.indexOf("."));
			//�ϴ���word�ļ���
			String newFilename=new Long(new Date().getTime()).toString()+fileType;
			//�õ�ת����htm�ļ������浽���ݿ�
			user.setImage_name(newFilename);
			File filepath=new File(path,newFilename);
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
			user.setImage_name(filename1);
		}
		model.addAttribute("user", user);
		int i = userService.updateUser2(user);	
		if(i==1){
			
			return "info2";
		}else{
			model.addAttribute("msg", "�޸��û�ʧ��");
			return "fail";
		}	
		
	}
	
	
	@RequestMapping("/deleteUser")
	public String deleteUser(int id,Model model,HttpSession session){		
		User user=userService.selectUserById(id);		
		String path=session.getServletContext().getRealPath("\\img\\tx\\");
		String filename1=user.getImage_name();
		user.setImage_name(filename1);
		String fullFilePath1= path + File.separator + filename1;
		File deleteFile1 = new File(fullFilePath1);
		if (deleteFile1.exists() && deleteFile1.isFile()) {
			deleteFile1.delete(); 
	       	System.out.println("���ļ�"+filename1+"��ɾ��");
	     }
		
		int i = userService.deleteUserById(id);
		if(i==1){
			return "redirect:selectUser";
		}else{
			model.addAttribute("msg", "ɾ���û�ʧ��");
			return "fail";
		}
		
	}
	
	
	
	@RequestMapping("/deleteUsers")
	public String deleteUsers(int ids[]){
		userService.deleteUsers(ids);
		return "redirect:selectUser";
	}
	
	@RequestMapping("/quit")     //�˳���¼
	public String outLogin(HttpSession session){
		session.removeAttribute("user");  //���ָ����session
		session.invalidate();  //���ȫ����session
		return "login";
	}
	
	
}
