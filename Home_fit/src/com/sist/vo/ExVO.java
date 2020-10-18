package com.sist.vo;
/*
	 * CATE_NO      NOT NULL NUMBER         
	HOME_NO      NOT NULL NUMBER         
	HOME_LEVEL            VARCHAR2(300)  
	SUBJECT               VARCHAR2(500)  
	POSTER                VARCHAR2(500)  
	FOCUS                 VARCHAR2(300)  
	MUSCLE                VARCHAR2(500)  
	EQUIPMENT             VARCHAR2(500)  
	STEP_NO               VARCHAR2(200)  
	STEP_CONTENT          CLOB           
	STEP_IMAGE            CLOB           
	TIP                   VARCHAR2(1000) 
 */
public class ExVO {
	private int cate_no;
	private int home_no;
	private String home_lever;
	private String subject;
	private String poster;
	private String focus;
	private String muscle;
	private String equipment;
	private String step_no;
	private String step_content;
	private String step_image;
	private String tip;
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public int getHome_no() {
		return home_no;
	}
	public void setHome_no(int home_no) {
		this.home_no = home_no;
	}
	public String getHome_lever() {
		return home_lever;
	}
	public void setHome_lever(String home_lever) {
		this.home_lever = home_lever;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getFocus() {
		return focus;
	}
	public void setFocus(String focus) {
		this.focus = focus;
	}
	public String getMuscle() {
		return muscle;
	}
	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getStep_no() {
		return step_no;
	}
	public void setStep_no(String step_no) {
		this.step_no = step_no;
	}
	public String getStep_content() {
		return step_content;
	}
	public void setStep_content(String step_content) {
		this.step_content = step_content;
	}
	public String getStep_image() {
		return step_image;
	}
	public void setStep_image(String step_image) {
		this.step_image = step_image;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	
	
}
