package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;

import oracle.net.aso.p;

import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;

public class CertifiedModel {
	@RequestMapping("challenge/Challenge.do")
	public String challenge(HttpServletRequest request) {
		// 사용자의 요청 값을 받는다
		// String page(X) ==> page는 내장 객체 ==> (page=this)
		String strPage = request.getParameter("page");
		// Default Page => page값를 지정
		if (strPage == null) // page번호가 지정이 없는 경우 (맨처음 실행)
		{
			strPage = "1";
		}

		// 현재 페이지 지정
		int curpage = Integer.parseInt(strPage);

		// 현재 페이지에 해당되는 데이터를 DAO요청
		Map map = new HashMap(); // map => 저장 공간 => key,실제값
		int rowSize = 12;
		int start = (rowSize * curpage) - (rowSize - 1); // 12-11 ==> 1 (오라클 => rownum : 시작번호가 1)
		int end = rowSize * curpage; // curpage=1 => 1~12
		// WHERE num BETWEEN #{start} AND #{end}

		// map에 저장
		map.put("start", start);
		map.put("end", end);

		List<ChallengeVO> list = Challenge_CertifiedDAO.ChallengeListData(map);
		System.out.println("" + list.size());

		request.setAttribute("list", list);
		request.setAttribute("start", start);
		request.setAttribute("end", end);

		request.setAttribute("main_jsp", "../challenge/Challenge.jsp");
		return "../main/main.jsp";
	}

