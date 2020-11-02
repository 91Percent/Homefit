package com.sist.vo;
/*
 * 이름          널?       유형            
----------- -------- ------------- 
FAVORITE_NO NOT NULL NUMBER        
SHOP_NO              NUMBER        
ID          NOT NULL VARCHAR2(300) 
 */
public class FavoritelistVO {
	private int favorite;
	private int shop_no;
	private String id;
	
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
