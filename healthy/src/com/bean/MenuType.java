package com.bean;

public class MenuType {
	Integer id;
	Integer menu_id;

	Integer type_id;
	Type type;
	Menu menu;
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(Integer menuId) {
		menu_id = menuId;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_Id) {
		type_id = type_Id;
	}
}
