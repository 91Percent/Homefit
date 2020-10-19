package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.ExDAO;
import com.sist.vo.ExVO;

public class ExModel {
	@RequestMapping("ex/weight.do")
	public String ex_weight(HttpServletRequest request)
	{
		String page = request.getParameter("page");
	       if(page==null)
	          page="1";
	       String cate_no=request.getParameter("cate_no");
			if(cate_no==null)
				cate_no="1";
	       
	       int curpage=Integer.parseInt(page);
	       Map map = new HashMap();
	       int rowSize=12;
	       int start = (curpage*rowSize)-(rowSize-1);
	       int end = curpage*rowSize;
	         
	       map.put("cate_no",cate_no);
	       map.put("start",start);
	       map.put("end",end);
	       
	       List<ExVO> list = ExDAO.exListData(map);
    
	       int totalpage=ExDAO.exTotalPage(Integer.parseInt(cate_no));
	       int BLOCK=5;
	   
	       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	       
	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }
	       
	       request.setAttribute("list",list);
	       request.setAttribute("curpage", curpage);
	       request.setAttribute("totalpage", totalpage);
	       request.setAttribute("BLOCK", BLOCK);
	       request.setAttribute("startPage", startPage);
	       request.setAttribute("endPage",endPage);
	       request.setAttribute("main_jsp","../ex/ex_weight.jsp");
	        return "../main/main.jsp";
	}
	@RequestMapping("ex/yoga.do")
	public String ex_yoga(HttpServletRequest request)
	{
		String page = request.getParameter("page");
	       if(page==null)
	          page="1";
	       String cate_no=request.getParameter("cate_no");
			if(cate_no==null)
				cate_no="2";
	       
	       int curpage=Integer.parseInt(page);
	       Map map = new HashMap();
	       int rowSize=12;
	       int start = (curpage*rowSize)-(rowSize-1);
	       int end = curpage*rowSize;
	         
	       map.put("cate_no",cate_no);
	       map.put("start",start);
	       map.put("end",end);
	       
	       List<ExVO> list = ExDAO.exListData(map);
    
	       int totalpage=ExDAO.exTotalPage(Integer.parseInt(cate_no));
	       int BLOCK=5;
	   
	       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	       
	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }
	       
	       request.setAttribute("list",list);
	       request.setAttribute("curpage", curpage);
	       request.setAttribute("totalpage", totalpage);
	       request.setAttribute("BLOCK", BLOCK);
	       request.setAttribute("startPage", startPage);
	       request.setAttribute("endPage",endPage);
	       request.setAttribute("main_jsp","../ex/ex_yoga.jsp");
	        return "../main/main.jsp";
	}
	@RequestMapping("ex/pila.do")
	public String ex_pila(HttpServletRequest request)
	{
		String page = request.getParameter("page");
	       if(page==null)
	          page="1";
	       String cate_no=request.getParameter("cate_no");
			if(cate_no==null)
				cate_no="3";
	       
	       int curpage=Integer.parseInt(page);
	       Map map = new HashMap();
	       int rowSize=12;
	       int start = (curpage*rowSize)-(rowSize-1);
	       int end = curpage*rowSize;
	         
	       map.put("cate_no",cate_no);
	       map.put("start",start);
	       map.put("end",end);
	       
	       List<ExVO> list = ExDAO.exListData(map);
    
	       int totalpage=ExDAO.exTotalPage(Integer.parseInt(cate_no));
	       int BLOCK=5;
	   
	       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	       
	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }
	       
	       request.setAttribute("list",list);
	       request.setAttribute("curpage", curpage);
	       request.setAttribute("totalpage", totalpage);
	       request.setAttribute("BLOCK", BLOCK);
	       request.setAttribute("startPage", startPage);
	       request.setAttribute("endPage",endPage);
	       request.setAttribute("main_jsp","../ex/ex_pila.jsp");
	        return "../main/main.jsp";
	}
	@RequestMapping("ex/total.do")
	public String ex_total(HttpServletRequest request)
	{
		String page = request.getParameter("page");
	       if(page==null)
	          page="1";
	       
	       
	       int curpage=Integer.parseInt(page);
	       Map map = new HashMap();
	       int rowSize=12;
	       int start = (curpage*rowSize)-(rowSize-1);
	       int end = curpage*rowSize;
	         
	       map.put("start",start);
	       map.put("end",end);
	       
	       List<ExVO> list = ExDAO.exTotalData(map);
	       int totalpage=ExDAO.exTotalPage2();	       
	       int BLOCK=5;
	       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	       
	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }
	       
	       request.setAttribute("list",list);
	       request.setAttribute("curpage", curpage);
	       request.setAttribute("totalpage", totalpage);
	       request.setAttribute("BLOCK", BLOCK);
	       request.setAttribute("startPage", startPage);
	       request.setAttribute("endPage",endPage);
	       request.setAttribute("main_jsp","../ex/total.jsp");
	        return "../main/main.jsp";
	}
	@RequestMapping("ex/detail.do")
	public String ex_detail(HttpServletRequest request)
	{
		String home_no=request.getParameter("home_no");
		System.out.println(home_no);
		String page=request.getParameter("page");
		String cate_no=request.getParameter("cate_no");
		ExVO vo=ExDAO.exDetailData(Integer.parseInt(home_no));
		if(page==null)
			page="1";
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../ex/ex_detail.jsp");
		return "../main/main.jsp";
	}
}
