package com.sist.vo;
/*
 * 이름          널?       유형            
----------- -------- ------------- 
WISHLIST_NO NOT NULL NUMBER        
SHOP_NO              NUMBER        
ID          NOT NULL VARCHAR2(300) 
COUNT                NUMBER        
ISWISH               VARCHAR2(200)
 */
public class WishlistVO {
	private int wishlist_no;
	private int shop_no;
	private String id;
	private int count;
	private String iswish;
	private ShopVO svo=new ShopVO();
	public int getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getIswish() {
		return iswish;
	}
	public void setIswish(String iswish) {
		this.iswish = iswish;
	}
	public ShopVO getSvo() {
		return svo;
	}
	public void setSvo(ShopVO svo) {
		this.svo = svo;
	}
	
	
}
