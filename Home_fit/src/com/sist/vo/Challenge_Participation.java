package com.sist.vo;

import java.util.Date;

/*
 * CHALLENGE_NO NOT NULL NUMBER        
CHALLENGE_ID NOT NULL VARCHAR2(500) 
REGDATE               DATE    
 */

public class Challenge_Participation {
	
	private int challenge_no;
	private String challnege_id;
	private Date regdate;
	
	
	public int getChallenge_no() {
		return challenge_no;
	}
	public void setChallenge_no(int challenge_no) {
		this.challenge_no = challenge_no;
	}
	public String getChallnege_id() {
		return challnege_id;
	}
	public void setChallnege_id(String challnege_id) {
		this.challnege_id = challnege_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
