package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;

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
		
		String challenge_no = request.getParameter("challenge_no");
		
		ChallengeVO vo = Challenge_CertifiedDAO.ChallengeDetailData(Integer.parseInt(challenge_no));
		List<Challenge_CertifiedVO> list= Challenge_CertifiedDAO.CertifiedData(Integer.parseInt(challenge_no));
  
		
		request.setAttribute("vo", vo);
		request.setAttribute("Certifiedvo", list);
		request.setAttribute("main_jsp","../challenge/Certified_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("challenge/Certified.do")
	public String Certified(HttpServletRequest request)
	{
		
		
		String challenge_no = request.getParameter("challenge_no");
		String path = "C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no;
		File Folder = new File(path);
		
		if(!Folder.exists())
		{
			try{
				Folder.mkdir();
				System.out.println("폴더가 생성되었습니다.");
			}catch(Exception e){}
		}else{
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		request.setAttribute("challenge_no", challenge_no);
		request.setAttribute("main_jsp","../challenge/Certified.jsp");
		return "../main/main.jsp";
	}	
		
	@RequestMapping("challenge/Certified_ok.do")
	public String Certified_ok(HttpServletRequest request)
	{	
		System.out.println("??");
		 MultipartRequest mr;
		 String filename ="";
		    
		try {
	 	request.setCharacterEncoding("utf-8");// 한글 디코딩
		}catch (IOException e) {e.printStackTrace();
		}
	     String challenge_no= request.getParameter("challenge_no");
	     System.out.println("no 번호는 과연?"+challenge_no);
	     
	    String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Home_fit\\"+challenge_no; // 파일이 업로드가 되면 어디에 저장 폴더 
	    String enctype="UTF-8"; //한글파일명을 사용 여부 
	    int size=1024*1024*100;//파일의 최대크기 
	      // 사용자가 보내준 데이터를 받는다 (request=>파일을 받을 수 없다 , 일반데이터만 받는다)
	    Date saveDate = new Date();
	 	long tempTime = saveDate.getTime();
	    SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	 	Timestamp currentTime = new Timestamp(tempTime);
	 	String today = sdfCurrent.format(currentTime);
	      
	   
		try {
			mr = new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
			filename=mr.getOriginalFileName("upload");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	 /*     
	      String name=mr.getParameter("name"); // 업로드시에만 사용
	      String subject=mr.getParameter("subject");
	      String content=mr.getParameter("content");
	      String pwd=mr.getParameter("pwd");
	 */   
	      // 받은 데이터들을 DAO => DAO에서 오라클에 INSERT
	      Challenge_CertifiedVO vo = new Challenge_CertifiedVO();
	      
	      vo.setCertified_check("Y");
	      vo.setChallenge_no(Integer.parseInt(challenge_no));
	      vo.setChallenge_id("ji");
	      // filename,filesize => 없는 경우 (파일을 올리지 않을 경우,파일 올릴 경우)
	    
	      // 사용자가 보낸 파일명을 읽어 온다 
	      // <input type=file name=upload size=20 class="input-sm">
	      if(filename==null)//파일을 올리지 않을 경우
	      {
	      	 vo.setPoster("");
	      }
	      
	      else//파일 올릴 경우	
	      { 
	      	 vo.setPoster(filename);
	      	 System.out.println("filename은 ?"+filename);
	      }
	      
	      // DAO를 호출한 다음에 INSERT요청 => 저장하는 SQL (databoard-mapper.xml)
	      Challenge_CertifiedDAO.Challenge_CertifiedUpload(vo); // 추가 
	    return "redirect:../main/main.do";	    
	}
}