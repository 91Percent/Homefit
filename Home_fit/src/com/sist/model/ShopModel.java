package com.sist.model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 김한비
 *
 */

public class ShopModel {
	
	//샵 메인
	
	@RequestMapping("shop/shop.do")
	public String shopListData(HttpServletRequest request){
   // 두개의 데이터를 받는다 (페이지,카테고리번호)
   String page=request.getParameter("page");
   if(page==null)
	   page="1";
   String cate_no=request.getParameter("cate_no"); 
	  if(cate_no==null) {
		  cate_no="1"; 
		  } 
	  int cnum=Integer.parseInt(cate_no);
	  
	  if(cnum>400) { 
		  cnum=(int)Math.floor((cnum%400)/10); 
		  }
	  cate_no=String.valueOf(cnum);
	  System.out.println("(shop)cnum: "+cnum); // cnum => cate_no의 십의자리 숫자
	  
	  int cate_no_num=400+cnum*10;	  	  
	  if(cate_no_num>4000) { 
		  int c=(int)Math.floor(((cate_no_num-400)%cnum)/10);
		  cate_no_num=400+c*10; 
	  } 
	  
	  int sub_cate_no_num=400+cnum*10+1;
	  if(sub_cate_no_num>4000) { 
		  int c=(int)Math.floor(((sub_cate_no_num-401)%cnum)/10);
		  sub_cate_no_num=400+c*10+1; 
	  } 
	  System.out.println("(shop)cate_no: "+cate_no);
	  System.out.println("(shop)cate_no_num: "+cate_no_num);
	  System.out.println("(shop)sub_cate_no_num: "+sub_cate_no_num);
   
	   // Map 
	   // 현재 페이지 
	   int curpage=Integer.parseInt(page);
	   int rowSize=12;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   
	   
	   // Map에 저장 
	   Map map=new HashMap();
	   //map.put("cate_no", cate_no);
	   map.put("cate_no_num", cate_no_num);
	   map.put("start", start);
	   map.put("end", end);
	   // 데이터베이스 연결 
	   //List<ShopVO> list=ShopDAO.shopListData(map);
	   List<CategoryVO> clist=ShopDAO.shopCategoryData();
		/*
		 * for(ShopVO vo:list) { String str=vo.getTitle(); if(str.length()>10) {
		 * str=str.substring(0,10); str+="..."; } vo.setTitle(str); }
		 */
	   // 총페이지 
	   //int totalpage=ShopDAO.shopTotalPage(Integer.parseInt(cate_no));
	   int totalpage=ShopDAO.shopTotalPage(sub_cate_no_num);
	   
	   int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   // JSP에서 필요한 데이터를 보내기 시작 
	   // request에 값을 채운다
	   request.setAttribute("cate_no", cate_no);
	   request.setAttribute("cnum", cnum);
	   //request.setAttribute("list", list);
	   request.setAttribute("clist", clist);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("BLOCK", BLOCK);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   // include 파일 지정
	   request.setAttribute("main_jsp", "../shop/shop.jsp");
	   return "../main/main.jsp";
}
		
	
//	@RequestMapping("shop/shop_radio.do")
//	public String shopRadioData(HttpServletRequest request){
//		
//		  String cate_no=request.getParameter("cate_no"); 
//		  if(cate_no==null) {
//			  cate_no="1"; 
//			  } 
//		  int cnum=Integer.parseInt(cate_no);
//		  
//		  if(cnum>400) { 
//			  cnum=(int)Math.floor((cnum%400)/10); 
//			  }
//		  System.out.println("cnum: "+cnum); // cnum => cate_no의 십의자리 숫자
//		  
//		  int cate_no_num=400+cnum*10;
//		  
//		  if(cate_no_num>4000) { 
//			  int c=(int)Math.floor(((cate_no_num-400)%cnum)/10);
//			  cate_no_num=400+c*10; 
//		  } 
//		  System.out.println("cate_no: "+cate_no);
//		  System.out.println("cate_no_num: "+cate_no_num);
//		 
//		List<CategoryVO> list=ShopDAO.shopCategoryData();
//		
//		
//		  request.setAttribute("cate_no", cate_no); 
//		  request.setAttribute("cate_no_num",cate_no_num);
//		 
//		request.setAttribute("list", list);
//		
//		return "../shop/shop_radio.jsp";
//	}
	
//	  @RequestMapping("shop/shop_list.do") 
//	  public String shopListData(HttpServletRequest request){ 
//		  // 두개의 데이터를 받는다 (페이지,카테고리번호) 
//		  String page=request.getParameter("page"); 
//	  if(page==null) page="1"; 
//	  String cate_no=request.getParameter("cate_no"); 
//	  if(cate_no==null) { 
//		  cate_no="1"; 
//		  }
//	  int cnum=Integer.parseInt(cate_no);
//	  
//	  if(cnum>400) { 
//		  cnum=(int)Math.floor((cnum%400)/10); 
//		  }
//	  System.out.println("cnum: "+cnum); // cnum => cate_no의 십의자리 숫자
//	  
//	  int cate_no_num=400+cnum*10+1;
//	  
//	  if(cate_no_num>4000) { 
//		  int c=(int)Math.floor(((cate_no_num-401)%cnum)/10);
//	  cate_no_num=400+c*10+1; 
//	  }
//	  
//	  // Map // 현재 페이지 
//	  int curpage=Integer.parseInt(page); 
//	  int rowSize=12; 
//	  int start=(rowSize*curpage)-(rowSize-1); 
//	  int end=rowSize*curpage;
//	  
//	  System.out.println(cate_no_num);
//	  
//	  // Map에 저장 Map map=new HashMap(); //
//	  map.put("cate_no", cate_no);
//	  map.put("cate_no_num", cate_no_num); 
//	  map.put("start", start); 
//	  map.put("end",end); // 데이터베이스 연결 
//	  List<ShopVO> list=ShopDAO.shopListData(map); 
//	  for(ShopVO vo:list) { 
//		  String str=vo.getTitle(); 
//		  if(str.length()>10) {
//	  str=str.substring(0,10); 
//	  str+="..."; 
//	  } 
//		  vo.setTitle(str); } // 총페이지 //
//	  int totalpage=ShopDAO.shopTotalPage(Integer.parseInt(cate_no)); 
//	  int totalpage=ShopDAO.shopTotalPage(cate_no_num);
//	  
//	  int BLOCK=5; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
//	  endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; if(endPage>totalpage)
//	  endPage=totalpage;
//	  
//	  // JSP에서 필요한 데이터를 보내기 시작 // request에 값을 채운다 request.setAttribute("cate_no",
//	  cate_no); request.setAttribute("cnum", cnum); request.setAttribute("list",
//	  list); request.setAttribute("curpage", curpage);
//	  request.setAttribute("totalpage", totalpage); request.setAttribute("BLOCK",
//	  BLOCK); request.setAttribute("startPage", startPage);
//	  request.setAttribute("endPage", endPage); // include 파일 지정
//	  //request.setAttribute("main_jsp", "../shop/shop_list.jsp"); return
//	  "../shop/shop_list.jsp"; }
	 
