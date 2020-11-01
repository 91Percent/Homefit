package com.sist.vo;

import java.util.Date;

public class CoachQnaVO {
	private int coach_no;
	private int coach_qna_no;
	private String writer;
	private String subject;
	private String content;
	private int hit;
	private String pwd;
	private Date date;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
