package com.sist.model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.ChallengeDAO;
import com.sist.dao.Challenge_CertifiedDAO;
import com.sist.vo.ChallengeVO;
import com.sist.vo.Challenge_ParticipationVO;

public class ChallengeModel {
		
	
	
	
	
// 검색 필터 적용한 리스트
	
	// 도전 목록: list
		@RequestMapping("challenge/list2.do")
		public String listtest(HttpServletRequest request) {
			
			request.setAttribute("main_jsp", "../challenge/list2.jsp");
			return "../main/main.jsp";
		}	
	
	
	// 도전 목록: sublist
	@RequestMapping("challenge/sublist2.do")
	public String test(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		// 카테고리 정보 받기
		String cate = request.getParameter("cate");
		
		// 페이징 처리
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		int start = rowSize * (curpage - 1) + 1;
		int end = rowSize * curpage;


		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		
		
		
		// 목록 리스트 데이터 결과값 받기
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("cate", cate);
		
		int totalpage = ChallengeDAO.challengFilterTotalPage(map);
		
		if (endPage > totalpage)
			endPage = totalpage;

		List<ChallengeVO> list = ChallengeDAO.challengeFilterList(map);
		
		// 아이디 받기
		HttpSession session=request.getSession();
		String id = (String) session.getAttribute("id");
		
		
		// 게시날짜와 비교할 오늘날짜 받기
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(date);
		
		for (ChallengeVO vo : list) {
			
			// 제목 글자수 자르기
			String str = vo.getTitle();
			if (str.length() > 20) {
				str = str.substring(0, 10);
				str += "...";
			}
			vo.setTitle(str);
			
			int no=vo.getChallenge_no();
			
			// 참여중인지 확인하기
			Challenge_ParticipationVO pVO=new Challenge_ParticipationVO();
			pVO.setChallenge_id(id);
			pVO.setChallenge_no(no);
			int ptCheck = Challenge_CertifiedDAO.Challnege_paticipation_check(pVO);
			vo.setParticipantionCheck(ptCheck);

			// 방의 총 인원 수 구하기
			int total=ChallengeDAO.totalPaticipantCount(pVO.getChallenge_no());
			vo.setParticipantCount(total);
			
			String state ="";
			// d-day , 진행중, 대기중 , 완료 확인하기
//			if(vo.getStart_day() < today)
//			{
//				state="대기중";
//			}
			
		}	
		
		request.setAttribute("today", today);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../challenge/sublist2.jsp";

	}
	
	// 도전 목록: list
	@RequestMapping("challenge/list.do")
	public String challengeListData(HttpServletRequest request) {
		
		request.setAttribute("main_jsp", "../challenge/list.jsp");
		return "../main/main.jsp";

	}	
	
	
	// 도전 목록: sublist
	@RequestMapping("challenge/sublist.do")
	public String subListData(HttpServletRequest request) {
		System.out.println("sublist 호출 했음");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		// 카테고리 정보 받기
		String cate = request.getParameter("cate");
		System.out.println("cate!!!!!!!!!!!!!!!!"+cate);
		// 페이징 처리
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		int start = rowSize * (curpage - 1) + 1;
		int end = rowSize * curpage;

		int totalpage = ChallengeDAO.challengeCateTotalPage(cate);

		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		
		if (endPage > totalpage)
			endPage = totalpage;
		
		// 목록 리스트 데이터 결과값 받기
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("cate", cate);
		List<ChallengeVO> list = ChallengeDAO.challengeCateListData(map);
		
		// 아이디 받기
		HttpSession session=request.getSession();
		String id = (String) session.getAttribute("id");
		
		
		// 게시날짜와 비교할 오늘날짜 받기
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(date);
		
		for (ChallengeVO vo : list) {
			
			// 제목 글자수 자르기
			String str = vo.getTitle();
			if (str.length() > 20) {
				str = str.substring(0, 10);
				str += "...";
			}
			vo.setTitle(str);
			
			int no=vo.getChallenge_no();
			
			// 참여중인지 확인하기
			Challenge_ParticipationVO pVO=new Challenge_ParticipationVO();
			pVO.setChallenge_id(id);
			pVO.setChallenge_no(no);
			int ptCheck = Challenge_CertifiedDAO.Challnege_paticipation_check(pVO);
			vo.setParticipantionCheck(ptCheck);

			// 방의 총 인원 수 구하기
			int total=ChallengeDAO.totalPaticipantCount(pVO.getChallenge_no());
			vo.setParticipantCount(total);
			
			String state ="";
			// d-day , 진행중, 대기중 , 완료 확인하기
//			if(vo.getStart_day() < today)
//			{
//				state="대기중";
//			}
			
		}	
		
		request.setAttribute("today", today);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../challenge/sublist.jsp";

	}
	
	@RequestMapping("challenge/insert.do")
	public String Challenge_room_Certified(HttpServletRequest request) {
		request.setAttribute("main_jsp", "../challenge/insert.jsp");
		return "../main/main.jsp";
	}

	// 새로운 도전방 만들기
	@RequestMapping("challenge/insert_ok.do")
	public String challengeInsert_Ok(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} // 한글 디코딩

//		String path = "/Users/haeni/Documents/jsp-project/Homefit/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Home_fit/challenge_poster";
		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster";
		String enctype = "UTF-8"; // 한글파일명을 사용 여부
		int size = 1024 * 1024 * 100;// 파일의 최대크기

		// MultipartRequest : 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

		String title = mr.getParameter("title"); // 업로드시에만 사용
		String limit = mr.getParameter("limit");
		String content = mr.getParameter("content");
		String cate = mr.getParameter("cate");
		
		String id_leader = (String) session.getAttribute("id");
		
		String start_day = mr.getParameter("start_day");
		String end_day = mr.getParameter("end_day");
		
		long difDays = 0;
		
		try {
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			Date start_date=format.parse(start_day);
			Date end_date=format.parse(end_day);
			
			long dif=end_date.getTime() - start_date.getTime();
			difDays =dif/(24*60*60*1000);
			difDays=Math.abs(difDays)+1;
		} catch (Exception e) {
			System.out.println("period오류");
		}
		
		// 받은 데이터들을 DAO => DAO에서 오라클에 INSERT
		ChallengeVO vo = new ChallengeVO();
		vo.setTitle(title);
		vo.setLimit(Integer.parseInt(limit));
		vo.setContent(content);
		vo.setCate(cate);
		
		vo.setId_leader(id_leader);
		
		vo.setDb_start_day(start_day);
		vo.setDb_end_day(end_day);
		vo.setPeriod(difDays);

		String filename = mr.getFilesystemName("poster");

		if (filename == null)// 파일을 올리지 않을 경우
		{
			vo.setPoster("ChallengeDefault.jpg");
		} else// 파일 올릴 경우
		{
			vo.setPoster(filename);
		}

		ChallengeDAO.challengeInsert(vo); // 추가
		
		// 방금 만든 방의 번호
		int challenge_no = vo.getChallenge_no();
		Challenge_ParticipationVO pVO = new Challenge_ParticipationVO();

		pVO.setChallenge_no(challenge_no);
		pVO.setChallenge_id(id_leader);

		// 방장도 참가자 목록에 추가하기
		Challenge_CertifiedDAO.Challenge_participation(pVO);
		
		System.out.println("challenge_no:"+pVO.getChallenge_no());
		System.out.println("challenge_id:"+pVO.getChallenge_id());

//		request.setAttribute("main_jsp", "../challenge/list.jsp");
//		return "../main/main.jsp";
		return "redirect:../challenge/list.do";
	}
	


}
