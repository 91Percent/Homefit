package com.sist.vo;

import java.util.Date;

/*
-------------- -------- ------------- 
CHALLENGE_NO    NOT NULL NUMBER        
POSTER                   VARCHAR2(500) 
CERTIFIED_DATE           DATE          
CERTIFIED_CHECK          VARCHAR2(500) 
CERTIFIED_NO    NOT NULL NUMBER    
 */ 
/**
 * @author 지승구
 *
 */
public class Challenge_CertifiedVO {
	private int certified_no;
	private int challenge_no;
	private String poster;
	private Date Certified_date;
	private String db_Certified_date;
	private String Certified_check;
	private String challenge_id;
	public int getChallenge_no() {
		return challenge_no;
	}
	public void setChallenge_no(int challenge_no) {
		this.challenge_no = challenge_no;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public Date getCertified_date() {
		return Certified_date;
	}
	public void setCertified_date(Date certified_date) {
		Certified_date = certified_date;
	}
	public String getChallenge_id() {
		return challenge_id;
	}
	public void setChallenge_id(String challenge_id) {
		this.challenge_id = challenge_id;
	}
	public int getCertified_no() {
		return certified_no;
	}
	public void setCertified_no(int certified_no) {
		this.certified_no = certified_no;
	}
	public String getCertified_check() {
		return Certified_check;
	}
	public void setCertified_check(String certified_check) {
		Certified_check = certified_check;
	}
	public String getDb_Certified_date() {
		return db_Certified_date;
	}
	public void setDb_Certified_date(String db_Certified_date) {
		this.db_Certified_date = db_Certified_date;
	}
	
	
}
