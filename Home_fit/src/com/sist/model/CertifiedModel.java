package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
	public String challenge(HttpServletRequest request)
	{
	// 사용자의 요청 값을 받는다
	// String page(X) ==> page는 내장 객체 ==> (page=this)
	String strPage=request.getParameter("page");
	// Default Page => page값를 지정
	if(strPage==null) // page번호가 지정이 없는 경우 (맨처음 실행)
	{
	   strPage="1";
	}
	
	// 현재 페이지 지정 
	int curpage=Integer.parseInt(strPage);
	
	// 현재 페이지에 해당되는 데이터를 DAO요청 
	Map map=new HashMap(); //map => 저장 공간 => key,실제값
	int rowSize=12;
	int start=(rowSize*curpage)-(rowSize-1); // 12-11 ==> 1 (오라클 => rownum : 시작번호가 1)
	int end=rowSize*curpage; // curpage=1 => 1~12
	// WHERE num BETWEEN #{start} AND #{end}
	
	// map에 저장 
	map.put("start",start);
	map.put("end",end);
	 
	List<ChallengeVO> list =  Challenge_CertifiedDAO.ChallengeListData(map);
	System.out.println(""+list.size());
		
	request.setAttribute("list", list);
	request.setAttribute("start", start);
	request.setAttribute("end", end);
	
	request.setAttribute("main_jsp","../challenge/Challenge.jsp");
	return "../main/main.jsp";
	} 
	
	
	@RequestMapping("challenge/Certified_detail.do")
	public String Certified_detail(HttpServletRequest request)
	{	
		HttpSession session=request.getSession();
		String challenge_no = request.getParameter("challenge_no");
		String challenge_id = (String) session.getAttribute("id");
		if(challenge_id==null)
		{
			challenge_id="null";
		}
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));
		List<Challenge_CertifiedVO> list= Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));
		
		
		//방에 유저가 있는지 없는지 검색하는 부분
		Challenge_ParticipationVO parti_vo = new Challenge_ParticipationVO();
		parti_vo.setChallenge_id(challenge_id);
		parti_vo.setChallenge_no(Integer.parseInt(challenge_no));
		System.out.println("챌린지 참가 아이디 "+challenge_id);
		System.out.println("챌린지 방 번호 "+challenge_no);
		int count = Challenge_CertifiedDAO.Challnege_paticipation_check(parti_vo);
		//=========================
		
		
		//유저가 방장인지 아닌지 검사하는 부분
		if(challenge_id.equals(vo.getId_leader()))
			count=3;
		//=======================
		
		
		System.out.println("로그인이 1이면 되어있는거야! "+count);					 	  
		request.setAttribute("count", count);
		request.setAttribute("vo",vo);
		request.setAttribute("Certifiedvo", list);
		request.setAttribute("main_jsp","../challenge/Certified_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("challenge/Certified.do")
	public String Certified(HttpServletRequest request)
	{
		
		String challenge_no = request.getParameter("challenge_no");
//		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no;
////		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no;
//		File Folder = new File(path);
//		
//		if(!Folder.exists())
//		{
//			try{
//				Folder.mkdir();
//				System.out.println("폴더가 생성되었습니다.");
//			}catch(Exception e){}
//		}else{
//			System.out.println("이미 폴더가 생성되어 있습니다.");
//		}
		   
		request.setAttribute("challenge_no", challenge_no);

		request.setAttribute("main_jsp","../challenge/Certified.jsp");
		return "../main/main.jsp";
	}	
		
	@RequestMapping("challenge/Certified_ok.do")
	public String Certified_ok(HttpServletRequest request) throws IOException
	{	
		System.out.println("??");
		 String filename ="";
		try {
	 	request.setCharacterEncoding("utf-8");// 한글 디코딩
		}catch (IOException e) {e.printStackTrace();
		}
	    
//	    String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no; // 파일이 업로드가 되면 어디에 저장 폴더 
	    String enctype="UTF-8"; //한글파일명을 사용 여부 
	    int size=1024*1024*100;//파일의 최대크기 
	      // 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
	    Date saveDate = new Date();
	 	long tempTime = saveDate.getTime();
	    SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	 	Timestamp currentTime = new Timestamp(tempTime);
	 	String today = sdfCurrent.format(currentTime);
	 	
	 	String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\challenge_poster"; // 파일이 업로드가 되면 어디에 저장 폴더 
		
	 	MultipartRequest mr = new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
	 	String challenge_no =mr.getParameter("challenge_no");
	 	//challenge_no=mr.getParameter("challenge_no");
		filename=mr.getFilesystemName("upload");
		File photopath = new File(path);
		File[] fileList = photopath.listFiles();
		int j=1;
		System.out.println("파일 이름 길이"+filename.length());
		System.out.println("파일 길이"+fileList.length);
			System.out.println("no 번호는 과연?"+challenge_no);
	    	Challenge_CertifiedVO vo = new Challenge_CertifiedVO();
	      
	      if(filename==null)//파일을 올리지 않을 경우
	      {
	      	 vo.setPoster("");
	      }
	      else//파일 올릴 경우	
	      { 
	      	 vo.setPoster(filename);
	      	 System.out.println("filename ="+filename);
	      }
	      vo.setCertified_check("Y");
	      vo.setChallenge_no(Integer.parseInt(challenge_no));
	      vo.setChallenge_id("ji");
	      // DAO를 호출한 다음에 INSERT요청 => 저장하는 SQL (databoard-mapper.xml)
	      Challenge_CertifiedDAO.Challenge_CertifiedUpload(vo); // 추가 
	      
	    return "redirect:../challenge/Challenge.do";	    
	}
	
	//방 참가하기 
	@RequestMapping("challenge/participation.do")
	public String participation(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		System.out.println("참여 하기 Model 동작");
		//	private int challenge_no;
		//  private String challnege_id;
		String challenge_no = request.getParameter("challenge_no");
//		String challenge_id = request.getParameter("challnege_id");
		//아이디는 세션에서 받아와야함
		String challenge_id = (String) session.getAttribute("id");
		System.out.println("참가하는 세션아이디"+challenge_id);
		
		Challenge_ParticipationVO participation_vo = new Challenge_ParticipationVO();
		
		participation_vo.setChallenge_no(Integer.parseInt(challenge_no));
		participation_vo.setChallenge_id(challenge_id);
		Challenge_CertifiedDAO.Challenge_participation(participation_vo);
		
		
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));
		List<Challenge_CertifiedVO> list= Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("Certifiedvo", list);
		request.setAttribute("main_jsp","../challenge/Certified_detail.jsp");
		return "../main/main.jsp";
	}	
		
	//로그아웃 버튼  임시로 구현함.  2020-10-23
	   @RequestMapping("member/logout.do")
	   public String member_logout(HttpServletRequest request)
	   {
		   HttpSession session=request.getSession();
		   System.out.println("세션 로그아웃전!"+session.getAttribute("id"));
		   session.invalidate();
//	   	   request.setAttribute("main_jsp","../challenge/Challenge.jsp");
	   		return "redirect:../challenge/Challenge.do";
	   }
	   
	   
	   
	   @RequestMapping("member/login.do")
	   public String member_login(HttpServletRequest request)
	   {
	   		HttpSession session=request.getSession();
		    session.setAttribute("id", "seunggu");
			System.out.println("아이디 출력되나?"+session.getAttribute("id"));
//		   request.setAttribute("main_jsp","../challenge/Challenge.jsp");
			return "redirect:../challenge/Challenge.do";
	   }
	   
}