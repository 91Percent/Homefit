package com.sist.vo;

import java.util.Date;

public class CoachQnaVO {
	private int coach_no;
	private int coach_qna_no;
	private String id;
	private String subject;
	private String content;
	private int hit;
	private String form;
	
	private String name;
	
	private Date regdate;
	private String dbday;

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
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
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
	public int getCoach_no() {
		return coach_no;
	}
	public void setCoach_no(int coach_no) {
		this.coach_no = coach_no;
	}
	public int getCoach_qna_no() {
		return coach_qna_no;
	}
	public void setCoach_qna_no(int coach_qna_no) {
		this.coach_qna_no = coach_qna_no;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
