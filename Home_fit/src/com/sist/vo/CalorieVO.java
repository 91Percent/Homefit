package com.sist.vo;

import java.util.*;

public class CalorieVO {
   private String cno; //카테고리
   private String brand; // 브랜드별
   private String type; //유형별
   private String name;//이름
   private String kcal;//칼로리
   private String eye;//목측량
   private String gram;//분량(g)
   private int calorie_no;
   
   
   public int getCalorie_no() {
	return calorie_no;
}
public void setCalorie_no(int calorie_no) {
	this.calorie_no = calorie_no;
}


public String getCno() {
	return cno;
}
public void setCno(String cno) {
	this.cno = cno;
}
public String getBrand() {
      return brand;
   }
   public void setBrand(String brand) {
      this.brand = brand;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }

   public String getEye() {
      return eye;
   }
   public void setEye(String eye) {
      this.eye = eye;
   }
public String getKcal() {
	return kcal;
}
public void setKcal(String kcal) {
	this.kcal = kcal;
}
public String getGram() {
	return gram;
}
public void setGram(String gram) {
	this.gram = gram;
}



   
   

}