	// 챌린지 디테일 부분
	@RequestMapping("challenge/Certified_detail.do")
	public String Certified_detail(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String challenge_no = request.getParameter("challenge_no");
		String challenge_id = (String) session.getAttribute("id");
		if (challenge_id == null) {
			challenge_id = "null";
		}
		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster"; // 파일이
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		
		// 챌린지 디테일 가져오는 부분
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));
		// ==================
		String end_day=vo.getDb_end_day();
		System.out.println("end day는?"+end_day);
		// 챌린지 시작날짜와 '오늘' 을 비교해서 수정이 가능한지 불가능한지 나타내는 부분
		Date saveDate = new Date();
		long tempTime = saveDate.getTime();
		SimpleDateFormat sdfCurrent = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp currentTime = new Timestamp(tempTime);
		String today = sdfCurrent.format(currentTime);
		int compare = today.compareTo(vo.getDb_start_day());
		System.out.println("날짜 출력하려나 ?" + today);
		System.out.println("날짜 비교 값?" + compare);
		// ====================================================
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd");
		String onl = sdf.format(currentTime);
		long diffDay=0;
		System.out.println("오늘은?"+onl);
		try {
			Date challenge_today= sdf.parse(onl);
			Date challenge_start=sdf.parse(sdf.format(vo.getStart_day()));
		
			diffDay = (challenge_today.getTime() - challenge_start.getTime()) / (24*60*60*1000);
            System.out.println(diffDay+"일");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// 챌린지 방에 해당하는 인증 리스트 가져오는 부분
		List<Challenge_CertifiedVO> list = Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));
		// =============================

		
		// 방에 유저가 있는지 없는지 검색하는 부분
		Challenge_ParticipationVO parti_vo = new Challenge_ParticipationVO();
		parti_vo.setChallenge_id(challenge_id);
		parti_vo.setChallenge_no(Integer.parseInt(challenge_no));
		System.out.println("챌린지 참가 아이디 " + challenge_id);
		System.out.println("챌린지 방 번호 " + challenge_no);
		int count = Challenge_CertifiedDAO.Challnege_paticipation_check(parti_vo);
		// =========================
		
		
		// 유저가 방장인지 아닌지 검사하는 부분
		if (challenge_id.equals(vo.getId_leader()))
			count = 3;
		// =======================

		
		// 해당 유저가 오늘 인증 했는지 안했는지 확인하는 부분 
		Challenge_CertifiedVO certi_vo = new Challenge_CertifiedVO();
		certi_vo.setChallenge_id(challenge_id);
		certi_vo.setChallenge_no(Integer.parseInt(challenge_no));
		certi_vo.setDb_Certified_date(today);
		// ================================
		
		
		// 오늘 인증 횟수 ==========================
		int today_certified_count = Challenge_CertifiedDAO.certified_check(certi_vo);
		System.out.println("오늘 사용자가 인증 했는지 안했는지"+today_certified_count);
		// =================================
		
		
		// 사용자 총 인증 횟수 ======================
		Challenge_CertifiedVO certified_count_vo = new Challenge_CertifiedVO();
		certified_count_vo.setChallenge_no(Integer.parseInt(challenge_no));
		certified_count_vo.setChallenge_id(challenge_id);
		int id_certified_count = Challenge_CertifiedDAO.certified_count(certified_count_vo);
		System.out.println("사용자 총 인증 횟수는?"+id_certified_count);
		// ==================================
		
		//현재 방에 참여중인 인원의 id가져오는 부분
		List<Challenge_ParticipationVO> people_list = Challenge_CertifiedDAO.challenge_people(Integer.parseInt(challenge_no));
		//=======================================
		
		//현재 방에 인증 Rank 순위 가져오기 (certified_no 에   인증 횟수로 받아왔음  일단은)
		List<Challenge_CertifiedVO> rank_list = Challenge_CertifiedDAO.certified_ranking(Integer.parseInt(challenge_no));
		System.out.println("rank_list.size()== "+rank_list.size());
		
		Challenge_CertifiedVO rank_1= new Challenge_CertifiedVO();
		Challenge_CertifiedVO rank_2= new Challenge_CertifiedVO();
		Challenge_CertifiedVO rank_3= new Challenge_CertifiedVO();
		try {
			if(rank_list.size()!=0)
			{
				rank_1= rank_list.get(0);
				rank_2= rank_list.get(1);
				rank_3= rank_list.get(2);
			}
		}catch (Exception e) {
			
		}
		//=================================
		
		//도전한 백분률 구하는 부분 
		int Period=(int)vo.getPeriod();
		System.out.println("temp ="+Period);
		int test= today_certified_count*Period;
		System.out.println("test값 ="+test);
		double percent = (double)today_certified_count/(double)Period*100.0;
		System.out.println("참여율 ="+percent+"%");
		String str = String.format("%.1f", percent);
		System.out.println(Double.parseDouble(str));
		//=============================
		
		// 현재 진행률 구하는 부분============
		String room_percent_str="0";
		if(diffDay>0)
		{
		 double room_percent =	(double)diffDay/(double)Period*100.0;
		 room_percent_str = String.format("%.1f", room_percent);
		}
		System.out.println("두구두구"+Double.parseDouble(room_percent_str));
		// ===========================
		
		
		// 현재 방에 있는 댓글 가져오기 
		ReplyVO Reply_vo = new ReplyVO();
		Reply_vo.setCate_no(9);
		Reply_vo.setNo(Integer.parseInt(challenge_no));
		List<ReplyVO> Reply_list = Challenge_CertifiedDAO.challeng_reply(Reply_vo);
		System.out.println("댓글 갯수"+Reply_list.size());
		//=============================
		
		System.out.println("로그인이 1이면 되어있는거야! " + count);
		
		//순위 던지는 곳
		request.setAttribute("rank_1", rank_1);
		request.setAttribute("rank_2", rank_2);
		request.setAttribute("rank_3", rank_3);
		
		request.setAttribute("id_certified_count",id_certified_count);
		request.setAttribute("room_percent_str",Double.parseDouble(room_percent_str));
		request.setAttribute("diffDay",diffDay);
		request.setAttribute("Period", Period);
		request.setAttribute("Reply_list",Reply_list);
		request.setAttribute("percent",Double.parseDouble(str));
		request.setAttribute("rank_list",rank_list);
		request.setAttribute("people_list",people_list);
		request.setAttribute("certifeid_count",today_certified_count);
		request.setAttribute("compare",compare);
		request.setAttribute("count",count);
		request.setAttribute("vo",vo);
		request.setAttribute("Certifiedvo",list);
		request.setAttribute("main_jsp","../challenge/Certified_detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("challenge/Certified.do")
	public String Certified(HttpServletRequest request) {

		String challenge_no = request.getParameter("challenge_no");

		request.setAttribute("challenge_no", challenge_no);
		return "../challenge/Certified.jsp";
	}

	@RequestMapping("challenge/Certified_ok.do")
	public String Certified_ok(HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");// 한글 디코딩
		} catch (IOException e) {
			e.printStackTrace();
		}
		String filename = "";

//	    String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no; // 파일이 업로드가 되면 어디에 저장 폴더 
		String enctype = "UTF-8"; // 한글파일명을 사용 여부
		int size = 1024 * 1024 * 100;// 파일의 최대크기
		// 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
		Date saveDate = new Date();
		long tempTime = saveDate.getTime();
		SimpleDateFormat sdfCurrent = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Timestamp currentTime = new Timestamp(tempTime);
		String today = sdfCurrent.format(currentTime);

		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster"; // 파일이

		MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
		String challenge_no = mr.getParameter("challenge_no");
		// challenge_no=mr.getParameter("challenge_no");
		filename = mr.getFilesystemName("upload");
		File photopath = new File(path);
		File[] fileList = photopath.listFiles();
		int j = 1;
		System.out.println("파일 이름 길이" + filename.length());
		System.out.println("파일 길이" + fileList.length);
		System.out.println("no 번호는 과연?" + challenge_no);
		Challenge_CertifiedVO vo = new Challenge_CertifiedVO();

		if (filename == null)// 파일을 올리지 않을 경우
		{
			vo.setPoster("");
		} else// 파일 올릴 경우
		{
			vo.setPoster(filename);
			System.out.println("filename =" + filename);
		}
		vo.setCertified_check("Y");
		vo.setChallenge_no(Integer.parseInt(challenge_no));
		vo.setChallenge_id((String)session.getAttribute("id"));
		// DAO를 호출한 다음에 INSERT요청 => 저장하는 SQL (databoard-mapper.xml)
		Challenge_CertifiedDAO.Challenge_CertifiedUpload(vo); // 추가

		return "redirect:../challenge/Certified_detail.do?challenge_no="+challenge_no;
	}
	// 방 참가하기
	@RequestMapping("challenge/participation.do")
	public String participation(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("참여 하기 Model 동작");
		// private int challenge_no;
		// private String challnege_id;
		String challenge_no = request.getParameter("challenge_no");
		System.out.println("인증하는 챌린지 방 "+challenge_no);
		
//		String challenge_id = request.getParameter("challnege_id");
		// 아이디는 세션에서 받아와야함
		String challenge_id = (String) session.getAttribute("id");
		System.out.println("참가하는 세션아이디" + challenge_id);

		Challenge_ParticipationVO participation_vo = new Challenge_ParticipationVO();

		participation_vo.setChallenge_no(Integer.parseInt(challenge_no));
		participation_vo.setChallenge_id(challenge_id);
		Challenge_CertifiedDAO.Challenge_participation(participation_vo);

		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));
		List<Challenge_CertifiedVO> list = Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));

		request.setAttribute("vo", vo);
		request.setAttribute("Certifiedvo", list);
