package com.sist.vo;
/*
 *  테이블 명 review_table
  
	review_no NUMBER        NOT NULL,
    no        NUMBER        NOT NULL,
    cate_no    NUMBER       NOT NULL,
    id        VARCHAR2(300) NOT NULL,
    name      VARCHAR2(200) NOT NULL,
	content         CLOB         ,
	regdate         DATE,
	group_id        NUMBER,
	group_step      NUMBER,
	group_tab       NUMBER,
	root            NUMBER,
	depth           NUMBER,
	CONSTRAINT PK_review_table PRIMARY KEY (review_no)
 */
public class ReplyVO {
	private int review_no;
	private int no;
	private int cate_no;
	private String id;
	private String name;
	private String content;
	private int group_id;
	private int group_step;
	private int group_tab;
	private int root;
	private int depth;
	private String dbday;
	
	
	
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
}
