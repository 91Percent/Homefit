package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ExDAO;
import com.sist.vo.ExVO;
import com.sist.vo.FavoritesVO;

public class ExModel {
//	@RequestMapping("ex/weight.do")
//	public String ex_weight(HttpServletRequest request) {
//		String page = request.getParameter("page");
//		if (page == null)
//			page = "1";
//		String cate_no = request.getParameter("cate_no");
//		System.out.println("첫번째");
//		System.out.println(cate_no);
//		if (cate_no == null)
//			cate_no = "1";
//
//		int curpage = Integer.parseInt(page);
//		Map map = new HashMap();
//		int rowSize = 12;
//		int start = (curpage * rowSize) - (rowSize - 1);
//		int end = curpage * rowSize;
//
//		map.put("cate_no", cate_no);
//		map.put("start", start);
//		map.put("end", end);
//
//		List<ExVO> list = ExDAO.exListData(map);
//
//		int totalpage = ExDAO.exTotalPage(Integer.parseInt(cate_no));
//		int BLOCK = 5;
//
//		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
//		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
//
//		if (endPage > totalpage) {
//			endPage = totalpage;
//		}
//
//		request.setAttribute("list", list);
//		request.setAttribute("curpage", curpage);
//		request.setAttribute("totalpage", totalpage);
//		request.setAttribute("BLOCK", BLOCK);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("main_jsp", "../ex/ex_weight.jsp");
//		return "../main/main.jsp";
//	}
//
//	@RequestMapping("ex/yoga.do")
//	public String ex_yoga(HttpServletRequest request) {
//		String page = request.getParameter("page");
//		if (page == null)
//			page = "1";
//		String cate_no = request.getParameter("cate_no");
//		if (cate_no == null)
//			cate_no = "2";
//
//		int curpage = Integer.parseInt(page);
//		Map map = new HashMap();
//		int rowSize = 12;
//		int start = (curpage * rowSize) - (rowSize - 1);
//		int end = curpage * rowSize;
//
//		map.put("cate_no", cate_no);
//		map.put("start", start);
//		map.put("end", end);
//
//		List<ExVO> list = ExDAO.exListData(map);
//
//		int totalpage = ExDAO.exTotalPage(Integer.parseInt(cate_no));
//		int BLOCK = 5;
//
//		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
//		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
//
//		if (endPage > totalpage) {
//			endPage = totalpage;
//		}
//
//		request.setAttribute("list", list);
//		request.setAttribute("curpage", curpage);
//		request.setAttribute("totalpage", totalpage);
//		request.setAttribute("BLOCK", BLOCK);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("main_jsp", "../ex/ex_yoga.jsp");
//		return "../main/main.jsp";
//	}
//
//	@RequestMapping("ex/pila.do")
//	public String ex_pila(HttpServletRequest request) {
//		String page = request.getParameter("page");
//		if (page == null)
//			page = "1";
//		String cate_no = request.getParameter("cate_no");
//		if (cate_no == null)
//			cate_no = "3";
//
//		int curpage = Integer.parseInt(page);
//		Map map = new HashMap();
//		int rowSize = 12;
//		int start = (curpage * rowSize) - (rowSize - 1);
//		int end = curpage * rowSize;
//
//		map.put("cate_no", cate_no);
//		map.put("start", start);
//		map.put("end", end);
//
//		List<ExVO> list = ExDAO.exListData(map);
//
//		int totalpage = ExDAO.exTotalPage(Integer.parseInt(cate_no));
//		int BLOCK = 5;
//
//		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
//		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
//
//		if (endPage > totalpage) {
//			endPage = totalpage;
//		}
//
//		request.setAttribute("list", list);
//		request.setAttribute("curpage", curpage);
//		request.setAttribute("totalpage", totalpage);
//		request.setAttribute("BLOCK", BLOCK);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("main_jsp", "../ex/ex_pila.jsp");
//		return "../main/main.jsp";
//	}

	@RequestMapping("ex/total.do")
	public String ex_total(HttpServletRequest request) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;

		map.put("start", start);
		map.put("end", end);