	//디테일
	
	  @RequestMapping("shop/shop_detail.do") 
	  public String shopDetailData(HttpServletRequest request) {
	  
	  String shop_no=request.getParameter("shop_no"); 
	  ShopVO vo=ShopDAO.shopDetailData(Integer.parseInt(shop_no));  
	  request.setAttribute("vo", vo);	
	  
	  request.setAttribute("main_jsp", "../shop/shop_detail.jsp"); 
	  return "../main/main.jsp"; 
	  }
	  
	  
	  @RequestMapping("shop/shop_detail_ok.do")
	  public String shop_detail_ok(HttpServletRequest request){
		  String shop_no=request.getParameter("shop_no"); 
		  ShopVO vo=ShopDAO.shopDetailData(Integer.parseInt(shop_no));  
		  request.setAttribute("vo", vo);	
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  WishlistVO wvo=new WishlistVO();
		  wvo.setId(id);
		  wvo.setShop_no(Integer.parseInt(shop_no));
		  ShopDAO.wishlistInsert(wvo);
		  
		  System.out.println("(shop_detail_ok)shop_no:"+shop_no);
		  System.out.println("(shop_detail_ok)id:"+id);	  
		  
		  
		  return "../shop/shop_detail_ok.jsp";
	  }
	  
	 
	
	
	@RequestMapping("shop/shop_list.do")
	public String shop_listListData(HttpServletRequest request){
		String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   System.out.println("shop_list page:"+page);
		String cate_no=request.getParameter("cate_no"); 
		  if(cate_no==null) 
			  cate_no="1"; 
		   System.out.println("shop_list cate_no:"+cate_no);
		  int cnum=Integer.parseInt(cate_no);
		  
		  if(cnum>400) { 
			  cnum=(int)Math.floor((cnum%400)/10); 
			  }
		  cate_no=String.valueOf(cnum);
		  System.out.println("(shop_list)cnum: "+cnum); // cnum => cate_no의 십의자리 숫자
		  
		  int cate_no_num=400+cnum*10;	  	  
		  if(cate_no_num>4000) { 
			  int c=(int)Math.floor(((cate_no_num-400)%cnum)/10);
			  cate_no_num=400+c*10; 
		  } 
		  System.out.println("(shop_list)cate_no_num: "+cate_no_num);
		  
		  int sub_cate_no_num=400+cnum*10+1;
		  if(sub_cate_no_num>4000) { 
			  int c=(int)Math.floor(((sub_cate_no_num-401)%cnum)/10);
			  sub_cate_no_num=400+c*10+1; 
		  } 
		  System.out.println("(shop_list)sub_cate_no_num: "+sub_cate_no_num);
		// Map 
		   // 현재 페이지 
		   int curpage=Integer.parseInt(page);
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   Map map=new HashMap();
		   //map.put("cate_no", cate_no);
		   map.put("sub_cate_no_num", sub_cate_no_num);
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
			int totalpage=ShopDAO.shopTotalPage(sub_cate_no_num);
		   
		   int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   // JSP에서 필요한 데이터를 보내기 시작 
		   // request에 값을 채운다
		   request.setAttribute("cate_no", cate_no);
		   request.setAttribute("cate_no_num", cate_no_num);
		   request.setAttribute("sub_cate_no_num", sub_cate_no_num);
		   request.setAttribute("cnum", cnum);
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("BLOCK", BLOCK);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
	
		   return "../shop/shop_list.jsp";
	}
	
	
	
	
	// 장바구니
	
