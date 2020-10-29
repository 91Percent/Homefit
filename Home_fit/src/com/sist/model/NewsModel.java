package com.sist.model;

import java.util.HashMap;
import java.util.*;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.NewsDAO;
import com.sist.vo.NewsVO;

public class NewsModel {
	@RequestMapping("news/news.do")
	public String news(HttpServletRequest request)
	{
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String no=request.getParameter("no");
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		map.put("no", no);
		map.put("start", start);
		map.put("end", end);
		List<NewsVO> nList=NewsDAO.newsListData(map);
		
		int totalpage=NewsDAO.newsTotalPage();
		String str="";
		for(NewsVO vo:nList)
		{
			str=vo.getContent();
			str = str.substring(0,250)+"...";
			vo.setContent(str);
		}
		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage) {
			endPage = totalpage;
		}
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("nList", nList);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp", "../news/news.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("news/detail.do")
	public String news_detail(HttpServletRequest request)
	{
		String no=request.getParameter("no");
		System.out.println(no);
		NewsVO vo=NewsDAO.newsDetailData(Integer.parseInt(no));
		String nd="";
		nd=vo.getNews_date();
		nd=nd.substring(0,10);
		vo.setNews_date(nd);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../news/detail.jsp");
		return "../main/main.jsp";
	}
}
