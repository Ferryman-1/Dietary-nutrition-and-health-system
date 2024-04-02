package com.controller;

import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FormController {
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "login";	
	}
	
	@RequestMapping(value="/{same}")
	public String f(@PathVariable String same){
		return same;	
	}
	
}
