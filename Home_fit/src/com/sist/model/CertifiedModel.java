package com.sist.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import com.sist.controller.RequestMapping;

public class CertifiedModel {
	@RequestMapping("challenge/Challenge.do")
	public String challenge(HttpServletRequest request)
	{
	// 사용자의 요청 값을 받는다
	// String page(X) ==> page는 내장 객체 ==> (page=this)
	String strPage=request.getParameter("page");
	// Default Page => page값를 지정
	if(strPage==null) // page번호가 지정이 없는 경우 (맨처음 실행)
	{
	   strPage="1";
	}
	
	// 현재 페이지 지정 
	int curpage=Integer.parseInt(strPage);
	
	// 현재 페이지에 해당되는 데이터를 DAO요청 
	Map map=new HashMap(); //map => 저장 공간 => key,실제값
	int rowSize=12;
	int start=(rowSize*curpage)-(rowSize-1); // 12-11 ==> 1 (오라클 => rownum : 시작번호가 1)
	int end=rowSize*curpage; // curpage=1 => 1~12
	// WHERE num BETWEEN #{start} AND #{end}
	
	// map에 저장 
	map.put("start",start);
	map.put("end",end);
	 
	List<ChallengeVO> list =  Challenge_CertifiedDAO.ChallengeListData(map);
	System.out.println(""+list.size());
		
	request.setAttribute("list", list);
	request.setAttribute("start", start);
	request.setAttribute("end", end);
	
	request.setAttribute("main_jsp","../challenge/Challenge.jsp");
	return "../main/main.jsp";
	} 
	
	
	@RequestMapping("challenge/Certified_detail.do")
	public String Certified_detail(HttpServletRequest request)
	{
		
		String no = request.getParameter("no");
		
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(no));
		List<Challenge_CertifiedVO> list= Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(no));
  
		
		request.setAttribute("vo", vo);
		request.setAttribute("Certifiedvo", list);
		request.setAttribute("main_jsp","../challenge/Certified_detail.jsp");
		return "../main/main.jsp";
	}
}
