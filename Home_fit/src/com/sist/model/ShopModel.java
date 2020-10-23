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
	   
	   
	   // cnum => cate_no의 십의자리 숫자
	   int cnum=Integer.parseInt(cate_no);
	   int cate_no_num=400+cnum*10+1;
	   
	   
	   // Map 
	   // 현재 페이지 
	   int curpage=Integer.parseInt(page);
	   int rowSize=12;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   
	   System.out.println(cate_no_num);
	   
	   // Map에 저장 
	   Map map=new HashMap();
	   //map.put("cate_no", cate_no);
	   map.put("cate_no_num", cate_no_num);
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
	   //int totalpage=ShopDAO.shopTotalPage(Integer.parseInt(cate_no));
	   int totalpage=ShopDAO.shopTotalPage(cate_no_num);
	   
	   int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   // JSP에서 필요한 데이터를 보내기 시작 
	   // request에 값을 채운다
	   request.setAttribute("cate_no", cate_no);
	   request.setAttribute("cnum", cnum);
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