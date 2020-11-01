package com.sist.vo;

public class RecipeVO {

	private String id; // 아이디
	private int cate_no; // 카테고리
	private int Recipe_no; // 번호
	private String poster; // 사진
	private String subject; // 제목
	private int grade; // 별점
	private String ingredients; // 재료
	private String step; // 단계
	private String step_poster; // 단계별 사진
	private String summary; // 한마디
	private String feces; // 인분
	private String timer; // 요리시간
	private String Difficulty; // 난이도
	private String dbday;

	public String getDbday() {
		return dbday;
	}

	public void setDbday(String dbday) {
		this.dbday = dbday;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public int getRecipe_no() {
		return Recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		Recipe_no = recipe_no;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getStep_poster() {
		return step_poster;
	}

	public void setStep_poster(String step_poster) {
		this.step_poster = step_poster;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFeces() {
		return feces;
	}

	public void setFeces(String feces) {
		this.feces = feces;
	}

	public String getTimer() {
		return timer;
	}

	public void setTimer(String timer) {
		this.timer = timer;
	}

	public String getDifficulty() {
		return Difficulty;
	}

	public void setDifficulty(String difficulty) {
		Difficulty = difficulty;
	}
}
