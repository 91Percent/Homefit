package com.sist.model;


import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	 // 코치 상세페이지
	 @RequestMapping("coach/info.do")
	 public String coachDetailData(HttpServletRequest request)
	 {		
		 	
		 String coach_no=request.getParameter("coach_no");
		 String content=request.getParameter("content");	
		 
		 String reserve_check=request.getParameter("reserve_check");
		 
		 
		 //코치 디테일 데이터 가져오는 부분
		 tutor_VO vo=CoachDAO.coachDeatilData(Integer.parseInt(coach_no));
		 //=====================
		 
		 int cate_no = vo.getCate_no();
		 
		 
		 // 코치 스케쥴 데이터 가져오는 부분 
		 ScheduleVO svo= new ScheduleVO();
		 List<ScheduleVO> slist = new ArrayList<ScheduleVO>();
		 svo.setCoach_no(Integer.parseInt(coach_no));
		 
		 
		 
		 
		 svo.setReserve_check(reserve_check);
		 if(reserve_check=="n")
		 {
			 svo.setReserve_check("예약불가"+reserve_check);
			 System.out.println("예약불가:"+reserve_check);
		 }
		
		 
		 
		 slist = CoachDAO.scheduleData(svo);		 
		 System.out.println("사이즈 "+slist.size());
		 //=================================
		 
		 // 댓글
		 ReplyVO Reply_vo = new ReplyVO();
			Reply_vo.setNo(Integer.parseInt(coach_no));
			Reply_vo.setCate_no(cate_no);
			Reply_vo.setContent(content);
			List<ReplyVO> coachReply_list = CoachDAO.coach_reply(Reply_vo);
			System.out.println("댓글 갯수"+coachReply_list.size());
		 
		 
		 //1.매퍼 만들고 ( coach_no 에 해당하는 스케쥴 정보)
		 //2.연결하는 부분 dao에서 데이터 받고
		 //3. 여기서 호출 하면 !
		 request.setAttribute("vo", vo);
		 request.setAttribute("svo", svo);
		 request.setAttribute("slist", slist);
		 request.setAttribute("coachReply_list", coachReply_list);
		 request.setAttribute("main_jsp", "../coach/info.jsp");
		 return "../main/main.jsp";
	 }
	 ////////////////////////////////////////////////////////////////////////////////////////
	 
	
	 
	 // 예약페이지
	 @RequestMapping("coachreserve/reserve.do")
	 public String reserve_page(HttpServletRequest request)
	 {
		 request.setAttribute("main_jsp", "../coachreserve/reserve.jsp");
		 return "../main/main.jsp";
	 }
	 
	 
	 
	 // 예약페이지 코치데이터
	 @RequestMapping("coachreserve/coach.do")
	 public String reserve_coach(HttpServletRequest request)
	 {
		 List<tutor_VO> list=CoachDAO.coachReserveData();
		 request.setAttribute("list", list);
		 return "../coachreserve/coach.jsp";
	 }
	 // 예약페이지 코치스케쥴데이터(장소)
	 @RequestMapping("coachreserve/place.do")
	 public String place_schedule(HttpServletRequest request)
	 {
		 String no = request.getParameter("cno");
		 //System.out.println("no 값은?"+no);
		 List<ScheduleVO> list=CoachDAO.scheduleListData2(Integer.parseInt(no));
		 //System.out.println("list"+list.size());
		 request.setAttribute("list", list);
		 return "../coachreserve/place.jsp";
	 }
	 // 예약페이지 코치스케쥴데이터(월별)
	 @RequestMapping("coachreserve/month.do")
	 public String month_schedule(HttpServletRequest request)
	 {
		 String no=request.getParameter("cno");
		 List<ScheduleVO> list=CoachDAO.scheduleListData2(Integer.parseInt(no));
		 request.setAttribute("list", list);
		 return "../coachreserve/month.jsp";
	 }
	 // 예약페이지 코치스케쥴데이터(시간)
	 @RequestMapping("coachreserve/time.do")
	 public String time_schedule(HttpServletRequest request)
	 {
		 String no=request.getParameter("cno");
		 List<ScheduleVO> list=CoachDAO.scheduleListData2(Integer.parseInt(no));
		 request.setAttribute("list", list);
		 return "../coachreserve/time.jsp";
	 }
	 // 예약페이지 코치스케쥴데이터(금액)
	 @RequestMapping("coachreserve/price.do")
	 public String price_schedule(HttpServletRequest request)
	 {
		 List<tutor_VO> list=CoachDAO.coachReserveData();
		 request.setAttribute("list", list);
		 return "../coachreserve/price.jsp";
	 }
	 // 예약페이지 코치예약번호
	 
	 
	 // 예약하기
	 @RequestMapping("coachreserve/reserve_ok.do")
	 public String coachreserve_ok(HttpServletRequest request)
	 {
		 System.out.println("호출");
		 try
		 {
			 request.setCharacterEncoding("UTF-8");
		 }catch(Exception ex) {}
		 
		 String Coach_no=request.getParameter("coach_no");
		 String Schedule_no=request.getParameter("schedule_no");
		 
		 
		 System.out.println("cno="+Coach_no);
		 System.out.println("sno="+Schedule_no);
		 
		 
		 
		 //String place=request.getParameter("place");
		 //String month=request.getParameter("month");
		 //String time=request.getParameter("time");	
		 //String price=request.getParameter("price");
		 
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		
		 
		 
			 
		 
		 
		 
		 Coach_ReserveVO vo=new Coach_ReserveVO();
		 vo.setId(id);
		 vo.setCoach_no(Integer.parseInt(Coach_no));
		 vo.setSchedule_no(Integer.parseInt(Schedule_no));
		 
		 
		 
//		 ScheduleVO svo=new ScheduleVO();
//		 svo.setCoach_no(Integer.parseInt(Coach_no));
//		 svo.setSchedule_no(Integer.parseInt(Schedule_no));

		 
		 
		 CoachDAO.coachreserveInsert(vo);
		 
		 Map map=new HashMap();
		 map.put("coach_no",Coach_no );
		 map.put("schedule_no",Schedule_no);
		 CoachDAO.coachreserveCheck(map);
		 //CoachDAO.coachInfoReserveCheck(map);
		 return "redirect:../coachreserve/gogomypage.do";
	 }
	
	/// 에약 삭제
	 @RequestMapping("coachreserve/mypage_delete.do")
	 public String coach_reverve_delete(HttpServletRequest request)
	 {
		 System.out.println("삭제 호출");
		 String Schedule_no=request.getParameter("Schedule_no");
		 System.out.println("스케쥴넘버:"+Schedule_no);
		 CoachDAO.coachreserveDelete(Integer.parseInt(Schedule_no));
		 
		 
		 // 코치 예상 상태 y로 변경
//		 String reserve_check=request.getParameter("reserve_check");
		 CoachDAO.coachcancelOk(Integer.parseInt(Schedule_no));
		 
		 
		 
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 
		 
		 List<Coach_ReserveVO> list=CoachDAO.coachreserveList(id);
		 System.out.println("사이즈는 !!"+list.size());
		 request.setAttribute("list", list);
		 
		 return "../coachreserve/mypage.jsp";
	 }
	 
	 
	 
	 
	 ///////////////////////////////////////////////////////////////////////////////
	 /////////////////////////////////////////////////////////////////////////////
	 // Q&A
	 
	 @RequestMapping("coach/qna.do")
	 public String coach_qna(HttpServletRequest request)
	 {
		 List<tutor_VO> list=CoachDAO.coachReserveData();
		 request.setAttribute("list", list);
		 
		 //List<CoachQnaVO> list=CoachDAO.coachQnaList();
		 request.setAttribute("main_jsp","../coach/qna.jsp");
		 return "../main/main.jsp";
	 }
	 
	 @RequestMapping("coach/coach_qna.do")
	 public String coach_qna_board(HttpServletRequest request)
	 {
		 String coach_no = request.getParameter("coach_no");
		 System.out.println("코치번호"+coach_no);
		 
		 
		//코치 디테일 데이터 가져오는 부분
		 tutor_VO vo=CoachDAO.coachDeatilData(Integer.parseInt(coach_no));
		 //=====================
		 
		 List<CoachQnaVO> list = CoachDAO.coachQnaList(Integer.parseInt(coach_no));
		 System.out.println("코치 qna의 list사이즈"+list.size());
		 
		 Date date=new Date();
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 String today=sdf.format(date);
		   
		 request.setAttribute("today", today);
		 request.setAttribute("vo", vo);
		 request.setAttribute("list", list);
		 return "../coach/qna_sub.jsp";
	 }

	 @RequestMapping("coach/coach_qna_insert.do")
	 public String coach_qna_insert(HttpServletRequest request)
	 {
		 String coach_no = request.getParameter("coach_no");
		 
		 
		 request.setAttribute("coach_no", coach_no);
		 return "../coach/qna_insert.jsp";
	 }
	 
	 @RequestMapping("coach/coach_qna_insert_ok.do")
	 public String coach_qna_insert_ok(HttpServletRequest request)
	 {
		 System.out.println("insert_ok 호출");
		 try {
				request.setCharacterEncoding("UTF-8");
			 } catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			 }
		String coach_no = request.getParameter("coach_no");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String form = request.getParameter("formlist");
		
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 String name=(String)session.getAttribute("name");
		 
		 CoachQnaVO vo = new CoachQnaVO();
		 
		 vo.setCoach_no(Integer.parseInt(coach_no));
		 vo.setSubject(subject);
		 vo.setContent(content);
		 vo.setForm(form);
		 vo.setId(id);
		 vo.setName(name);
		
		 CoachDAO.CoachQnaInsert(vo);
		 
		 return "redirect:../coach/qna.do";
	 }
	 
	 @RequestMapping("coach/coach_qna_detail.do")
	 public String coach_qna_detail(HttpServletRequest request)
	 {
		 
		 String coach_qna_no=request.getParameter("coach_qna_no");
		 String coach_no=request.getParameter("coach_no");
		 
		 System.out.println("코치번호"+coach_no);
		 System.out.println("코치별 글 번호"+coach_qna_no);
		 
		 Map map = new HashMap();
		 map.put("coach_qna_no",coach_qna_no);
		 map.put("coach_no",coach_no);
		 
		   
		 CoachQnaVO vo =CoachDAO.coachQnaDetailData(map);
		 
		 request.setAttribute("vo", vo);
		 return "../coach/qna_detail.jsp";
	 }
	 
	 
	 // QnA 질문에 대한 코치 답변 
	 @RequestMapping("coach/qna_reply_insert.do")
	 public String qna_reply_insert(HttpServletRequest request)
	 {
		 System.out.println("코치 답변 qna_reply_insert 호출");
		 try {
				request.setCharacterEncoding("UTF-8");
			 } catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			 }
		 //여기서 필요한 데이터는 
		 //해당 글번호,해당 글번호의  group_tab
		 String coach_qna_no = request.getParameter("coach_qna_no");
		 String group_tab = request.getParameter("group_tab");
		 String coach_no = request.getParameter("coach_no");
		 String content = request.getParameter("content");
		 String group_id = request.getParameter("group_id");
		 
		 System.out.println("coach_qna_no "+coach_qna_no);
		 System.out.println("group_tab "+group_tab);
		 System.out.println("coach_no "+coach_no);
		 System.out.println("content "+content);
		 System.out.println("group_id "+group_id);
		 
		 //코치 이름 가져오는 부분
		 tutor_VO detail_vo=CoachDAO.coachDeatilData(Integer.parseInt(coach_no));
		 String name = detail_vo.getCoach_name();
		 //==============
		 
		 CoachQnaVO vo = new CoachQnaVO();
		 vo.setCoach_no(Integer.parseInt(coach_no));
		 vo.setCoach_qna_no(Integer.parseInt(coach_qna_no));
		 vo.setSubject("답글 내용");
		 vo.setContent(content);
		 vo.setId(name);
		 vo.setName(name);
		 vo.setGroup_tab(Integer.parseInt(group_tab)+1);
		 vo.setGroup_id(Integer.parseInt(group_id));
		 CoachDAO.CoachQnaReply(vo);
		 
		 return "redirect:../coach/qna.do";
	 }
	 /////////////////////////////////////////////////////////////////////////////////////////////////////
	 ///////////////////////////////////////////////////////////////////////////////////////////////////////
	 
	 
	 
	 
	 
	 
	 //댓글
	 @RequestMapping("coach/reply_insert.do")
	 public String coach_reply_insert(HttpServletRequest request)
	 {
		 try
		 {
			 request.setCharacterEncoding("UTF-8");
		 }catch(Exception ex) {}
		 
		 String coach_no=request.getParameter("coach_no");
//		 String no=request.getParameter("no");
		 String content=request.getParameter("content");
		 String cate_no=request.getParameter("cate_no");
		 System.out.println("코치번호 잘 나와라?"+coach_no);
		  System.out.println("내용잘나오고?"+content);
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 String name=(String)session.getAttribute("name");
		 
		 
		 ReplyVO rvo=new ReplyVO();
		 rvo.setNo(Integer.parseInt(coach_no));
		 rvo.setId(id);
		 rvo.setName(name);
		 rvo.setContent(content);
		 rvo.setCate_no(Integer.parseInt(cate_no));
		 
		 
		 CoachDAO.coach_reply_insert(rvo);
		 
		 return "redirect:../coach/info.do?coach_no="+coach_no;
	 }
	 
	 
	 @RequestMapping("coach/reply_update.do")
	 public String coach_reply_update(HttpServletRequest request)
	 {
		 // 데이터 받기
		 try
		 {
			 request.setCharacterEncoding("UTF-8");
		 }catch(Exception ex) {}
		 //String no=request.getParameter("no");
		 
		 
		 String coach_no=request.getParameter("coach_no");
		 String cate_no=request.getParameter("cate_no");
		 String content=request.getParameter("content");
		 System.out.println("코치:"+coach_no);
		 System.out.println("카테넘버:"+cate_no);
		 System.out.println("컨텐트:"+content);
		 
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 String name=(String)session.getAttribute("name");
		 
		 // DB
		 ReplyVO vo=new ReplyVO();
		
		 vo.setCate_no(Integer.parseInt(cate_no));
		 vo.setContent(content);
		 
		 CoachDAO.coach_reply_insert(vo);
		 return "redirect:../coach/info.do?coach_no="+coach_no;
	 }
	 
	 
	 
	 //////////////////////////////////////////////////////////////
	 //////////////////////////////////////////////////////////////
	 @RequestMapping("coachreserve/gogomypage.do")
	 public String gogomypage(HttpServletRequest request)
	 {
		 
		 
		request.setAttribute("main_jsp", "../mypage/mytest.jsp");
		return "../main/main.jsp";
	 }
	 /// 마이페이지!!!
	 @RequestMapping("coachreserve/mypage.do")
	 public String coach_mypage(HttpServletRequest request)
	 {
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 
		
		 
		 List<Coach_ReserveVO> list=CoachDAO.coachreserveList(id);
		 
		 
		 
		 System.out.println("사이즈는 !!"+list.size());
		 request.setAttribute("list", list);
		 
		 return "../coachreserve/mypage.jsp";
	 }
	 
	 
}