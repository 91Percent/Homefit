package com.sist.vo;

public class Coach_ReserveVO {
	private int coach_no;
	private int schedule_no;
	private String id;
	private int reserve_no;
	private ScheduleVO sdv=new ScheduleVO();
	private tutor_VO tvo=new tutor_VO();
	
	
	public tutor_VO getTvo() {
		return tvo;
	}
	public void setTvo(tutor_VO tvo) {
		this.tvo = tvo;
	}
	public ScheduleVO getSdv() {
		return sdv;
	}
	public void setSdv(ScheduleVO sdv) {
		this.sdv = sdv;
	}
	public int getCoach_no() {
		return coach_no;
	}
	public void setCoach_no(int coach_no) {
		this.coach_no = coach_no;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}
	
}
