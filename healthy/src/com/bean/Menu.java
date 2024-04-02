package com.bean;

import java.util.Date;
import java.util.List;

public class Menu {
	Integer id;
	String image_name;
	String menu_name;
	String word_name;
	Integer [] type_id;
	String htm_name;
	Date addTime;
	String show1;
	
	Type type;
	List<MenuType> menutype;
	List<Up> up;
	List<Collect> collect;
	Integer upSum;
	Integer collectSum;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String imageName) {
		image_name = imageName;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menuName) {
		menu_name = menuName;
	}
	public String getWord_name() {
		return word_name;
	}
	public void setWord_name(String wordName) {
		word_name = wordName;
	}

	public String getShow1() {
		return show1;
	}
	public void setShow1(String show1) {
		this.show1 = show1;
	}
	
	public List<MenuType> getMenutype() {
		return menutype;
	}
	public void setMenutype(List<MenuType> menutype) {
		this.menutype = menutype;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public String getHtm_name() {
		return htm_name;
	}
	public void setHtm_name(String htmName) {
		htm_name = htmName;
	}
	public Integer[] getType_id() {
		return type_id;
	}
	public void setType_id(Integer[] typeId) {
		type_id = typeId;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public List<Up> getUp() {
		return up;
	}
	public void setUp(List<Up> up) {
		this.up = up;
	}
	public List<Collect> getCollect() {
		return collect;
	}
	public void setCollect(List<Collect> collect) {
		this.collect = collect;
	}
	public Integer getUpSum() {
		return upSum;
	}
	public void setUpSum(Integer upSum) {
		this.upSum = upSum;
	}
	public Integer getCollectSum() {
		return collectSum;
	}
	public void setCollectSum(Integer collectSum) {
		this.collectSum = collectSum;
	}

	
}
