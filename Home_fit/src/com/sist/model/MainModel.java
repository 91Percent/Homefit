package com.sist.model;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.ExVO;
import com.sist.vo.MemberVO;
import com.sist.vo.ShopVO;
import com.sist.vo.tutor_VO;
/**
 * @author 이보미
 *
 */
public class MainModel {
  @RequestMapping("main/main.do")
  public String main_page(HttpServletRequest request)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  int a = (int)(Math.random()*3);
	  System.out.println("출력"+a);
	  
	  int[] ex={1,2,3};
	  int[] shop_arr= {41,43,45};
	  int[] coach_arr= {71,72,73};
	  String[] shop_text= {"식단","식사대용","단백질 보충"};
	  String[] ex_text= {"근력","요가","필라테스"};
	  String[] coach_text= {"PT","YOGA","Pilates"};
	  
	  if(id==null)
	  {
		  List<ExVO> list1 = MemberDAO.Non_members_Ex(ex[a]);
		  List<ShopVO> list2 = MemberDAO.Non_members_shop(shop_arr[a]);
		  List<tutor_VO> list3 = MemberDAO.Non_members_coach(coach_arr[a]);
		  String shoptext=shop_text[a];
		  String extext=ex_text[a];
		  String coachtext=coach_text[a];
		  // 랜덤처리 
		  Collections.shuffle(list1);
		  Collections.shuffle(list2);
		  Collections.shuffle(list3);
		  
		  request.setAttribute("shoptext",shoptext);
		  request.setAttribute("extext",extext);
		  request.setAttribute("coachtext",coachtext);
		  
		  request.setAttribute("list1", list1);
		  request.setAttribute("list2", list2);
		  request.setAttribute("list3", list3);
	  }
	  else 
	  {
		  List<MemberVO> list1 = new ArrayList<MemberVO>();
		  List<MemberVO> list2 = new ArrayList<MemberVO>();
		  
		  list1 = MemberDAO.memberRcList1(id);
		  list2 = MemberDAO.memberRcList2(id);

		  // 랜덤처리 
		  Collections.shuffle(list1);
		  Collections.shuffle(list2);
		  
		  request.setAttribute("list1", list1);
		  request.setAttribute("list2", list2);
	  }
	  
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  return "../main/main.jsp";
  }
}