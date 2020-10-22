package com.sist.model;

import com.sist.vo.*;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class ChallengeModel {
	@RequestMapping("challenge_room/list.do")
	public String challengeListData(HttpServletRequest request)
	{
		String page = request.getParameter("page");
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=20;
		int start=rowSize*(curpage-1)+1;
		int end=rowSize*curpage;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end",end);
		
		List<ChallengeVO> list = ChallengeDAO.challengeTotalListData(map);
				
		int totalpage=ChallengeDAO.challengeTotalPage();
		
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		
		for(ChallengeVO vo:list)
		{
			String str= vo.getTitle();
			if(str.length()>20)
			{
				str=str.substring(0,20);
				str+="...";
			}
			vo.setTitle(str);
		}
		
		if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("BLOCK", BLOCK);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("main_jsp", "../challenge_room/list.jsp");
		   return "../main/main.jsp";
		
	}
	
	@RequestMapping("challenge_room/detail.do")
	public String challengDetailData(HttpServletRequest request)
	{
		
		String challenge_no = request.getParameter("challenge_no");
		
		ChallengeVO vo = ChallengeDAO.challengDetailData(Integer.parseInt(challenge_no));
		List<Challenge_CertifiedVO> list= Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));
  
		
		request.setAttribute("vo", vo);
		request.setAttribute("Certifiedvo", list);
		request.setAttribute("main_jsp","../challenge_room/detail.jsp");
		return "../main/main.jsp";
	}
	
	
	/*
	 * <insert id="challengeInsert" parameterType="challengeVO">
 		INSERT INTO challenge VALUES(
 			challenge_no_seq.nextval,
 			#{start_day},
 			#{end_day},
 			#{poster},
 			#{title},
 			#{limit},
 			#{content},
 			#{cate},
 		)
 		</insert>
	 */

	@RequestMapping("challenge_room/insert.do")
	public String Certified(HttpServletRequest request)
	{
		request.setAttribute("main_jsp","../challenge_room/insert.jsp");
		return "../main/main.jsp";
	}	
	
	@RequestMapping("challenge_room/insert_ok.do")
	public String challengeInsert_Ok(HttpServletRequest request)
	{
		 try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}// 한글 디코딩
		 
	     String path="/Users/haeni/Documents/jsp-project/Homefit/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Home_fit2/challenge_poster";
	     String enctype="UTF-8"; //한글파일명을 사용 여부 
	     int size=1024*1024*100;//파일의 최대크기 
	     
	     // MultipartRequest : 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
	     MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

	     String title=mr.getParameter("title"); // 업로드시에만 사용
	     String limit=mr.getParameter("limit");
	     String content=mr.getParameter("content");
	     String cate = mr.getParameter("cate");
	     
	     String start_day=mr.getParameter("start_day");
	     String end_day=mr.getParameter("end_day");
	     
	     // 받은 데이터들을 DAO => DAO에서 오라클에 INSERT
	     ChallengeVO vo=new ChallengeVO();
	     vo.setTitle(title);
	     vo.setLimit(Integer.parseInt(limit));
	     vo.setContent(content);
	     vo.setCate(cate);
	    
	     vo.setDb_start_day(start_day);
	     vo.setDb_end_day(end_day);
	     vo.setId_leader("haenyi");
	     
	    
	     
	     // filename,filesize => 없는 경우 (파일을 올리지 않을 경우,파일 올릴 경우)
	     String filename=mr.getFilesystemName("poster");
	     // 사용자가 보낸 파일명을 읽어 온다 
	     // <input type=file name=upload size=20 class="input-sm">
	     if(filename==null)//파일을 올리지 않을 경우
	     {
	    	 vo.setPoster(" ");
	     }
	     else//파일 올릴 경우
	     {
	    	 vo.setPoster(filename);
	     }
	     
	     // DAO를 호출한 다음에 INSERT요청 => 저장하는 SQL (databoard-mapper.xml)
	     ChallengeDAO.challengeInsert(vo); // 추가 
	     /*
	         사용자 요청 ==> databoard-mapper.xml있는 SQL문장을 읽어 온다 (DAO => 읽어온 SQL문장을 실행 => JSP에 실행 결과출력 )
	       insert.jsp      SQL           DAO => 실행 boardInsert()       insert_ok.jsp 호출 처리
	     */
	     
	    request.setAttribute("main_jsp","../challenge_room/list.jsp");
		return "../main/main.jsp";
	}

}
