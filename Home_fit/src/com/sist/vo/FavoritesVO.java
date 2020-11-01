package com.sist.vo;
/*
 * ID      NOT NULL VARCHAR2(300) 
	HOME_NO NOT NULL NUMBER        
	NO               NUMBER   
 */
public class FavoritesVO {
	private String id;
	private int home_no;
	private int no;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHome_no() {
		return home_no;
	}
	public void setHome_no(int home_no) {
		this.home_no = home_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	
}
