package com.sist.model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import com.sist.controller.RequestMapping;

public class CoachModel {
	
	//리퀘스트 매핑으로 아무거나!
	// setAttribute 값은  jsp 
	// return 값은 main.main.jsp
	@RequestMapping("coach/coachlist.do")
	public String coach_list(HttpServletRequest request)
	{
		 request.setAttribute("main_jsp", "../coach/coachlist.jsp");
		 return "../main/main.jsp";
	}
	
	// 코치목록
	 @RequestMapping("coach/listlist.do")
	   public String Clist(HttpServletRequest request)
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
		   
		   int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
		   {
			   endPage = totalpage;
		   }
		   
		   
		   // JSP에서 필요한 데이터를 보내기 시작 
		   // request에 값을 채운다 
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("BLOCK", BLOCK);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   
		// include 파일 지정
		   return "../coach/listlist.jsp";    //넘겨줄때 listlist 로 이동해야함 .
	   }
	 @RequestMapping("coach/info.do")
	 public String coachDetailData(HttpServletRequest request)
	 {
		 
		 String coach_no=request.getParameter("coach_no");
		 
		 
		 //코치 디테일 데이터 가져오는 부분
		 tutor_VO vo=CoachDAO.coachDeatilData(Integer.parseInt(coach_no));
		 //=====================
		 
		 
		 // 코치 스케쥴 데이터 가져오는 부분 
		 ScheduleVO Schevo= new ScheduleVO();
		 List<ScheduleVO> list = new ArrayList<ScheduleVO>();
		 Schevo.setCoach_no(Integer.parseInt(coach_no));
		 list = CoachDAO.scheduleData(Schevo);		 
		 System.out.println("사이즈 "+list.size());
		 //=================================
		 
		 
		 
		 
		 //1.매퍼 만들고 ( coach_no 에 해당하는 스케쥴 정보)
		 //2.연결하는 부분 dao에서 데이터 받고
		 //3. 여기서 호출 하면 !
		 request.setAttribute("list", list);
		 request.setAttribute("vo", vo);
		 request.setAttribute("main_jsp", "../coach/info.jsp");
		 return "../main/main.jsp";
	 }
	
	 
}
