package com.sist.vo;
import java.util.*;
public class ReplyVO {
	private int review_no;
	private int no;
	private int cate_no;
	private String dbday;
	
	
	
	
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
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	private int bno;
	private int board_review_no;
	private String id;
	private String name;
	private String subject;
	private String content;
	private Date regdate;
	private int group_id;// 같은 종류 댓글을 모아서 처리 
	private int group_step; // 출력 순서 
	private int group_tab; // 종류 
	private int root; // 상위 댓글   삭제용
	private int depth; // 댓글 몇개? 삭제용
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getBoard_review_no() {
		return board_review_no;
	}
	public void setBoard_review_no(int board_review_no) {
		this.board_review_no = board_review_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