//		request.setAttribute("main_jsp", "../challenge/Certified_detail.jsp");
//		return "../main/main.jsp";
		return "redirect:../challenge/Certified_detail.do?challenge_no="+challenge_no;
	}

	@RequestMapping("challenge/challenge_room_update.do")
	public String challenge_room_update(HttpServletRequest request) {
		System.out.println("========Model 수정하기 부분 ========");

		// 방에 데이터를 불러와야 수정이가능 -> Detail 불러오는 DAO,Mapper그대로 사용가능할듯
		String challenge_no = request.getParameter("challenge_no");
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));

		System.out.println("========Model 수정하기 끝나는 부분 ========");
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../challenge/challenge_room_update.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("challenge_room/update_ok.do")
	public String challenge_room_update_ok(HttpServletRequest request) {
		System.out.println("========Model 업데이트 부분 ========");
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} // 한글 디코딩

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

		String challenge_no = mr.getParameter("challenge_no");
		String title = mr.getParameter("title"); // 업로드시에만 사용
		String limit = mr.getParameter("limit");
		String content = mr.getParameter("content");
		String cate = mr.getParameter("cate");
		String before_poster = mr.getParameter("before_poster");
		System.out.println("이전 사진이름" + before_poster);
		String start_day = mr.getParameter("start_day");
		String end_day = mr.getParameter("end_day");
		
		String id_leader = (String) session.getAttribute("id");
		
		path = path+"\\"+before_poster;
		File file = new File(path);
		if(file.exists())
		{
			if(file.delete())
			{
				System.out.println(before_poster+"의 파일 삭제!");
			}
			else
				System.out.println(before_poster+"의 파일 삭제 실패!");
		}else
			System.out.println("파일이 존재하지 않습니다.");
		
		// 받은 데이터들을 DAO => DAO에서 오라클에 INSERT
		ChallengeVO vo = new ChallengeVO();
		vo.setChallenge_no(Integer.parseInt(challenge_no));
		vo.setTitle(title);
		vo.setLimit(Integer.parseInt(limit));
		vo.setContent(content);
		vo.setCate(cate);
		vo.setDb_start_day(start_day);
		vo.setDb_end_day(end_day);
		vo.setId_leader(id_leader);
		// filename,filesize => 없는 경우 (파일을 올리지 않을 경우,파일 올릴 경우)
		String filename = mr.getFilesystemName("poster");
		// 사용자가 보낸 파일명을 읽어 온다
		// <input type=file name=upload size=20 class="input-sm">
		if (filename == null)// 파일을 올리지 않을 경우
		{
			vo.setPoster("");
		} else// 파일 올릴 경우
		{
			vo.setPoster(filename);
		}
		
		System.out.println("========Model 업데이트 끝나는 부분 ========");

		// 파일 수정한거 데이터 넘기는 부분
		Challenge_CertifiedDAO.Challenge_room_update(vo);

		/*
		 * 사용자 요청 ==> databoard-mapper.xml있는 SQL문장을 읽어 온다 (DAO => 읽어온 SQL문장을 실행 => JSP에
		 * 실행 결과출력 ) insert.jsp SQL DAO => 실행 boardInsert() insert_ok.jsp 호출 처리
		 */
		return "redirect:../challenge/list.do";
	}

	//방 삭제하는 부분
	@RequestMapping("challenge/challenge_room_delete.do")
	public String challenge_room_delte(HttpServletRequest request)
	{
		System.out.println("===challenge/challenge_room_delete.do 호출===");
		
		// 방 데이터 삭제하는 부분==================
		String challenge_no = request.getParameter("challenge_no");
		Challenge_CertifiedDAO.Challenge_room_delete(Integer.parseInt(challenge_no));
		// =================================
		
		
		//방 삭제시 파일 삭제하는 부분==========================================
		String before_poster=request.getParameter("poster");
		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster";
		String enctype = "UTF-8"; // 한글파일명을 사용 여부
		int size = 1024 * 1024 * 100;// 파일의 최대크기
		
		path = path+"\\"+before_poster;
		File file = new File(path);
		if(file.exists())
		{
			if(file.delete())
			{
				System.out.println(before_poster+"의 파일 삭제!");
			}
			else
				System.out.println(before_poster+"의 파일 삭제 실패!");
		}else
			System.out.println("파일이 존재하지 않습니다.");
		//============================================================
		
		
		System.out.println("===challenge/challenge_room_delete.do 끝===");
		return "redirect:../challenge/list.do";
	}
		@RequestMapping("challenge/kick_out.do")
		public String challenge_kick_out(HttpServletRequest request)
		{	
			String challenge_no = request.getParameter("challenge_no");
			String challenge_id = request.getParameter("challenge_id");	
			
		
			//방에서 강퇴당하면 사진도 삭제당함====
			Challenge_CertifiedVO kick_vo = new Challenge_CertifiedVO();
			System.out.println("삭제아이디!!"+challenge_id);
			System.out.println("삭제번호!!"+challenge_no);
			kick_vo.setChallenge_id(challenge_id);
			kick_vo.setChallenge_no(Integer.parseInt(challenge_no));
			List<String> list=Challenge_CertifiedDAO.kick_out_delete_poster(kick_vo);
			
			String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster";
			for(String a:list)
			{
//				a = a.substring(0,a.indexOf('.'));
//				System.out.println("a는"+a);
				path = path+"\\"+a;
				File file = new File(path);
				if(file.exists())
				{
					if(file.delete())
					{
						System.out.println(a+"의 파일 삭제!");
					}
					else
						System.out.println(a+"의 파일 삭제 실패!");
				}else
					System.out.println("파일이 존재하지 않습니다.");
				path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster";
			}
			
			//=========================
			
			//방장이 방에서  인원 강퇴하는 부분======
			Challenge_ParticipationVO vo = new Challenge_ParticipationVO();
			vo.setChallenge_id(challenge_id);
			vo.setChallenge_no(Integer.parseInt(challenge_no));
			Challenge_CertifiedDAO.participation_kick_out(vo);
			//===========================
			
			
			
			return "redirect:../challenge/Certified_detail.do?challenge_no="+challenge_no;
		}	
			
		@RequestMapping("challenge/reply_insert.do")
		public String challenge_reply_insert(HttpServletRequest request)
		{	
			   try
			   {
				   request.setCharacterEncoding("UTF-8");
				   
			   }catch(Exception ex) {}
			   String challenge_no = request.getParameter("challenge_no");
			   String content=request.getParameter("content");
			   System.out.println("challenge_no잘나오나?"+challenge_no);
			   System.out.println("내용잘나오고?"+content);
			   HttpSession session=request.getSession();
			   String id=(String)session.getAttribute("id");
			   String name=(String)session.getAttribute("name");
			   // VO에 담아서 => DAO
			   ReplyVO vo=new ReplyVO();
			   vo.setNo(Integer.parseInt(challenge_no));
			   vo.setId(id);
			   vo.setContent(content);
			   vo.setName(name);
			   vo.setCate_no(9); //챌린지 카테고리는 9번입니다.
			   // DAO연결 
			   Challenge_CertifiedDAO.challenge_reply_insert(vo);
//			   BoardDAO.replyInsert(vo);
			return "redirect:../challenge/Certified_detail.do?challenge_no="+challenge_no;
		}
		
}