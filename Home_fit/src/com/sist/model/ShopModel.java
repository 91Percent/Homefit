package com.sist.model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

/**
 * @author 김한비
 *
 */

public class ShopModel {
	/*
}
	@RequestMapping("shop/shop.do")
	public String shopListData(HttpServletRequest request) {
		// request => 사용자의 요청 정보 , 필요한 데이터를 첨부해서 사용 (setAttribute()) ==> JSP로 전송 
    	// 사용자가 요청한 페이지를 받는다 
    	String page=request.getParameter("page");
    	if(page==null)
    		page="1";
    	
    	// 데이터 읽기 
    	int curpage=Integer.parseInt(page); // 현재 보고 있는 페이지
    	Map map=new HashMap();
    	int rowSize=20;
    	int start=(rowSize*curpage)-(rowSize-1);
    	int end=rowSize*curpage;
    	
    	//map에 묵어서 전송 ==> mybatis가 읽어서 처리
    	map.put("start",start);
    	map.put("end", end);
    	List<ShopVO> list=ShopDAO.shopListData(map);
    	for(ShopVO vo:list)
    	{
    		String str=vo.getTitle();
    		if(str.length()>10)
    		{
    			str=str.substring(0,10);
    			str+="...";
    		}
    		vo.setTitle(str);
    	}
    	// 총페이지 
    	int totalpage=ShopDAO.shopTotalPage();
    	
    	// JSP로 받은 결과값을 전송 
    	request.setAttribute("list", list);
    	request.setAttribute("curpage", curpage);
    	request.setAttribute("totalpage", totalpage);
    	
    	request.setAttribute("main_jsp", "../shop/shop.jsp");
    	return "../main/main.jsp";
	}
	*/
		@RequestMapping("shop/shop.do")
		public String shopListData(HttpServletRequest request){
	   // 두개의 데이터를 받는다 (페이지,카테고리번호)
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   String cate_no=request.getParameter("cate_no");
	   
	   if(cate_no==null) {
		   cate_no="411";
	   }
	   /*
	   else if(Integer.parseInt(cate_no)/10==1) {
		   cate_no="1";
	   }else if(Integer.parseInt(cate_no)/10==2) {
		   cate_no="1";
	   }
	   */
	   // Map 
	   // 현재 페이지 
	   int curpage=Integer.parseInt(page);
	   int rowSize=12;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   
	   // Map에 저장 
	   Map map=new HashMap();
	   map.put("cate_no", cate_no);
	   map.put("start", start);
	   map.put("end", end);
	   // 데이터베이스 연결 
	   List<ShopVO> list=ShopDAO.shopListData(map);
	   for(ShopVO vo:list)
	   	{
	   		String str=vo.getTitle();
	   		if(str.length()>10)
	   		{
	   			str=str.substring(0,10);
	   			str+="...";
	   		}
	   		vo.setTitle(str);
	   	}
	   // 총페이지 
	   int totalpage=ShopDAO.shopTotalPage(Integer.parseInt(cate_no));
	   
	   int BLOCK=totalpage;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   // JSP에서 필요한 데이터를 보내기 시작 
	   // request에 값을 채운다 
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("BLOCK", BLOCK);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   // include 파일 지정
	   request.setAttribute("main_jsp", "../shop/shop.jsp");
	   return "../main/main.jsp";
   }
	
	@RequestMapping("shop/shop_detail.do")
	public String shopDetailData(HttpServletRequest request) {
		//String page=request.getParameter("page");
		//String cate_no=request.getParameter("cate_no");
		String shop_no=request.getParameter("shop_no");
		ShopVO vo=ShopDAO.shopDetailData(Integer.parseInt(shop_no));
		
    	request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../shop/shop_detail.jsp");
		return "../main/main.jsp";
	}
	
}