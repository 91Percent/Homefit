
package com.sist.vo;

import java.sql.*;;
/*
 * 
------------ -------- ------------- 
CHALLENGE_NO NOT NULL NUMBER        
CATE         NOT NULL VARCHAR2(500) 
START_DAY    NOT NULL DATE          
TITLE        NOT NULL VARCHAR2(500) 
LIMIT        NOT NULL NUMBER        
POSTER                VARCHAR2(500) 
CONTENT               VARCHAR2(500) 
ID_LEADER    NOT NULL VARCHAR2(300) 
 */
public class ChallengeVO {
	private String cate;
	private int Challenge_no;
	private Date start_day;
	private String db_start_day;
	private String title;
	private int limit;
	private String poster;
	private String content;
	private String id_leader;
	private Date end_day;
	private String db_end_day;
	private Date regdate;
	
	
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public int getChallenge_no() {
		return Challenge_no;
	}
	public void setChallenge_no(int challenge_no) {
		Challenge_no = challenge_no;
	}
	public Date getStart_day() {
		return start_day;
	}
	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}
	public String getDb_start_day() {
		return db_start_day;
	}
	public void setDb_start_day(String db_start_day) {
		this.db_start_day = db_start_day;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId_leader() {
		return id_leader;
	}
	public void setId_leader(String id_leader) {
		this.id_leader = id_leader;
	}
	public Date getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDb_end_day() {
		return db_end_day;
	}
	public void setDb_end_day(String db_end_day) {
		this.db_end_day = db_end_day;
	}
	
	
	
}