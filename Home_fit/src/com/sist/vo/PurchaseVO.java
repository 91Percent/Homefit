package com.sist.vo;

import java.util.Date;

/*
 * 이름           널?       유형             
------------ -------- -------------- 
PURCHASE_NO  NOT NULL NUMBER         
WISHLIST_NO           NUMBER         
BUYER_INFO            VARCHAR2(1000) 
ADDRESS_INFO          VARCHAR2(1000) 
PAYMENT_INFO          VARCHAR2(1000) 
CANCEL                VARCHAR2(200)  
ADMIN_SIGN            VARCHAR2(200)  
PURCHASE_DATE          DATE
 */
public class PurchaseVO {
	private int purchase_no;
	private int wishlist_no;
	private String buyer_info;
	private String address_info;
	private String payment_info;
	private String cancel;
	private String admin_sign;
	private Date purchase_date;
	private WishlistVO wvo=new WishlistVO();
	public int getPurchase_no() {
		return purchase_no;
	}
	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
	}
	public int getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
	}
	public String getBuyer_info() {
		return buyer_info;
	}
	public void setBuyer_info(String buyer_info) {
		this.buyer_info = buyer_info;
	}
	public String getAddress_info() {
		return address_info;
	}
	public void setAddress_info(String address_info) {
		this.address_info = address_info;
	}
	public String getPayment_info() {
		return payment_info;
	}
	public void setPayment_info(String payment_info) {
		this.payment_info = payment_info;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public String getAdmin_sign() {
		return admin_sign;
	}
	public void setAdmin_sign(String admin_sign) {
		this.admin_sign = admin_sign;
	}
	public Date getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}
	public WishlistVO getWvo() {
		return wvo;
	}
	public void setWvo(WishlistVO wvo) {
		this.wvo = wvo;
	}
	
	
}
