package com.controller;

import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.HealthyInfo;
import com.bean.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.service.HealthyInfoService;
import com.service.TypeService;

@Controller
public class HealthyInfoController {
	@Resource(name="typeService")
	TypeService typeService;
	
	@Resource(name="healthyInfoService")
	HealthyInfoService healthyInfoService;
	
	//չʾ��״ͼ
	@RequestMapping(value="/selectSuggest")
	public String findById(int type_id,HealthyInfo healthyInfo,Model model,HttpSession session){
		List<HealthyInfo>  healthyInfoList = healthyInfoService.selectAllHealthyInfo(type_id);
		//ת��Ϊjson���ݲ�����suggest1ҳ��
		ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        String healthyInfoListJson="";
        try {
        	healthyInfoListJson = mapper.writeValueAsString(healthyInfoList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("healthyInfoListJson", healthyInfoListJson);
		System.out.println("===="+healthyInfoListJson+"===");
		
		model.addAttribute("type_id", type_id);
		List<Type>  typeList = typeService.selectAllType();
		User user=(User) session.getAttribute("user");
		model.addAttribute("typeList", typeList);
		if(user!=null&&user.getRole()==1){
			model.addAttribute("healthyInfoList", healthyInfoList);
			return "healthyinfo/healthyinfo_select";
		}else{
			return "healthyinfo/suggest1";}
		
	}
	
	
	
	@RequestMapping(value="/updateHealthyInfoView")
	public String updateHealthyInfoView(int type_id,int id,Model model){
		//��ʾͼ��
		List<HealthyInfo>  healthyInfoList = healthyInfoService.selectAllHealthyInfo(type_id);
		//ת��Ϊjson���ݲ�����suggest1ҳ��
		ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        String healthyInfoListJson="";
        try {
        	healthyInfoListJson = mapper.writeValueAsString(healthyInfoList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("healthyInfoListJson", healthyInfoListJson);
		//�޸�
		HealthyInfo healthyInfo = healthyInfoService.selectHealthyinfoById(id);
		model.addAttribute("healthyInfo", healthyInfo);
		return "healthyinfo/healthyinfo_update";
	}
	
	
	@RequestMapping(value="/updateHealthyInfo")
	public String updateHealthyInfo(HealthyInfo healthyInfo,Model model){
		int i = healthyInfoService.updateHealthyInfo(healthyInfo);
		if(i==1){
			model.addAttribute("type_id", healthyInfo.getType_id());
			return "redirect:selectSuggest";
		}else{
			model.addAttribute("msg", "�޸Ľ�������ʧ��");
			return "fail";
		}
	}
	
	@RequestMapping("/deleteHealthyinfo")
	public String deleteHealthyinfo(int type_id,int id,Model model){
		int i = healthyInfoService.deleteHealthyinfoById(id);
		if(i==1){
			model.addAttribute("type_id", type_id);
			return "redirect:selectSuggest";
		}else{
			model.addAttribute("msg", "ɾ����������ʧ��");
			return "fail";
		}
		
	}
	
	@RequestMapping("/addHealthyInfoView")
	public String addHealthyInfoView(int type_id,Model model){
		List<HealthyInfo>  healthyInfoList = healthyInfoService.selectAllHealthyInfo(type_id);
		//ת��Ϊjson���ݲ�����suggest1ҳ��
		ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        String healthyInfoListJson="";
        try {
        	healthyInfoListJson = mapper.writeValueAsString(healthyInfoList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("healthyInfoListJson", healthyInfoListJson);
		model.addAttribute("type_id", type_id);
		return "healthyinfo/healthyinfo_add";
	}
	
	
	@RequestMapping("/addHealthyinfo")
	public String addHealthyinfo(HealthyInfo healthyInfo,Model model){
		int i = healthyInfoService.addHealthyinfo(healthyInfo);
		if(i==1){
			model.addAttribute("type_id", healthyInfo.getType_id());
			return "redirect:selectSuggest";
		}else{
			model.addAttribute("msg", "��ӽ�������ʧ��");
			return "fail";
		}
		
	}

}
