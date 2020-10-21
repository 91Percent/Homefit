package com.sist.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import com.sist.controller.RequestMapping;

public class CoachModel {
	// 코치목록
	 @RequestMapping("coach/coachlist.do")
	   public String movie_box(HttpServletRequest request)
	   {
		 System.out.println("출력");
		// 두개의 데이터를 받는다 (페이지,카테고리번호)
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   String cateno=request.getParameter("cateno");
		   System.out.println("cateno 번호!"+cateno);
		   if(cateno==null)
			   cateno="71";
		   
		   
		   // Map 
		   // 현재 페이지 
		   int curpage=Integer.parseInt(page);
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   // Map에 저장 
		   Map map=new HashMap();
		   map.put("cateno", cateno);
		   map.put("start", start);
		   map.put("end", end);
		   // 데이터베이스 연결 
		   List<tutor_VO> list=CoachDAO.coachListData(map);
		   // 총페이지 
		   int totalpage=CoachDAO.coachTotalpages();
		   
		   // JSP에서 필요한 데이터를 보내기 시작 
		   // request에 값을 채운다 
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		// include 파일 지정
		   request.setAttribute("main_jsp", "../coach/coachlist.jsp");
		   return "../main/main.jsp";
	   }
	 @RequestMapping("coach/info.do")
	 public String coachDetailData(HttpServletRequest request)
	 {
		 String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   String cateno=request.getParameter("cateno");
		   if(cateno==null)
			   cateno="71";
		   // Map 
		   // 현재 페이지 
		   int curpage=Integer.parseInt(page);
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   
		   // Map에 저장 
		   Map map=new HashMap();
		   List<tutor_VO> list=CoachDAO.coachListData(map);
		   
		   map.put("cateno", cateno);
		   map.put("start", start);
		   map.put("end", end);
		   
		  
		   int totalpage=CoachDAO.coachTotalpages();
		   
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   return "../main/main.jsp";
	 }
	 
}