	@RequestMapping("shop/wishlist.do")
	public String shop_main(HttpServletRequest request) {
		System.out.println("wishlist.do 호출");
		
		request.setAttribute("main_jsp","../shop/wishlist.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("shop/wishlist_list.do")
	public String shop_wishlist_list(HttpServletRequest request) {
		System.out.println("wishlist_list 호출");
//		String shop_no=request.getParameter("shop_no"); 
//		System.out.println("(wishlist)shop_no"+shop_no);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println("(wishlist_list)id:"+id);
		List<WishlistVO> list=ShopDAO.wishlistData(id);
		System.out.println("list사이즈"+list.size());
		request.setAttribute("list",list);
		return "../shop/wishlist_list.jsp";
	}
	
	@RequestMapping("shop/wishlist_cancel.do")
	public String shop_wishlist_cancel(HttpServletRequest request)
	{
		System.out.println("wishlist_cancel");
		String wishlist_no=request.getParameter("wishlist_no");
		ShopDAO.wishlistDelete(Integer.parseInt(wishlist_no));
		return "redirect:../shop/wishlist_list.do";
	}
	
//	@RequestMapping("shop/wishlist_ok.do")
//	  public String wishlist_check_ok(HttpServletRequest request)
//	  {
//		  // 예약번호 
//		  String wishlist_no=request.getParameter("wishlist_no");
//		  // UPDATE
//		  ShopDAO.wishlistOk(Integer.parseInt(wishlist_no));
//		  return "redirect:../shop/wishlist_list.do";// 원상복귀
//	  }
//	
//	@RequestMapping("shop/wishlist_all_ok.do")
//	  public String wishlist_all_ok(HttpServletRequest request)
//	  {
//		  // 데이터 받기 
//		  String[] nos=request.getParameterValues("cb");
//		  for(String n:nos)
//		  {
//			  ShopDAO.wishlistOk(Integer.parseInt(n));
//		  }
//		  return "redirect:../shop/wishlist_list.do";
//	  }
}