		List<ExVO> list = ExDAO.exTotalData(map);
		int totalpage = ExDAO.exTotalPage2();
		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage) {
			endPage = totalpage;
		}

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../ex/total.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("ex/ex_detail.do")
	public String ex_detail(HttpServletRequest request) {
		String home_no = request.getParameter("home_no");
		System.out.println(home_no);
		String page = request.getParameter("page");
		String cate_no = request.getParameter("cate_no");
		ExVO vo = ExDAO.exDetailData(Integer.parseInt(home_no));
		if (page == null)
			page = "1";
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		FavoritesVO fvo=new FavoritesVO();
		fvo.setId(id);
		System.out.println(id);
		fvo.setHome_no(Integer.parseInt(home_no));
		System.out.println("home_no="+home_no);
		
		int count=ExDAO.favCount(fvo);
		System.out.println("count"+count);
		
		request.setAttribute("main_jsp", "../ex/ex_detail.jsp");
		request.setAttribute("count", count);
		request.setAttribute("vo", vo);
		return "../main/main.jsp";
	}

	@RequestMapping("ex/content.do")
	public String test(HttpServletRequest request) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String cate_no = request.getParameter("cate_no");
		if (cate_no == null)
			cate_no = "1";
		System.out.println("page" + page);
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;

		map.put("cate_no", cate_no);
		map.put("start", start);
		map.put("end", end);

		List<ExVO> list = ExDAO.exListData(map);

		int totalpage = ExDAO.exTotalPage(Integer.parseInt(cate_no));
		int BLOCK = 5;

		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage) {
			endPage = totalpage;
		}
//	       System.out.println("start"+startPage);
//	       System.out.println("list.size"+list.size());
//	       System.out.println("ex/test.jsp 보내는 과정 실행입니듕21");
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../ex/content.jsp";
	}

	@RequestMapping("ex/level.do")
	public String ex_level(HttpServletRequest request) {
//		String home_level = request.getParameter("level");
//		System.out.println(home_level);
//		if (home_level == "1" || home_level == null) {
//			home_level = "초급";
//		} else if (home_level == "2") {
//			home_level = "중급";
//		} else
//			home_level = "고급";
//		
		System.out.println("ex/level.do 호출");
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String cate_no=request.getParameter("cate_no");
		
		String h_l="";
		int home_level=Integer.parseInt(request.getParameter("home_level"));
		if(home_level==1)
		{
		 h_l="초급";
		}
		else if(home_level==2)
		{
		 h_l="중급";
		}
		else
			h_l="고급";
		
		System.out.println(h_l);
		
		if(h_l.equals("초급"))
		{
			home_level=1;
		}
		else if(h_l.equals("중급"))
		{
			home_level=2;
		}
		else
		{
			home_level=3;
		}
		
		
		// DAO 호출 -> MAPP
		Map map = new HashMap();

		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;

		System.out.println(h_l);
		
		map.put("cate_no",cate_no);
		map.put("home_level",h_l);
		map.put("start",start);
		map.put("end",end);

		List<ExVO> list = new ArrayList<ExVO>();
		list = ExDAO.exLevelData(map);
	    int totalpage=ExDAO.exLevelTotalPage(map);
		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }
	    request.setAttribute("A",home_level);
	    request.setAttribute("B", cate_no);
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../ex/level.jsp";
	}
	@RequestMapping("ex/search.do")
	public String search(HttpServletRequest request)
	{
		String subject=request.getParameter("subject");
		System.out.println(subject);
		
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		System.out.println("page"+page);
		
		int curpage = Integer.parseInt(page);
		
		int rowSize = 12;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;

		Map map = new HashMap();
		map.put("subject", subject);
		map.put("start", start);
		map.put("end", end);
		
//		System.out.println("map 끝 써치 시작");
		List<ExVO> list=ExDAO.searchData(map);
		
//		System.out.println("total 시작합니다");
		int totalpage=ExDAO.searchTotalPage(map);
		
//		System.out.println("total 끝납니다");
//		System.out.println("total="+totalpage);
		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

	       if(endPage>totalpage)
	       {
	          endPage = totalpage;
	       }

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		return "../ex/search.jsp";
	}
	
	@RequestMapping("ex/ex_mypage.do")
	public String ex_mypage(HttpServletRequest request)
	{
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<ExVO> list=ExDAO.mypageListData(id);
		request.setAttribute("list", list);
		
		
		 request.setAttribute("main_jsp", "../ex/ex_mypage.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("ex/ex_favorite.do")
	public String ex_favorites(HttpServletRequest request)
	{
		String home_no=request.getParameter("home_no");
		System.out.println("홈확인:"+home_no);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println("id확인:"+id);
		FavoritesVO vo=new FavoritesVO();
		vo.setId(id);
		vo.setHome_no(Integer.parseInt(home_no));
		System.out.println(vo.getId());
		System.out.println(vo.getHome_no());
		ExDAO.favInsert(vo);
		return "redirect:../ex/ex_detail.do?home_no="+home_no;
	}

}
