package com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Type;
import com.dao.TypeDao;



@Service("typeService")
public class TypeService{
	
	@Resource(name="typeDao")
	TypeDao typeDao;
	

	public List<Type> selectAllType(){
		return typeDao.selectAllType();
	}
}
