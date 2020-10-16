package com.sist.vo;
public class ShopVO {
	private int cate_no; // 카테고리
	private int shop_no; // 번호	
	private String title; // 상품제목
	private String poster; // 상품사진
	private String subtitle; // 상품설명
	private String price; // 가격
	private String content; // 상세정보
	private String delivery_fee; // 배송비
	private int hit; // 조회수 
//	private int option; // 옵션
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(String delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}